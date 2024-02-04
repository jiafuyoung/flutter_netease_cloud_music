import "dart:convert";

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:netease_cloud_music_flutter/component/drawer_component.dart";
import "package:netease_cloud_music_flutter/controller/base_controller.dart";
import 'package:netease_cloud_music_flutter/page/login/api/api_login.dart';
import "package:netease_cloud_music_flutter/http/preferences/user_preferences.dart";
import 'package:netease_cloud_music_flutter/page/mine/model/personinfo/person_info.dart';
import 'package:netease_cloud_music_flutter/page/mine/model/personinfo/person_info_login_status.dart';
import 'package:netease_cloud_music_flutter/widget/pageWidget/base_stateful_widget.dart';

class MinePage extends BaseStatefulWidget<MineController> {
  MinePage({Key? key}) : super(key: key);

  final MineController _mineController = Get.find();

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
    return _mineController._title;
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

class MineController extends BaseController<ApiLogin> {
  String _title = "我的";

  @override
  void onReady() {
    super.onReady();
    loadNet();
    showSuccess();
  }

  @override
  void loadNet() async {
    var _userInfoPreference = await UserPreferences().getUserInfoLoginStatus();
    if (_userInfoPreference!.isNotEmpty) {
      PersonInfoLoginStatus _personInfo =
          PersonInfoLoginStatus.fromJson(jsonDecode(_userInfoPreference));
      _title = _personInfo.profile!.nickname;
    } else {
      PersonInfo _personInfo =
          PersonInfo.fromJson(jsonDecode(_userInfoPreference));
      _title = _personInfo.profile!.nickname!;
    }
  }

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
