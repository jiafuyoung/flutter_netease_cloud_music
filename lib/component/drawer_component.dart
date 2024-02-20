// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:netease_cloud_music_flutter/component/find_component.dart';
import 'package:netease_cloud_music_flutter/utils/log_utils.dart';

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
            //个人信息部分
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        //头像
                        Container(
                          child: CachedNetworkImage(
                            imageUrl: _drawerController._imgUrl.value,
                            width: 30,
                            height: 30,
                          ),
                          margin: EdgeInsets.only(right: 10),
                        ),
                        //昵称
                        Container(
                          child: Text(
                            _drawerController._nickName.value,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          margin: EdgeInsets.only(right: 5),
                        ),
                        //详细信息的图标
                        Image(
                          image: AssetImage(
                              "assets/icons/button_icon/detail_button.png"),
                          width: 30,
                          height: 30,
                        )
                      ],
                    ),
                    height: 30,
                  ),
                  //扫码按钮
                  const SizedBox(
                      child: Image(
                    image: AssetImage("assets/icons/button_icon/scan_code.png"),
                    width: 30,
                    height: 30,
                  )), //扫码按钮
                ],
              ),
              padding: EdgeInsets.fromLTRB(20, 60, 20, 10),
            ),

            ///Expanded填充除了上面不可移动元素的剩余空间，
            ///然后将SingleChildScrollView的滚动区域限制在这片空间，实现部分固定，剩余可无限滚动的效果
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  //卡片组件
                  DrawerCard(drawerCardItem: [
                    DrawerCardTitle(drawerCardTitle: "个人中心"),
                    DrawerListItem(
                      title: Text("消息中心"),
                      leadingWidget: MyIcon(
                          imgUrl: "assets/icons/button_icon/message.png"),
                      click: () => clickList("消息中心"),
                    ),
                    DrawerListItem(
                      title: Text("云贝中心"),
                      leadingWidget: MyIcon(
                          imgUrl: "assets/icons/button_icon/cloud_shell.png"),
                      click: () => clickList("云贝中心"),
                    ),
                  ]),
                  DrawerCard(drawerCardItem: [
                    DrawerCardTitle(drawerCardTitle: "其他"),
                    DrawerListItem(
                      title: Text("设置"),
                      leadingWidget: MyIcon(
                          imgUrl: "assets/icons/button_icon/setting.png"),
                      click: () => clickList("设置"),
                    ),
                    DrawerListItem(
                      title: Text("深色模式"),
                      leadingWidget: MyIcon(
                          imgUrl: "assets/icons/button_icon/dark_model.png"),
                      trailWidget: Switch(
                        value: _drawerController._darkModel.value,
                        onChanged: (value) {
                          _drawerController._darkModel.value = value;
                        },
                      ),
                      click: () => clickList("深色模式" +
                          _drawerController._darkModel.value.toString()),
                    ),
                  ]),
                  DrawerCard(drawerCardItem: [
                    DrawerListItem(
                      title: Text(
                        "退出登录",
                        style: TextStyle(color: Colors.red),
                      ),
                      leadingWidget: SizedBox(
                        width: 60,
                      ),
                      trailWidget: Text(""),
                      click: () => clickList("退出登录"),
                    )
                  ]),
                ],
              )),
            ),
          ],
        )));
  }
}
//====================方法====================================//

void clickList(String msg) {
  logI(msg);
}

//====================抽屉功能小组件====================================//`
///抽屉卡片标题
class DrawerCardTitle extends StatelessWidget {
  final String drawerCardTitle;

  const DrawerCardTitle({super.key, required this.drawerCardTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            drawerCardTitle,
            style: TextStyle(fontSize: 14, color: Colors.grey),
            textAlign: TextAlign.start,
          ),
          Divider()
        ],
      ),
      padding: EdgeInsets.fromLTRB(14, 7, 14, 7),
    );
  }
}

//抽屉页卡片
class DrawerCard extends StatelessWidget {
  final List<Widget> drawerCardItem;
  const DrawerCard({super.key, required this.drawerCardItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: drawerCardItem,
        ),
      ),
      padding: EdgeInsets.fromLTRB(14, 7, 14, 7),
    );
  }
}

//抽屉页list
class DrawerListItem extends StatelessWidget {
  final Widget? leadingWidget;
  final Widget title;
  final Widget? trailWidget;
  final VoidCallback? click;

  const DrawerListItem(
      {Key? key,
      this.leadingWidget,
      required this.title,
      this.click,
      this.trailWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: click,
      leading: leadingWidget, //头部组件
      title: title, //中部文字
      trailing: trailWidget ??
          MyIcon(imgUrl: "assets/icons/button_icon/detail_button.png"), //尾部组件
    );
  }
}

//====================Controller====================================//
class DrawerComponentController extends GetxController {
  RxString _nickName = "组件默认".obs;
  RxString _imgUrl = "组件默认".obs;
  RxBool _darkModel = false.obs;

  void updeteUserInfo(String nickName, String imgUrl) {
    _nickName = RxString(nickName);

    _imgUrl = RxString(imgUrl);
    update();
  }

  void logout() {}
}
