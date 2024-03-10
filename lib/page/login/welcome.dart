import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netease_cloud_music_flutter/component/drawer_component.dart';
import 'package:netease_cloud_music_flutter/const/constants.dart';
import 'package:netease_cloud_music_flutter/controller/base_controller.dart';
import 'package:netease_cloud_music_flutter/http/preferences/user_preferences.dart';
import 'package:netease_cloud_music_flutter/logined_page.dart';
import 'package:netease_cloud_music_flutter/page/find/find_page.dart';
import 'package:netease_cloud_music_flutter/page/follow/follow_page.dart';
import 'package:netease_cloud_music_flutter/page/login/login_page.dart';
import 'package:netease_cloud_music_flutter/page/mine/mine_page.dart';
import 'package:netease_cloud_music_flutter/page/secondary_page/song_list/song_list_page.dart';
import 'package:netease_cloud_music_flutter/utils/log_utils.dart';
import 'package:netease_cloud_music_flutter/utils/time_util.dart';
import 'package:netease_cloud_music_flutter/widget/pageWidget/base_stateless_widget.dart';

class WelcomePage extends BaseStatelessWidget<WelcomeController> {
  const WelcomePage({super.key});

// 方式一通过 ConstrainedBox 的 constraints 属性设置图片充满全屏
// ConstrainedBox(
//   constraints: BoxConstraints.expand(), // 自适应屏幕
//   child: Image.asset(
//     "assets/images/girl.jpeg",
//      fit: BoxFit.cover,
//   ),
// )
// 方式二通过设置 Container 的 width 和 height 为屏幕的宽高，让图片充满全屏
// Container(
//   width: MediaQuery.of(context).size.width, // 屏幕宽度
//   height: MediaQuery.of(context).size.height, // 屏幕高度
//   child: Image.asset(
//     "assets/images/girl.jpeg",
//      fit: BoxFit.cover,
//   ),
// )
// 方式三如果你用了层级组件 Stack ，你也可以这样设置
// Stack(
//   children: [
//     Positioned.fill(
//       child: Image.asset(
//         "assets/images/girl.jpeg",
//          fit: BoxFit.cover,
//       ),
//     ),
//   ],
// )

  @override
  Widget buildContent(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(), // 自适应屏幕
      child: Image.asset(
        "images/welcome.png",
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  bool showTitleBar() => false;
}

class WelcomeController extends BaseController {
  @override
  void loadNet() async {
    var isLogin = await UserPreferences().getIsLoggedIn();
    var lastLogin = await UserPreferences().getLastLogin();
    logI("加载本地状态完成");
    if (isLogin != null && isLogin) {
      logI("登录了，判断时间");
      if (nowSeconds() - lastLogin! <= ONE_WEEK_SECONDS) {
        logI("在期限内");
        Future.delayed(const Duration(milliseconds: JUMP_DELAY_TIME),
            () => Get.offAndToNamed("/logined_page"));
      } else {
        logI("过期");
        Future.delayed(const Duration(milliseconds: JUMP_DELAY_TIME),
            () => Get.offAndToNamed("/login_page"));
      }
    } else {
      logI("未登录");
      Future.delayed(const Duration(milliseconds: JUMP_DELAY_TIME),
          () => Get.offAndToNamed("/login_page"));
    }
  }

  @override
  void onHidden() {}

  @override
  void onInit() {
    super.onInit;
    showSuccess();
    loadNet();
  }
}

class WelcomeBinding extends Bindings {
  ///新增页面时，如果是通过Controller+BaseStatefulWidget方式，需提前注入SongListController
  ///如果不在这里注入，就在每个页面里通过bindding注入，然后在路由配置处配置好binding
  @override
  void dependencies() {
    logD(">>>>>>>>>>>>开始注入代码");
    Get.lazyPut(() => WelcomeController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => LoginedController());
    Get.lazyPut(() => DrawerComponentController());
    Get.lazyPut(() => MineController());
    Get.lazyPut(() => FindController());
    Get.lazyPut(() => FollowController());
    Get.lazyPut(() => SongListController());
    logD(">>>>>>>>>>>>注入完成");
  }
}
