import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../res/colors.dart';

// ignore: must_be_immutable
class BaseNetworkImage extends CachedNetworkImage {
  String imgUrl;

  BaseNetworkImage(
    this.imgUrl, {
    width,
    fit,
    height,
    Key? key,
  }) : super(
          key: key,
          imageUrl: imgUrl,
          height: height,
          width: width,
          fit: fit,
          //占位
          placeholder: (context, url) {
            double size = 50;
            if (width != null && width != double.infinity) {
              size = width * 0.5;
            } else if (height != null) {
              size = height * 0.5;
            }
            return Icon(
              Icons.image,
              size: size,
              color: ColorStyle.color_999999,
            );
          },
          //失败后的占位图
          errorWidget: (context, url, error) {
            double size = 50;
            if (width != null && width != double.infinity) {
              size = width * 0.5;
            } else if (height != null) {
              size = height * 0.5;
            }
            return Icon(
              Icons.image,
              size: size,
              color: ColorStyle.color_666666,
            );
          },
          fadeInDuration: const Duration(milliseconds: 0),
          fadeOutDuration: const Duration(milliseconds: 0),
        );
}
