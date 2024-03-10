import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netease_cloud_music_flutter/provider/play_songs_model.dart';
import 'package:netease_cloud_music_flutter/widget/common_text_style.dart';
import 'package:netease_cloud_music_flutter/widget/widget_img_menu.dart';
import 'package:provider/provider.dart';

class PlaySongComponent extends StatelessWidget {
  const PlaySongComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PlaySongBottom extends StatelessWidget {
  const PlaySongBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaySongsModel>(builder: (context, model, _) {
      return model.allSongs.isEmpty
          ? const SizedBox()
          : GestureDetector(
              onTap: () {
                Future.delayed(const Duration(milliseconds: 100),
                    () => Get.toNamed("/play_song_page"));
              },
              child: Container(
                height: 60,
                padding: const EdgeInsets.fromLTRB(15, 10, 20, 10),
                //整个底部
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 头像歌曲歌名
                    SizedBox(
                      child: Row(
                        children: [
                          Container(
                            child: CachedNetworkImage(
                              imageUrl: model.curSong.picUrl,
                            ),
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30)),
                            margin: const EdgeInsets.only(right: 10),
                          ),
                          SizedBox(
                            child: Text(model.curSong.name),
                          ),
                          SizedBox(
                            child: Text(
                              "-" + model.curSong.artists,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                    ),
                    //播放键和列表键
                    SizedBox(
                      width: 100,
                      height: 60,
                      child: Row(
                        children: [
                          ImageMenuWidget(
                            model.curState != PlayerState.paused
                                ? 'images/pause.png'
                                : 'images/play.png',
                            40,
                            onTap: () {
                              model.togglePlay();
                            },
                          ),
                          SongListImageMenuWidget(
                            model: model,
                            imgUrl: "images/list.png",
                            size: 40,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
    });
  }
}

class PlayListTitle extends StatelessWidget {
  const PlayListTitle({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        style: bold20TextStyle,
      ),
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
    );
  }
}

class PlayListSongItem extends StatelessWidget {
  const PlayListSongItem(
      {Key? key,
      required this.songName,
      required this.artist,
      required this.isPlay})
      : super(key: key);
  final String songName;
  final String artist;
  final bool isPlay;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Row(
        children: [
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 80),
            child: Text(
              songName,
              style: isPlay ? common18RedTextStyle : common18TextStyle,
            ),
          ),
          Container(
            constraints: const BoxConstraints(maxWidth: 60),
            child: Text(
              "·" + artist,
              style: isPlay ? common14RedTextStyle : common14GrayTextStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
