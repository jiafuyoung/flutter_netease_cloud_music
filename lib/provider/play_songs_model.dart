import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music_flutter/http/preferences/song_preferences.dart';
import 'package:netease_cloud_music_flutter/page/secondary_page/song/api/api_song.dart';
import 'package:netease_cloud_music_flutter/utils/fluro_convert_utils.dart';
import 'package:netease_cloud_music_flutter/utils/log_utils.dart';

import '../page/secondary_page/song/model/song.dart';

class PlaySongsModel with ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final StreamController<String> _curPositionController =
      StreamController<String>.broadcast();

  List<Song> _songs = [];
  int curIndex = 0;
  late Duration curSongDuration;
  PlayerState _curState = PlayerState.stopped;
  List<Song> get allSongs => _songs;
  Song get curSong => _songs[curIndex];
  Stream<String> get curPositionStream => _curPositionController.stream;
  PlayerState get curState => _curState;

  void init() {
    _audioPlayer.setReleaseMode(ReleaseMode.stop);
    // 播放状态监听
    _audioPlayer.onPlayerStateChanged.listen((state) {
      _curState = state;

      /// 先做顺序播放
      if (state == PlayerState.completed) {
        nextPlay();
      }
      // 其实也只有在播放状态更新时才需要通知。
      notifyListeners();
    });
    _audioPlayer.onDurationChanged.listen((d) {
      curSongDuration = d;
    });
    // 当前播放进度监听
    _audioPlayer.onPositionChanged.listen((Duration p) {
      sinkProgress(p.inMilliseconds > curSongDuration.inMilliseconds
          ? curSongDuration.inMilliseconds
          : p.inMilliseconds);
    });
  }

  // 歌曲进度
  void sinkProgress(int m) {
    _curPositionController.sink.add('$m-${curSongDuration.inMilliseconds}');
  }

  // 播放一首歌
  void playSong(Song song) {
    if (_curState == PlayerState.playing) {
      _audioPlayer.stop();
    }
    _songs.insert(curIndex, song);
    play();
  }

  // 播放很多歌
  void playSongs(List<Song> songs, {required int index}) {
    _songs = songs;
    curIndex = index;
    play();
  }

  // 添加歌曲
  void addSongs(List<Song> songs) {
    _songs.addAll(songs);
  }

  /// 播放
  void play() async {
    var song = ApiSong().getSongUrl(_songs[curIndex].id);
    song.then((s) {
      _audioPlayer.play(UrlSource(s.data![0].url));
    }).catchError((e) {
      logE(e.toString());
    });
    saveCurSong();
  }

  /// 暂停、恢复
  void togglePlay() {
    if (_audioPlayer.state == PlayerState.paused) {
      resumePlay();
    } else {
      pausePlay();
    }
  }

  // 暂停
  void pausePlay() {
    _audioPlayer.pause();
  }

  /// 跳转到固定时间
  void seekPlay(int milliseconds) {
    _audioPlayer.seek(Duration(milliseconds: milliseconds));
    resumePlay();
  }

  /// 恢复播放
  void resumePlay() {
    _audioPlayer.resume();
  }

  /// 下一首
  void nextPlay() {
    if (curIndex >= _songs.length) {
      curIndex = 0;
    } else {
      curIndex++;
    }
    play();
  }

  void prePlay() {
    if (curIndex <= 0) {
      curIndex = _songs.length - 1;
    } else {
      curIndex--;
    }
    play();
  }

  // 保存当前歌曲到本地
  void saveCurSong() {
    SongPreferences().delSongInfo();
    SongPreferences().setSongInfo(_songs
        .map((s) => FluroConvertUtils.object2string(s))
        .toList()
        .toString());
  }

  @override
  void dispose() {
    super.dispose();
    _curPositionController.close();
    _audioPlayer.dispose();
  }
}
