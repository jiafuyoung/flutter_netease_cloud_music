import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:netease_cloud_music_flutter/component/drawer_component.dart';
import 'package:netease_cloud_music_flutter/const/constants.dart';
import 'package:netease_cloud_music_flutter/controller/base_controller.dart';
import 'package:netease_cloud_music_flutter/page/login/api/api_login.dart';
import 'package:netease_cloud_music_flutter/http/preferences/user_preferences.dart';
import 'package:netease_cloud_music_flutter/utils/log_utils.dart';
import 'package:netease_cloud_music_flutter/utils/time_util.dart';
import 'package:netease_cloud_music_flutter/widget/pageWidget/base_stateless_widget.dart';
import '../../logined_page.dart';
import '../find/find_page.dart';
import '../follow/follow_page.dart';
import '../login/component/login_page_top_image.dart';
import '../../utils/responsive.dart';

import '../../component/background.dart';
import '../login/component/login_form.dart';
import '../mine/mine_page.dart';

//登录页
// class LoginPage extends BaseStatefulWidget<LoginController> {
class LoginPage extends BaseStatelessWidget<LoginController> {
  LoginPage({Key? key}) : super(key: key);

  final LoginController _loginController = Get.put(LoginController());
  @override
  Widget buildContent(BuildContext context) {
    if (_loginController.login.isTrue) {
      LoginedPage loginedPage =
          Get.offAndToNamed("/logined_page") as LoginedPage;
      return loginedPage;
    }
    logI("未登录");
    return const Background(
      child: SingleChildScrollView(
        //设置桌面和移动两端
        child: Responsive(
          mobile: MobileLoginScreen(), //移动端
          //桌面端
          desktop: Row(
            children: [
              Expanded(
                child: LoginPageTopImage(),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 450,
                      child: LoginForm(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginController extends BaseController<ApiLogin> {
  var login = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadNet();
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }

  @override
  void loadNet() async {
    // logI("获取登录状态");
    // personInfo.then((value) {
    //   //正确获取到用户信息
    //   logI("登录状态" + value.toJson().toString());
    //   login = RxBool(true);
    //   UserPreferences().setUserInfo(jsonEncode(value));
    // }).catchError((e) async {
    //如果异常就从上次登录的持久化中获取，前提是本地的数据未过期
    var isLogin = await UserPreferences().getIsLoggedIn();
    var lastLogin = await UserPreferences().getLastLogin();
    if (isLogin != null && isLogin) {
      logI("有登录过");
      if (nowSeconds() - lastLogin! <= ONE_WEEK_SECONDS) {
        logI("在期限内");
        login = RxBool(true);
      } else {
        logI("过期");
      }
    }
    showSuccess();
    logI(login.string);
  }
}

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center, //主轴排列
      children: <Widget>[
        LoginPageTopImage(), //登录页上半部图片
        Row(
          children: [
            Spacer(), //Spacer() 相当于弹簧的效果,使两个控件之间的距离达到最大值
            Expanded(
              flex: 8,
              child: LoginForm(), //账号密码表单
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    logD(">>>>>>>>>>>>开始注入代码");
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => DrawerComponentController());
    Get.lazyPut(() => LoginedController());
    Get.lazyPut(() => MineController());
    Get.lazyPut(() => FindController());
    Get.lazyPut(() => FollowController());
    logD(">>>>>>>>>>>>注入完成");
  }
}
