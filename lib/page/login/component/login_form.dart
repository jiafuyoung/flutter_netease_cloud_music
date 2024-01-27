import 'dart:convert';

import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:netease_cloud_music_flutter/const/api_constant.dart';
import 'package:netease_cloud_music_flutter/page/login/api/api_login.dart';
import 'package:netease_cloud_music_flutter/http/preferences/user_preferences.dart';
import '../../../const/constants.dart';
import '../../../utils/log_utils.dart';
import '../../mine/model/person_info.dart';

//登录表单组件
class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginformState();
}

class _LoginformState extends State<LoginForm> {
  var phone = "";
  var password = "";
  var code = -1;

  @override
  // Widget buildContent(BuildContext context) {
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "手机号",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
            onChanged: (value) {
              setState(() {
                phone = value;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "密码",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            //点击登录跳转
            onPressed: () async {
              Get.testMode = true;
              UserPreferences().setPhone(phone);

              Future<PersonInfo> personInfo =
                  // ApiSer().getPersonInfo(phone, password);
                  ApiLogin().getPersonInfo(phone, password);
              personInfo.then((t) {
                if (t.code == ApiConstant.API_SUCESS) {
                  ///code符合成功则跳转登录页
                  ///jsonEncode，要用 encode 转为 json 字符串，tostring 得来的无法解析，会出现 key 和 value 没有双引号包裹的非 json 串
                  UserPreferences().setLogin(jsonEncode(t));
                  UserPreferences().setIsLoggedIn(true);
                  logI("cooki===" + t.cookie);
                  UserPreferences().setCookies(t.cookie);
                  Get.offAndToNamed("/logined_page");
                } else {
                  //登录失败时持久化登录状态置为 false，好判断
                  logI("登录失败并修改登录状态");
                  UserPreferences().setIsLoggedIn(false);
                  //不成功则显示提示
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          content: Text("登录出错"),
                        );
                      });
                }
              }).catchError((e) {
                logE("网络请求异常====>error:$e");
              });
            },
            child: Text(
              "Login".toUpperCase(),
            ),
          ),
          const SizedBox(height: defaultPadding),

          //没有账号，跳转到注册页，默认都有账号，不实现注册功能
          // AlreadyHaveAnAccountCheck(
          //   press: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) {
          //           return const SignUpScreen();
          //         },
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
