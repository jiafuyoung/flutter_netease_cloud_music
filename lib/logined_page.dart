import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netease_cloud_music_flutter/component/drawer_component.dart';
import 'package:netease_cloud_music_flutter/http/api/login/api_login.dart';
import 'package:netease_cloud_music_flutter/page/mine/model/person_info_login_status.dart';
import 'package:netease_cloud_music_flutter/utils/log_utils.dart';
import '/page/follow/follow_page.dart';
import 'page/mine/mine_page.dart';
import 'package:netease_cloud_music_flutter/res/colors.dart';
import './component/keep_alive_wrapper.dart';
import 'widget/pageWidget/base_stateful_widget.dart';
import 'controller/base_controller.dart';
import 'page/find/find_page.dart';

//继承自己写的BaseStatefulWidget类，重写buildContent方法
//登录成功后的页面，点击 tap 跳转并不是路由跳转，所以 另外三个页面showTitleBar不对父亲层级生效
class LoginedPage<T> extends BaseStatefulWidget<LoginedController> {
  LoginedPage({Key? key}) : super(key: key);

  final LoginedController _loginedController = LoginedController();

  @override
  bool showDrawer() {
    return true;
  }

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

  // Widget? indexDrawer() {
  //   logI("开始绘制，昵称为" + _loginedController._nickName.value);
  //   return Obx(() => Drawer(
  //           child: Column(
  //         children: [
  //           DrawerHeader(
  //               child: DrawerHeader(
  //             child: Row(
  //               children: [
  //                 Expanded(
  //                     child: Image(
  //                   image: NetworkImage(_loginedController._imgUrl.value),
  //                   width: 30,
  //                   height: 30,
  //                 )), //头像
  //                 Text(
  //                   _loginedController._nickName.value,
  //                 ),
  //                 const Expanded(
  //                     child: Image(
  //                   image: AssetImage(
  //                       "assets/icons/button_icon/detail_button.png"),
  //                   width: 30,
  //                   height: 30,
  //                 )), //可点击详细信息的图标
  //                 const Expanded(
  //                     child: Image(
  //                   image: AssetImage("assets/icons/button_icon/scan_code.png"),
  //                   width: 30,
  //                   height: 30,
  //                 )), //扫码按钮
  //               ],
  //             ),
  //             // padding: EdgeInsets.fromLTRB(40, 40, 40, 40),
  //             decoration: const BoxDecoration(
  //                 color: Colors.grey,
  //                 borderRadius: BorderRadius.all(Radius.circular(20))),
  //           )),
  //           const ListTile(
  //             leading: Text("lead"),
  //             title: Text("侧边栏 2"),
  //           ),
  //           const ListTile(
  //             title: Text("this "),
  //           ),
  //         ],
  //       )));
  // }
}

class LoginedController<T> extends BaseController<ApiSer> {
  DateTime? lastPopTime;
  final RxInt _curPage = 0.obs;
  final PageController _pageController = PageController(initialPage: 0);
  PersonInfoLoginStatus personInfo = PersonInfoLoginStatus();
  RxString _nickName = "默认昵称".obs;
  RxString _imgUrl = "头像地址".obs;

  final DrawerComponentController _drawerController =
      Get.put(DrawerComponentController());

  final List<Widget> naviItems = [
    FindPage(),
    const MinePage(),
    const FollowPage(),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void loadNet() {
    Future<Map<String, PersonInfoLoginStatus>> data =
        ApiSer().getPersonInfoLoginStatus();
    data.then((value) {
      personInfo = value["data"]!;
      _nickName = RxString(personInfo.profile!.nickname);
      _imgUrl = RxString(personInfo.profile!.avatarUrl);
      _drawerController.updeteUserInfo(_nickName.value, _imgUrl.value);
      logI("获取登录状态正常,昵称为" + _nickName.value);
    }).catchError((e) {
      logE("发生异常");
    });
  }

  @override
  void onReady() async {
    loadNet();
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
