import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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

class FindMyIconWithText extends StatelessWidget {
  final Widget img;
  final String bottomText;
  //父组件传入的方法【类型定义为VoidCallback而不是 function】
  final VoidCallback? clickIcon;

  FindMyIconWithText(
      {Key? key, required this.img, required this.bottomText, this.clickIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///GestureDetector，包含了包括点击等行为，包裹容器实现点击后的行为
    return GestureDetector(
      onTap: clickIcon,
      child: SizedBox(
        child: Column(
          children: [
            SizedBox(
              child: img,
              width: 50,
              height: 50,
            ),
            Text(
              bottomText,
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
        width: 100,
        height: 100,
      ),
    );
  }
}
