import 'package:flutter/material.dart';

class CommonComponent extends StatelessWidget {
  const CommonComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ShareIcon extends StatelessWidget {
  const ShareIcon({Key? key, this.clickIcon}) : super(key: key);
  final VoidCallback? clickIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clickIcon,
      child: Container(
        width: 30,
        height: 30,
        child: const Image(
            image: AssetImage("assets/icons/button_icon/share.png")),
        margin: const EdgeInsets.only(right: 20),
      ),
    );
  }
}

class MicIcon extends StatelessWidget {
  const MicIcon({Key? key, this.clickIcon}) : super(key: key);

  final VoidCallback? clickIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clickIcon,
      child: Container(
        width: 30,
        height: 30,
        child: const Image(
            image: AssetImage("assets/icons/button_icon/mic_phone.png")),
        margin: const EdgeInsets.only(right: 10),
      ),
    );
  }
}
