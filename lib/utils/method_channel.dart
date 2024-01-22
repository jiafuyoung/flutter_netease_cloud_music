import 'package:flutter/services.dart';
import '../const/common_constant.dart';

var channel = const MethodChannel(CommonConstant.METHOD_CHANNEL);

///点击顶部会退按钮操作
Future<void> onBackPressed() async {
  await channel.invokeMethod(CommonConstant.METHOD_ON_BACK_PRESSED);
}
