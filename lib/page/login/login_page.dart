import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:netease_cloud_music_flutter/utils/log_utils.dart';
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
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Widget buildContent(BuildContext context) {
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
    Get.lazyPut(() => LoginedController());
    Get.lazyPut(() => MineController());
    Get.lazyPut(() => FindController());
    Get.lazyPut(() => FollowController());
    logD(">>>>>>>>>>>>注入完成");
  }
}
