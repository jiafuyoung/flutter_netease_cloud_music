import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:netease_cloud_music_flutter/const/constants.dart';
import 'package:netease_cloud_music_flutter/controller/base_controller.dart';
import 'package:netease_cloud_music_flutter/page/login/api/api_login.dart';
import 'package:netease_cloud_music_flutter/http/preferences/user_preferences.dart';
import 'package:netease_cloud_music_flutter/utils/log_utils.dart';
import 'package:netease_cloud_music_flutter/utils/time_util.dart';
import 'package:netease_cloud_music_flutter/widget/pageWidget/base_stateless_widget.dart';
import '../login/component/login_page_top_image.dart';
import '../../utils/responsive.dart';

import '../../component/background.dart';
import '../login/component/login_form.dart';

//登录页
// class LoginPage extends BaseStatefulWidget<LoginController> {
class LoginPage extends BaseStatelessWidget<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    ///flutter 路由跳转时如果按下面的判断进入logined_page时
    ///从logined_page跳转其他页面时会报'!_debugLocked': is not true.
    ///原因是login页面没有绘制，而main设置的home是login
    ///所以在欢迎页里按情况根据是否需要登录跳转
    // if (_loginController.login.isTrue) {
    //   LoginedPage loginedPage =
    //       Get.offAndToNamed("/logined_page") as LoginedPage;
    //   return loginedPage;
    // }
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
    logD(">>>>>>>>>>>>onInit  Login");
    super.onInit();
    showSuccess();
    // loadNet();
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }

  @override
  void loadNet() async {
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
    Get.lazyPut(() => LoginController());
  }
}
