import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:netease_cloud_music_flutter/const/constants.dart';
import 'package:netease_cloud_music_flutter/controller/base_controller.dart';
import 'package:netease_cloud_music_flutter/http/api/api_ser.dart';
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
      // return null;
      // return const LoginedPage();
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

class LoginController extends BaseController<ApiSer> {
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
    var isLogin = await UserPreferences().getIsLoggedIn();
    var lastLogin = await UserPreferences().getLastLogin();
    if (isLogin != null && isLogin) {
      logI("相差时间" + (nowSeconds() - lastLogin!).toString());
      if (nowSeconds() - lastLogin <= ONE_WEEK_SECONDS) {
        login = RxBool(true);
        // }
      } else {
        logI("islogin 无值或为 false");
      }
    }
    showSuccess();
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
    Get.lazyPut(() => LoginedController());
    Get.lazyPut(() => MineController());
    Get.lazyPut(() => FindController());
    Get.lazyPut(() => FollowController());
    logD(">>>>>>>>>>>>注入完成");
  }
}
