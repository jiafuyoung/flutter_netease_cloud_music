import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music_flutter/component/play_song_component.dart';
import 'package:netease_cloud_music_flutter/page/secondary_page/song/model/song.dart';
import 'package:netease_cloud_music_flutter/provider/play_songs_model.dart';

class ImageMenuWidget extends StatelessWidget {
  final String img;
  final double size;
  final VoidCallback? onTap;

  const ImageMenuWidget(this.img, this.size, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Image.asset(
          img,
          width: ScreenUtil().setWidth(size),
          height: ScreenUtil().setWidth(size),
        ),
      ),
    );
  }
}

class SongListImageMenuWidget extends StatelessWidget {
  const SongListImageMenuWidget(
      {Key? key, required this.model, required this.size, required this.imgUrl})
      : super(key: key);

  final PlaySongsModel model;
  final double size;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return ImageMenuWidget(
      imgUrl,
      size,
      onTap: () {
        showModalBottomSheet(
          // transitionAnimationController:
          //     _animationController,
          isScrollControlled:
              true, //如果builder 里面有可滚动的列表，就会全屏显示内容，如果内容不能占满全屏，那也会全屏显示
          isDismissible: true, //点击空白处返回功能，默认是true
          enableDrag: true, //是否允许拖动
          elevation: 10,
          barrierColor: Colors.grey.withOpacity(0.5), //空白处的颜色
          backgroundColor: Colors.white, //背景颜色
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)), //圆角
          context: context,
          builder: (context) {
            List<Song> songList = model.allSongs;
            return SizedBox(
              child: Column(
                children: [
                  const PlayListTitle(title: "播放列表"),

                  ///使用Expanded占据剩余空间，这样就相当于设置了外层尺寸，内层也隐式设置
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                          songList.length,
                          (index) => GestureDetector(
                            onTap: () {
                              model.playSongByIndex(index);
                            },
                            child: PlayListSongItem(
                                songName: songList[index].name,
                                artist: songList[index].artists,
                                isPlay: index == model.curIndex),
                          ),
                        ),
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                  )
                ],
              ),
              height: 600,
              width: screenWidth,
            );
          },
        );
      },
    );
  }
}
