import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music_flutter/utils/song_util.dart';

class RoundImgWidget extends StatelessWidget {
  final String img;
  final double width;
  final BoxFit fit;

  const RoundImgWidget(this.img, this.width, {super.key, required this.fit});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(width / 2),
      child: img.startsWith('http')
          ? SongUtils.showNetImage(img,
              width: ScreenUtil().setWidth(width),
              height: ScreenUtil().setWidth(width),
              fit: fit)
          : Image.asset(
              img,
              fit: fit,
            ),
    );
  }
}
