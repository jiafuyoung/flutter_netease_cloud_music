import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netease_cloud_music_flutter/widget/common_text_style.dart';

import '../page/find/model/rank_song_list/song.dart';

class PersonInfoComponent extends StatelessWidget {
  final String imageUrl;
  final String nickName;
  final String? introduce;
  final String level;
  final String followNumber;
  final String fansNumber;

  const PersonInfoComponent({
    Key? key,
    required this.imageUrl,
    required this.nickName,
    required this.introduce,
    required this.level,
    required this.followNumber,
    required this.fansNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Container(
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: 100,
              height: 100,
            ),
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.fromLTRB(0, 40, 0, 20),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
          Text(
            nickName,
            style: bold20WhiteTextStyle,
          ),
          Text(
            introduce ?? "",
            style: common14MineTextStyle,
          ),
          Container(
            child: Row(
              children: [
                PersonInfoDataShow(
                  word: followNumber,
                  constWord: "关注",
                ),
                PersonInfoDataShow(
                  word: fansNumber,
                  constWord: "粉丝",
                ),
                PersonInfoDataShow(
                  word: "LV." + (level),
                  constWord: "等级",
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}

class PersonInfoDataShow extends StatelessWidget {
  final String word;
  final String constWord;
  const PersonInfoDataShow(
      {Key? key, required this.word, required this.constWord})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            word + " ",
            style: common16whiteTextStyle,
          ),
          Text(
            constWord,
            style: common16MineTextStyle,
          )
        ],
      ),
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    );
  }
}

class SongListItem extends StatelessWidget {
  final String imageUrl;
  final String author;
  final String count;
  final String playCount;
  final String songListName;
  final VoidCallback? tapAction;

  const SongListItem(
      {Key? key,
      required this.imageUrl,
      required this.songListName,
      required this.author,
      required this.count,
      required this.playCount,
      this.tapAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapAction,
      child: Container(
        child: Row(
          children: [
            imageUrl.isEmpty
                ? Image.asset(
                    "images/bet.png",
                    width: 50,
                    height: 50,
                  )
                : CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: 50,
                    height: 50,
                  ),
            Expanded(
                child: Container(
              child: Column(
                children: [
                  Text(
                    songListName,
                    style: bold16TextStyle,
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        // Text("类型"),
                        Text(count + "首 "),
                        Text(playCount + "次 "),
                        Text(author)
                      ],
                    ),
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              margin: const EdgeInsets.only(left: 10),
            ))
          ],
        ),
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      ),
    );
  }
}

class SongItem extends StatelessWidget {
  const SongItem(
      {Key? key,
      this.tapAction,
      this.isPlay,
      required this.seq,
      required this.song})
      : super(key: key);

  final String seq;
  // final String songName;
  // final String author;
  final Song song;
  final VoidCallback? tapAction;
  final isPlay;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapAction,
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                seq,
                style: bold16GrayTextStyle,
              ),
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            ),
            Expanded(
              child: SizedBox(
                child: Column(
                  children: [
                    Text(
                      song.name!,
                      style: bold16TextStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      song.ar!.map((e) => e.name).join("/"),
                      style: common14GrayTextStyle,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 10, 10),
              child: Image.asset(
                "assets/icons/button_icon/more_button.png",
                width: 30,
                height: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
