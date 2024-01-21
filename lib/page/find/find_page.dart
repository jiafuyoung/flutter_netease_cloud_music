import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:netease_cloud_music_flutter/http/api/api_ser.dart';
import 'package:netease_cloud_music_flutter/pageWidget/base_stateful_widget.dart';

import '../../controller/base_controller.dart';
import '../../utils/log_utils.dart';

//不能继承 Login，否则不能使用 controller 里的网络请求
// class FindPage extends LoginedPage<FindController> {
class FindPage extends BaseStatefulWidget<FindController> {
  const FindPage({Key? key}) : super(key: key);

  @override
  bool showDrawer() {
    return true;
  }

  @override
  Widget buildContent(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [Text("发现tap页面")],
      ),
    );
  }

  @override
  bool showBackButton() => false;

  //顶部的在父类关闭了，这里开启的是子类，第二层的
  @override
  bool showTitleBar() {
    return true;
  }

  //子部分的顶部标题
  @override
  String titleString() => "发现";
}

class FindController extends BaseController<ApiSer> {
  @override
  void loadNet() {
    showEmpty();
  }

  @override
  void onReady() {
    logD("find 初始化");
    super.onReady();
    loadNet();
  }
}

class FindBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FindController());
  }
}
