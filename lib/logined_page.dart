import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netease_cloud_music_flutter/component/common_component.dart';
import 'package:netease_cloud_music_flutter/component/drawer_component.dart';
import 'package:netease_cloud_music_flutter/component/load_state_widget.dart';
import 'package:netease_cloud_music_flutter/component/play_song_component.dart';
import 'package:netease_cloud_music_flutter/page/login/api/api_login.dart';
import 'package:netease_cloud_music_flutter/http/preferences/user_preferences.dart';
import 'package:netease_cloud_music_flutter/page/mine/model/personinfo/person_info_login_status.dart';
import 'package:netease_cloud_music_flutter/provider/play_list_model.dart';
import 'package:netease_cloud_music_flutter/utils/log_utils.dart';
import 'package:provider/provider.dart';
import '/page/follow/follow_page.dart';
import 'page/mine/mine_page.dart';
import 'package:netease_cloud_music_flutter/res/colors.dart';
import './component/keep_alive_wrapper.dart';
import 'widget/pageWidget/base_stateful_widget.dart';
import 'controller/base_controller.dart';
import 'page/find/find_page.dart';

//继承自己写的BaseStatefulWidget类，重写buildContent方法
//登录成功后的页面，点击 tap 跳转另外三个页面showTitleBar不对父亲层级生效
class LoginedPage<T> extends BaseStatefulWidget<LoginedController> {
  const LoginedPage({Key? key}) : super(key: key);

  @override
  bool showDrawer() => true;
  @override
  Widget indexDrawer() => const DrawerComponent();
  @override
  bool showTitleBar() => true;

  @override
  Widget titleWidget() {
    switch (controller._curPage.value) {
      case 0:
        {
          return searchView();
        }
      case 1:
        {
          return titleView(controller._nickName.value);
        }
      case 2:
        {
          return titleView("关注");
        }
      default:
        {
          return titleView("发现");
        }
    }
  }

  @override
  List<Widget> appBarActionWidget() {
    List<Widget> actionList = [];
    switch (controller._curPage.value) {
      case 0:
        {
          actionList.add(MicIcon(
            clickIcon: () {},
          ));
          return actionList;
        }
      default:
        {
          return actionList;
        }
    }
  }

  @override
  bool showBackButton() => false;

  @override
  Widget buildContent(BuildContext context) {
    return Obx(() => PopScope(
        canPop: true,
        child: Scaffold(
          drawer: const DrawerComponent(),
          body: Column(
            children: [
              Expanded(
                  child: KeepAliveWrapper(
                child: PageView(
                  controller: controller._pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: controller.naviItems,
                ),
              )),
              const PlaySongBottom(
                  url:
                      "http://p3.music.126.net/FwTFLzZFZOZO5WFL6-JRBg==/2755376139227068.jpg",
                  songName: "歌名",
                  author: "作者"),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 8.0,
            type: BottomNavigationBarType.fixed,
            currentIndex: controller._curPage.value,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.explore), label: "发现"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的"),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "关注"),
            ],
            fixedColor: ColorStyle.color_EA4C43,
            onTap: (int index) {
              //跳转到指定页面
              controller._pageController.jumpToPage(index);
              controller._curPage.value = index;
              controller.onInit();
              controller.setUserInfo(context);
            },
          ),
        )));
  }
}

class LoginedController<T> extends BaseController<ApiLogin> {
  AudioPlayer audioPlayer = AudioPlayer();
  DateTime? lastPopTime;
  final RxInt _curPage = 0.obs;
  final PageController _pageController = PageController(initialPage: 0);
  PersonInfoLoginStatus personInfo = PersonInfoLoginStatus();
  RxString _nickName = "默认昵称".obs;
  RxString _imgUrl = "头像地址".obs;
  int tapCount = 0;

  final DrawerComponentController _drawerController =
      Get.put(DrawerComponentController());

  final List<Widget> naviItems = [
    const FindPage(),
    MinePage(),
    const FollowPage(),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void loadNet() {
    Future<Map<String, PersonInfoLoginStatus>> data =
        ApiLogin().getPersonInfoLoginStatus();
    data.then((value) {
      personInfo = value["data"]!;
      UserPreferences().setUserInfoLoginStatus(jsonEncode(personInfo));

      _nickName = RxString(personInfo.profile!.nickname);
      _imgUrl = RxString(personInfo.profile!.avatarUrl);
      _drawerController.updeteUserInfo(_nickName.value, _imgUrl.value);
    }).catchError((e) {
      logE("发生异常");
    });
  }

  void setUserInfo(BuildContext context) {
    Provider.of<PlayListModel>(context).user = personInfo;
  }

  @override
  void onReady() async {
    if (tapCount++ > 0) {
    } else {
      loadNet();
    }
    super.onReady();
    showSuccess();
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}

class LoginedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginedController());
    Get.lazyPut(() => MineController());
    Get.lazyPut(() => FindController());
    Get.lazyPut(() => FollowController());
  }
}
