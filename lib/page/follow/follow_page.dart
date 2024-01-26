import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:netease_cloud_music_flutter/component/drawer_component.dart';
import 'package:netease_cloud_music_flutter/http/api/login/api_login.dart';

import '../../controller/base_controller.dart';
import '../../http/preferences/user_preferences.dart';
import '../../widget/pageWidget/base_stateful_widget.dart';
import '../../utils/log_utils.dart';

class FollowPage extends BaseStatefulWidget<FollowController> {
  const FollowPage({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const Text("关注tap页面"),
          ElevatedButton(
              onPressed: () async {
                UserPreferences().deleteUserInfo();
              },
              child: const Text("清除个人信息"))
        ],
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

  @override
  bool showDrawer() {
    return true;
  }

  @override
  Widget indexDrawer() {
    return const DrawerComponent();
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

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}

class FollowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FollowController());
  }
}
