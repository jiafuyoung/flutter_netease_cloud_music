import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music_flutter/Application.dart';
import 'package:netease_cloud_music_flutter/page/secondary_page/song/api/api_song.dart';
import 'package:netease_cloud_music_flutter/page/secondary_page/song/model/lyric/lyric.dart';
import 'package:netease_cloud_music_flutter/page/secondary_page/song/model/lyric_data_by_net/lyric_data_by_net.dart';
import 'package:netease_cloud_music_flutter/page/secondary_page/song/widget_lyric.dart';
import 'package:netease_cloud_music_flutter/provider/play_songs_model.dart';
import 'package:netease_cloud_music_flutter/utils/log_utils.dart';
import 'package:netease_cloud_music_flutter/utils/utils.dart';
import 'package:netease_cloud_music_flutter/widget/common_text_style.dart';

class LyricPage extends StatefulWidget {
  final PlaySongsModel model;

  const LyricPage(this.model, {super.key});

  @override
  _LyricPageState createState() => _LyricPageState();
}

class _LyricPageState extends State<LyricPage> with TickerProviderStateMixin {
  late LyricWidget _lyricWidget;
  LyricDataByNet _lyricData = LyricDataByNet();
  late List<Lyric> lyrics = [];
  late AnimationController _lyricOffsetYController;
  late int curSongId;
  late Timer dragEndTimer; // 拖动结束任务
  late Function dragEndFunc;
  bool initStatus = false;
  Duration dragEndDuration = const Duration(milliseconds: 1000);

  @override
  void initState() {
    super.initState();
    curSongId = widget.model.curSong.id;
    WidgetsBinding.instance.addPostFrameCallback((call) {
      _request();
    });
    _lyricWidget = LyricWidget(lyrics, 0);
    _lyricOffsetYController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    dragEndFunc = () {
      if (_lyricWidget.isDragging) {
        setState(() {
          _lyricWidget.isDragging = false;
        });
      }
    };
    initStatus = true;
  }

  void _request() async {
    var lyric = ApiSong().getLyricByApi(curSongId);
    lyric.then((l) {
      setState(() {
        _lyricData = l;
        lyrics = Utils.formatLyric(_lyricData.lrc!.lyric);
        _lyricWidget = LyricWidget(lyrics, 0);
      });
    }).catchError((e) => logE(e.toString()));
  }

  @override
  Widget build(BuildContext context) {
    // 当前歌的id变化之后要重新获取歌词
    final size = MediaQuery.of(context).size;
    if (initStatus) {
      if (curSongId != widget.model.curSong.id) {
        lyrics = [];
        curSongId = widget.model.curSong.id;
        _request();
      }
    }

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: lyrics.isEmpty
            ? Container(
                alignment: Alignment.center,
                child: const Text(
                  '歌词加载中...',
                  style: commonWhiteTextStyle,
                ),
              )
            : GestureDetector(
                onTapDown: _lyricWidget.isDragging
                    ? (e) {
                        if (e.localPosition.dx > 0 &&
                            e.localPosition.dx < ScreenUtil().setWidth(100) &&
                            e.localPosition.dy >
                                _lyricWidget.canvasSize.height / 2 -
                                    ScreenUtil().setWidth(100) &&
                            e.localPosition.dy <
                                _lyricWidget.canvasSize.height / 2 +
                                    ScreenUtil().setWidth(100)) {
                          widget.model.seekPlay(_lyricWidget.dragLineTime);
                        }
                      }
                    : null,
                onVerticalDragUpdate: (e) {
                  if (!_lyricWidget.isDragging) {
                    setState(() {
                      _lyricWidget.isDragging = true;
                    });
                  }
                  _lyricWidget.offsetY += e.delta.dy;
                },
                onVerticalDragEnd: (e) {
                  // 拖动防抖
                  cancelDragTimer();
                },
                child: StreamBuilder<String>(
                  stream: widget.model.curPositionStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var curTime = double.parse(snapshot.data!
                          .substring(0, snapshot.data!.indexOf('-')));
                      // 获取当前在哪一行
                      int curLine = Utils.findLyricIndex(curTime, lyrics);

                      if (!_lyricWidget.isDragging) {
                        startLineAnim(curLine);
                      }
                      // 给 customPaint 赋值当前行
                      _lyricWidget.curLine = curLine;
                      return CustomPaint(
                        size: Size(
                            size.width,
                            size.height -
                                kToolbarHeight -
                                ScreenUtil().setWidth(150) -
                                ScreenUtil().setWidth(50) -
                                Application.statusBarHeight -
                                ScreenUtil().setWidth(120)),
                        painter: _lyricWidget,
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ));
  }

  void cancelDragTimer() {
    if (dragEndTimer.isActive) {
      dragEndTimer.cancel();
    }
  }

  /// 开始下一行动画
  void startLineAnim(int curLine) {
    // 判断当前行和 customPaint 里的当前行是否一致，不一致才做动画
    if (_lyricWidget.curLine != curLine) {
      // 如果动画控制器不是空，那么则证明上次的动画未完成，
      // 未完成的情况下直接 stop 当前动画，做下一次的动画
      // _lyricOffsetYController.stop();

      // 初始化动画控制器，切换歌词时间为300ms，并且添加状态监听，
      // 如果为 completed，则消除掉当前controller，并且置为空。
      _lyricOffsetYController = AnimationController(
          vsync: this, duration: const Duration(milliseconds: 300))
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _lyricOffsetYController.dispose();
          }
        });
      // 计算出来当前行的偏移量
      var end = _lyricWidget.computeScrollY(curLine) * -1;
      // 起始为当前偏移量，结束点为计算出来的偏移量
      Animation animation = Tween<double>(begin: _lyricWidget.offsetY, end: end)
          .animate(_lyricOffsetYController);
      // 添加监听，在动画做效果的时候给 offsetY 赋值
      _lyricOffsetYController.addListener(() {
        _lyricWidget.offsetY = animation.value;
      });
      // 启动动画
      _lyricOffsetYController.forward();
    }
  }
}
