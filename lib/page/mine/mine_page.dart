import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:netease_cloud_music_flutter/component/drawer_component.dart";
import "package:netease_cloud_music_flutter/controller/base_controller.dart";
import "package:netease_cloud_music_flutter/http/api/login/api_login.dart";
import 'package:netease_cloud_music_flutter/widget/pageWidget/base_stateful_widget.dart';
import "package:netease_cloud_music_flutter/utils/log_utils.dart";

class MinePage extends BaseStatefulWidget<MineController> {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [Text("我的tap页面")],
      ),
    );
  }

  @override
  bool showBackButton() => false;

  //本层级标题
  @override
  bool showTitleBar() {
    return true;
  }

  @override
  String titleString() {
    return "我的";
  }

  @override
  bool showDrawer() {
    return true;
  }

  @override
  Widget indexDrawer() {
    return const DrawerComponent();
  }
}

class MineController extends BaseController<ApiSer> {
  @override
  void onReady() {
    logD("mine 初始化");
    super.onReady();
    loadNet();
  }

  @override
  void loadNet() {
    requestPersonInfo();
  }

  void requestPersonInfo() {}

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}

class MineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MineController());
  }
}
