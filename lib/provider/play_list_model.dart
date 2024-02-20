import 'package:flutter/material.dart';
import 'package:netease_cloud_music_flutter/page/mine/model/personinfo/person_info_login_status.dart';
import 'package:netease_cloud_music_flutter/page/secondary_page/song/api/api_song.dart';
import 'package:netease_cloud_music_flutter/utils/log_utils.dart';

import '../page/secondary_page/song/model/user_play_list/playlist.dart';

class PlayListModel with ChangeNotifier {
  late PersonInfoLoginStatus user;

  List<Playlist> _selfCreatePlayList = []; // 我创建的歌单
  List<Playlist> _collectPlayList = []; // 收藏的歌单
  List<Playlist> _allPlayList = []; // 所有的歌单

  List<Playlist> get selfCreatePlayList => _selfCreatePlayList;

  List<Playlist> get collectPlayList => _collectPlayList;

  List<Playlist> get allPlayList => _allPlayList;

  void setPlayList(List<Playlist> value) {
    _allPlayList = value;
    _splitPlayList();
  }

  void _splitPlayList() {
    _selfCreatePlayList = _allPlayList
        .where((p) => p.creator!.userId == user.account!.id)
        .toList();
    _collectPlayList = _allPlayList
        .where((p) => p.creator!.userId != user.account!.id)
        .toList();
    notifyListeners();
  }

  void addPlayList(Playlist playlist) {
    _allPlayList.add(playlist);
    _splitPlayList();
  }

  void delPlayList(Playlist playlist) {
    _allPlayList.remove(playlist);
    _splitPlayList();
  }

  void getSelfPlaylistData() async {
    var result = ApiSong().getUserPlayList(user.account!.id!);
    result.then((upl) => setPlayList(upl.playlist!)).catchError((e) => logE(e));
  }
}
