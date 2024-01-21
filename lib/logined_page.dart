import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netease_cloud_music_flutter/http/api/api_ser.dart';
import '/page/follow/follow_page.dart';
import 'page/mine/mine_page.dart';
import 'package:netease_cloud_music_flutter/res/colors.dart';
import 'package:netease_cloud_music_flutter/utils/log_utils.dart';
import './component/keep_alive_wrapper.dart';
import './pageWidget/base_stateful_widget.dart';
import 'controller/base_controller.dart';
import 'page/find/find_page.dart';

//继承自己写的BaseStatefulWidget类，重写buildContent方法
//登录成功后的页面，点击 tap 跳转并不是路由跳转，所以 另外三个页面showTitleBar不对父亲层级生效
class LoginedPage<T> extends BaseStatefulWidget<LoginedController> {
  const LoginedPage({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    return Obx(() => WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          body: KeepAliveWrapper(
            child: PageView(
              controller: controller._pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: controller.naviItems,
            ),
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
            },
          ),
        )));
  }
}

class LoginedController<T> extends BaseController<ApiSer> {
  DateTime? lastPopTime;
  final RxInt _curPage = 0.obs;
  final PageController _pageController = PageController(initialPage: 0);

  final List<Widget> naviItems = [
    const FindPage(),
    const MinePage(),
    const FollowPage(),
  ];

  @override
  void loadNet() {}

  @override
  void onReady() {
    logD("登录完成页初始化");
    super.onReady();
    showSuccess();
  }
}

class LoginedBinding extends Bindings {
  @override
  void dependencies() {
    logD(">>>>>>>>>>>>开始注入代码");
    Get.lazyPut(() => LoginedController());
    Get.lazyPut(() => MineController());
    Get.lazyPut(() => FindController());
    Get.lazyPut(() => FollowController());
  }
}
