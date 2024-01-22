import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:netease_cloud_music_flutter/http/api/api_ser.dart';

import '../../controller/base_controller.dart';
import '../../widget/pageWidget/base_stateful_widget.dart';
import '../../utils/log_utils.dart';

class FollowPage extends BaseStatefulWidget<FollowController> {
  const FollowPage({Key? key}) : super(key: key);

  @override
  bool showDrawer() {
    return true;
  }

  @override
  Widget buildContent(BuildContext context) {
    return const SizedBox(
      child: Column(
        children: [Text("关注tap页面")],
      ),
    );
  }

  @override
  String titleString() => "关注";

  @override
  bool showBackButton() => false;

  @override
  bool showTitleBar() {
    return true;
  }
}

class FollowController extends BaseController<ApiSer> {
  @override
  void loadNet() {
    showSuccess();
  }

  @override
  void onReady() {
    logD("follow 初始化");
    super.onReady();
    loadNet();
  }
}

class FollowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FollowController());
  }
}
