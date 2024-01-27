// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netease_cloud_music_flutter/component/my_icon.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  _DrawerComponentState createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  //这里通过 get.find 拿到 实例
  final DrawerComponentController _drawerController = Get.find();
  @override
  Widget build(BuildContext context) {
    //因为没有继承那个需要状态的通用 widget，所以需要写 obx
    return Obx(() => Drawer(
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        child: Column(
          children: [
            DrawerHeader(
                child: DrawerHeader(
              child: Row(
                children: [
                  Expanded(
                    child: Image(
                      image: NetworkImage(_drawerController._imgUrl.value),
                      width: 30,
                      height: 30,
                    ),
                  ), //头像
                  Text(
                    _drawerController._nickName.value,
                  ),
                  const Expanded(
                      child: Image(
                    image: AssetImage(
                        "assets/icons/button_icon/detail_button.png"),
                    width: 30,
                    height: 30,
                  )), //可点击详细信息的图标
                  const Expanded(
                      child: Image(
                    image: AssetImage("assets/icons/button_icon/scan_code.png"),
                    width: 30,
                    height: 30,
                  )), //扫码按钮
                ],
              ),
              // padding: EdgeInsets.fromLTRB(40, 40, 40, 40),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            )),
            Container(
              child: Column(
                children: [
                  ListTile(
                    leading:
                        MyIcon(imgUrl: "assets/icons/button_icon/message.png"),
                    title: Text("消息中心"),
                  ),
                  ListTile(
                    title: Text("this "),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              margin: EdgeInsets.all(20),
            ),
            //可用Container来分隔
            // Container(
            //   color: Colors.red,
            //   height: 10,
            // ),
            Container(
              child: Column(
                children: [
                  ListTile(
                    leading: Text("lead"),
                    title: Text("侧边栏 2"),
                  ),
                  ListTile(
                    title: Text("this "),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              margin: EdgeInsets.all(20),
            ),
          ],
        )));
  }
}

class DrawerComponentController extends GetxController {
  RxString _nickName = "组件默认".obs;
  RxString _imgUrl = "组件默认".obs;

  void updeteUserInfo(String nickName, String imgUrl) {
    _nickName = RxString(nickName);

    _imgUrl = RxString(imgUrl);
    update();
  }

  void logout() {}
}
