import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music_flutter/provider/play_songs_model.dart';
import 'package:netease_cloud_music_flutter/widget/widget_img_menu.dart';

///播放组件
class PlayBottomMenuWidget extends StatelessWidget {
  final PlaySongsModel model;

  const PlayBottomMenuWidget(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setWidth(150),
      alignment: Alignment.topCenter,
      child: Row(
        children: <Widget>[
          const ImageMenuWidget('images/icon_song_play_type_1.png', 80),
          ImageMenuWidget(
            'images/icon_song_left.png',
            80,
            onTap: () {
              model.prePlay();
            },
          ),
          ImageMenuWidget(
            model.curState != PlayerState.paused
                ? 'images/icon_song_pause.png'
                : 'images/icon_song_play.png',
            150,
            onTap: () {
              model.togglePlay();
            },
          ),
          ImageMenuWidget(
            'images/icon_song_right.png',
            80,
            onTap: () {
              model.nextPlay();
            },
          ),
          SongListImageMenuWidget(
            model: model,
            size: 80,
            imgUrl: "images/icon_play_songs.png",
          ),
        ],
      ),
    );
  }
}
