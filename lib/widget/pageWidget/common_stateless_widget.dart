import 'package:flutter/material.dart';
import 'package:netease_cloud_music_flutter/utils/mixin/toast/toast_mixin.dart';

///实现一些基础功能的StatelessWidget(例如Toast等)
abstract class CommonStatelessWidget extends StatelessWidget with ToastMixin {
  const CommonStatelessWidget({Key? key}) : super(key: key);
}
