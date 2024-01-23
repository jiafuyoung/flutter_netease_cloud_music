import 'dart:convert';

import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:netease_cloud_music_flutter/http/api/api_ser.dart';
import 'package:netease_cloud_music_flutter/http/preferences/user_preferences.dart';
import 'package:netease_cloud_music_flutter/page/mine/model/person_info.dart';
import 'package:netease_cloud_music_flutter/utils/log_utils.dart';
import 'package:netease_cloud_music_flutter/widget/pageWidget/base_stateful_widget.dart';

import '../../controller/base_controller.dart';

//不能继承 Login，否则不能使用 controller 里的网络请求
// class FindPage extends LoginedPage<FindController> {
class FindPage extends BaseStatefulWidget<FindController> {
  FindPage({Key? key}) : super(key: key);

  @override
  bool showDrawer() {
    return true;
  }

  final FindController _findController = Get.put(FindController());
  @override
  Widget buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text("发现tap页面"),
          Obx(() =>
              Text("${_findController.personT.value.token}")), //getx obs取值示例
          // Obx(() => Text("${_findController.personT}.token")),
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
  // var person = "".obs;
  var personT = PersonInfo().obs;

  @override
  void loadNet() {
    showSuccess();
  }

  @override
  void onReady() async {
    super.onReady();
    loadNet();
    var personInfo = await UserPreferences().getUserInfo();

    // json 字符串转 map 再转对象
    Map<String, dynamic> personMap = jsonDecode(personInfo!);
    PersonInfo personI = PersonInfo.fromJson(personMap);

    //rx 保存对象
    personT = Rx(personI);
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}

class FindBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FindController());
  }
}
