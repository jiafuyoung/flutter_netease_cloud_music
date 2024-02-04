// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyIcon extends StatelessWidget {
  final String imgUrl;

  const MyIcon({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(imgUrl),
      width: 30,
      height: 30,
    );
  }
}

class FindPicWithText extends StatelessWidget {
  //父组件传入的方法【类型定义为VoidCallback而不是 function】
  final VoidCallback? clickIcon;
  final Widget pic;
  final Widget text;

  const FindPicWithText({
    Key? key,
    this.clickIcon,
    required this.pic,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///GestureDetector，包含了包括点击等行为，包裹容器实现点击后的行为

    return GestureDetector(
      onTap: clickIcon,
      child: Container(
        child: Column(
          children: [pic, text],
        ),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30))),
      ),
    );
  }
}

class FindImportantEntrySvg extends StatelessWidget {
  final String img;
  final double sideLength;
  const FindImportantEntrySvg(
      {Key? key, required this.img, required this.sideLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(img),
      width: sideLength,
      height: sideLength,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    );
  }
}

class FindTextBelowEntrySvg extends StatelessWidget {
  final String text;
  final double textHeight;

  final double textWidth;
  const FindTextBelowEntrySvg(
      {super.key,
      required this.text,
      required this.textHeight,
      required this.textWidth});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        text,
        style: const TextStyle(color: Colors.red),
        textAlign: TextAlign.center,
      ),
      width: textWidth,
      height: textHeight,
    );
  }
}

class FindSongListPic extends StatelessWidget {
  final String img;
  final double sideLength;
  const FindSongListPic(
      {super.key, required this.img, required this.sideLength});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: sideLength,
        height: sideLength,
        child: Container(
            child: Image(image: NetworkImage(img)),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            )),
        padding: const EdgeInsets.fromLTRB(0, 2, 10, 2));
  }
}

class FindTextBelowPic extends StatelessWidget {
  final String text;
  final double textHeight;
  final double textWidth;
  const FindTextBelowPic(
      {super.key,
      required this.text,
      required this.textHeight,
      required this.textWidth});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
      height: textHeight,
      width: textWidth,
    );
  }
}

class FunctionTitle extends StatelessWidget {
  final VoidCallback? clickIcon;
  final String text;

  const FunctionTitle({
    Key? key,
    required this.clickIcon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clickIcon,
      child: SizedBox(
        child: Row(
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Image(
              image: AssetImage("assets/icons/button_icon/detail_button.png"),
              width: 20,
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class FindRankList extends StatelessWidget {
  final VoidCallback? clickIcon;

  final String imgUrl;

  final String text1;
  final String text2;
  final String text3;
  const FindRankList(
      {Key? key,
      this.clickIcon,
      required this.imgUrl,
      required this.text1,
      required this.text2,
      required this.text3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: clickIcon,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: ClipRRect(
                child:
                    CachedNetworkImage(width: 50, height: 50, imageUrl: imgUrl),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
            ),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text1,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Text(text2,
                      style: const TextStyle(fontSize: 14, color: Colors.red))
                ],
              ),
              height: 50,
              width: size.width * 0.5,
            ),
            SizedBox(
              child: Text(text3),
              width: size.width * 0.1,
            )
          ],
        ),
      ),
    );
  }
}

class FindRankListBox extends StatelessWidget {
  const FindRankListBox(
      {Key? key, required this.rankListTitle, required this.rankList})
      : super(key: key);
  final Widget rankListTitle;
  final Widget rankList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
          child: Card(
        child: Column(
          children: [
            rankListTitle,
            rankList,
          ],
        ),
      )),
    );
  }
}
