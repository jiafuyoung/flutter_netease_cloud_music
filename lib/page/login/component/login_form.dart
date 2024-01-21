import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:netease_cloud_music_flutter/const/api_constant.dart';
import 'package:netease_cloud_music_flutter/http/api/api_ser.dart';
import 'package:netease_cloud_music_flutter/widget/dialog/dialog_common_style.dart';
import '../../../const/constants.dart';
import '../../../http/result/base_result.dart';
import '../../../http/result/base_wan_result.dart';
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
              Get.offAndToNamed("/logined_page");
              // Future<PersonInfo> personInfo =
              //     ApiSer().getPersonInfo(phone, password);
              // personInfo.then((t) {
              //   //code符合成功则跳转登录页
              //   if (t.code == ApiConstant.API_SUCESS) {
              //     Get.offAndToNamed("/logined_page");
              //   } else {
              //     //不成功则显示提示
              //     showDialog(
              //         context: context,
              //         builder: (context) {
              //           return const AlertDialog(
              //             content: Text("登录出错"),
              //           );
              //         });
              //   }
              // }).catchError((e) {
              //   logE("网络请求异常====>error:$e");
              // });
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

  //登录方法
  int? _login(c) {
    Future<PersonInfo> personInfo = ApiSer().getPersonInfo(phone, password);
    personInfo.then((t) {
      ///添加结果码判断（同时考虑加入List的判断逻辑）
      if (t is BaseWanResult) {
        logI("出错 1");
      } else if (t is BaseResult) {
        logI("出错 2");
      } else {
        return t.code;
      }
    }).catchError((e) {
      logE("网络请求异常====>error:$e");
    });
    return null;
  }
}
