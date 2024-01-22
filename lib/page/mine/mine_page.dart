import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:netease_cloud_music_flutter/controller/base_controller.dart";
import 'package:netease_cloud_music_flutter/http/api/api_ser.dart';
import "package:netease_cloud_music_flutter/page/mine/model/person_info.dart";
import 'package:netease_cloud_music_flutter/widget/pageWidget/base_stateful_widget.dart';
import "package:netease_cloud_music_flutter/utils/log_utils.dart";

class MinePage extends BaseStatefulWidget<MineController> {
  const MinePage({Key? key}) : super(key: key);

  @override
  bool showDrawer() {
    return true;
  }

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

  void requestPersonInfo() {
    httpRequest<PersonInfo>(api.getPersonInfo('xxxx', 'xxx'), (p) {
      logI(p.token as String);
    });
  }
}

class MineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MineController());
  }
}
