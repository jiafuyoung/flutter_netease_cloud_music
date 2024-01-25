import 'package:flutter/material.dart';

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
