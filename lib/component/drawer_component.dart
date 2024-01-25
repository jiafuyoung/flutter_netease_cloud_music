import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Obx(() => Drawer(
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
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            )),
            const ListTile(
              leading: Text("lead"),
              title: Text("侧边栏 2"),
            ),
            const ListTile(
              title: Text("this "),
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
}