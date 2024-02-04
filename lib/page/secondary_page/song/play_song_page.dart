import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music_flutter/Application.dart';
import 'package:netease_cloud_music_flutter/page/secondary_page/song/api/api_song.dart';
import 'package:netease_cloud_music_flutter/page/secondary_page/song/lyric_page.dart';
import 'package:netease_cloud_music_flutter/page/secondary_page/song/model/common_data/common_data.dart';
import 'package:netease_cloud_music_flutter/provider/play_songs_model.dart';
import 'package:netease_cloud_music_flutter/utils/log_utils.dart';
import 'package:netease_cloud_music_flutter/utils/number_utils.dart';
import 'package:netease_cloud_music_flutter/utils/song_util.dart';
import 'package:netease_cloud_music_flutter/widget/common_text_style.dart';
import 'package:netease_cloud_music_flutter/widget/v_empty_view.dart';
import 'package:netease_cloud_music_flutter/widget/widget_future_builder.dart';
import 'package:netease_cloud_music_flutter/widget/widget_img_menu.dart';
import 'package:netease_cloud_music_flutter/widget/widget_play_bottom_menu.dart';
import 'package:netease_cloud_music_flutter/widget/widget_round_img.dart';
import 'package:netease_cloud_music_flutter/widget/widget_song_progress.dart';
import 'package:provider/provider.dart';

class PlaySongsPage extends StatefulWidget {
  const PlaySongsPage({super.key});

  @override
  _PlaySongsPageState createState() => _PlaySongsPageState();
}

class _PlaySongsPageState extends State<PlaySongsPage>
    with TickerProviderStateMixin {
  late AnimationController coverController; // 封面旋转控制器
  late AnimationController stylusController; //唱针控制器
  late Animation<double> stylusAnimation;
  int switchIndex = 1; //用于切换歌词

  @override
  void initState() {
    super.initState();
    coverController =
        AnimationController(vsync: this, duration: const Duration(seconds: 20));
    stylusController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    stylusAnimation =
        Tween<double>(begin: -0.03, end: -0.10).animate(stylusController);
    stylusController.addStatusListener((status) {
      // 转完一圈之后继续
      if (status == AnimationStatus.completed) {
        coverController.reset();
        coverController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaySongsModel>(builder: (context, model, child) {
      var curSong = model.curSong;
      logI("当前歌曲" + curSong.toString());
      if (model.curState == PlayerState.playing) {
        // 如果当前状态是在播放当中，则唱片一直旋转，
        // 并且唱针是移除状态
        coverController.forward();
        stylusController.reverse();
      } else {
        coverController.stop();
        stylusController.forward();
      }

      return Scaffold(
        body: Stack(
          children: <Widget>[
            SongUtils.showNetImage(
              '${curSong.picUrl}?param=200y200',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fitHeight,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaY: 100,
                sigmaX: 100,
              ),
              child: Container(
                color: Colors.black38,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            AppBar(
              centerTitle: true,
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.dark),
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: Colors.transparent,
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    model.curSong.name,
                    style: commonWhiteTextStyle,
                  ),
                  Text(
                    model.curSong.artists,
                    style: smallWhite70TextStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: kToolbarHeight + Application.statusBarHeight),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      ///HitTestBehavior.opaque 自己处理事件
                      ///HitTestBehavior.deferToChild child处理事件
                      ///HitTestBehavior.translucent 自己和child都可以接收事件
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        setState(() {
                          if (switchIndex == 0) {
                            switchIndex = 1;
                          } else {
                            switchIndex = 0;
                          }
                        });
                      },
                      child: IndexedStack(
                        index: switchIndex,
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: ScreenUtil().setWidth(150)),
                                  //RotationTransition旋转动画
                                  child: RotationTransition(
                                    turns: coverController,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: <Widget>[
                                        Image.asset(
                                          'images/bet.png',
                                          width: ScreenUtil().setWidth(550),
                                        ),
                                        RoundImgWidget(
                                          '${curSong.picUrl}?param=200y200',
                                          370,
                                          fit: BoxFit.fill,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                child: RotationTransition(
                                  turns: stylusAnimation,
                                  alignment: Alignment(
                                      -1 +
                                          (ScreenUtil().setWidth(45 * 2) /
                                              (ScreenUtil().setWidth(293))),
                                      -1 +
                                          (ScreenUtil().setWidth(45 * 2) /
                                              (ScreenUtil().setWidth(504)))),
                                  child: Image.asset(
                                    'images/bgm.png',
                                    width: ScreenUtil().setWidth(205),
                                    height: ScreenUtil().setWidth(352.8),
                                  ),
                                ),
                                alignment: const Alignment(0.25, -1),
                              ),
                            ],
                          ),
                          LyricPage(model),
                        ],
                      ),
                    ),
                  ),
                  buildSongsHandle(model),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(30)),
                    child: SongProgressWidget(model),
                  ),
                  PlayBottomMenuWidget(model),
                  const VEmptyView(20),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Widget buildSongsHandle(PlaySongsModel model) {
    Map<String, dynamic> map = {};
    map["id"] = model.curSong.id;
    map["limit"] = 1;
    // Future<CommonData> common = ApiSong().getSongCommonData();
    return SizedBox(
      height: ScreenUtil().setWidth(100),
      child: Row(
        children: <Widget>[
          const ImageMenuWidget('images/icon_dislike.png', 80),
          ImageMenuWidget(
            'images/icon_song_download.png',
            80,
            onTap: () {},
          ),
          ImageMenuWidget(
            'images/bfc.png',
            80,
            onTap: () {},
          ),
          Expanded(
            child: Align(
              child: SizedBox(
                width: ScreenUtil().setWidth(130),
                height: ScreenUtil().setWidth(80),
                child: CustomFutureBuilder<CommonData>(
                  // params: {'id': model.curSong.id, 'offset': 1},
                  params: map,
                  futureFunc: ApiSong().getSongCommonData,
                  loadingWidget: Image.asset(
                    'images/icon_song_comment.png',
                    width: ScreenUtil().setWidth(80),
                    height: ScreenUtil().setWidth(80),
                  ),
                  builder: (context, data) {
                    return GestureDetector(
                      onTap: () {
                        //todo
                        logI("去评论页");
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Image.asset(
                            'images/icon_song_comment.png',
                            width: ScreenUtil().setWidth(80),
                            height: ScreenUtil().setWidth(80),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: ScreenUtil().setWidth(12)),
                              width: ScreenUtil().setWidth(58),
                              child: Text(
                                ///右上角评论数
                                NumberUtils.formatNum(data.total as num),
                                style: common10White70TextStyle,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const ImageMenuWidget('images/icon_song_more.png', 80),
        ],
      ),
    );
  }

  @override
  void dispose() {
    coverController.dispose();
    stylusController.dispose();
    super.dispose();
  }
}
