import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PlaySongComponent extends StatelessWidget {
  const PlaySongComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PlaySongBottom extends StatelessWidget {
  final String url;
  final String songName;
  final String author;

  const PlaySongBottom(
      {Key? key,
      required this.url,
      required this.songName,
      required this.author})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      //整个底部
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 头像歌曲歌名
          SizedBox(
            child: Row(
              children: [
                SizedBox(
                  child: CachedNetworkImage(
                    imageUrl: url,
                    width: 40,
                    height: 40,
                  ),
                ),
                SizedBox(
                  child: Text(songName),
                ),
                SizedBox(
                  child: Text(
                    "-" + author,
                    style: const TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
          //播放键和列表键
          const SizedBox(
            child: Text("播放键和列表键"),
            width: 100,
          )
        ],
      ),
    );
  }
}
