import 'package:card_swiper/card_swiper.dart';
import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:netease_cloud_music_flutter/component/drawer_component.dart';
import 'package:netease_cloud_music_flutter/component/my_icon.dart';
import 'package:netease_cloud_music_flutter/http/api/login/api_login.dart';
import 'package:netease_cloud_music_flutter/utils/log_utils.dart';
import 'package:netease_cloud_music_flutter/widget/pageWidget/base_stateful_widget.dart';

import '../../controller/base_controller.dart';

//不能继承 Login，否则不能使用 controller 里的网络请求
// class FindPage extends LoginedPage<FindController> {
class FindPage extends BaseStatefulWidget<FindController> {
  FindPage({Key? key}) : super(key: key);

  @override
  bool showDrawer() {
    return true;
  }

  @override
  bool showSearch() {
    return true;
  }

  @override
  Widget buildContent(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          // margin: EdgeInsets.all(20),
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Image.network(
                "http://via.placeholder.com/350x150",
                fit: BoxFit.fill,
              );
            },
            itemCount: 3,
            pagination: SwiperPagination(),
            control: SwiperControl(),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 100,
          // width: 1000,
          child: ListView(
            children: [
              FindMyIconWithText(
                  imgUrl: "assets/icons/button_icon/daily_song_full.svg",
                  bottomText: "每日推荐",
                  clickIcon: () {
                    goMyIconWithTextDetail("每日推荐");
                  }),
              FindMyIconWithText(
                  imgUrl: "assets/icons/button_icon/person_random.svg",
                  bottomText: "私人漫游",
                  clickIcon: () {
                    goMyIconWithTextDetail("私人漫游");
                  }),
              FindMyIconWithText(
                  imgUrl: "assets/icons/button_icon/song_list.svg",
                  bottomText: "歌单",
                  clickIcon: () {
                    goMyIconWithTextDetail("歌单");
                  }),
              FindMyIconWithText(
                  imgUrl: "assets/icons/button_icon/rank_list.svg",
                  bottomText: "排行榜",
                  clickIcon: () {
                    goMyIconWithTextDetail("排行榜");
                  }),
              FindMyIconWithText(
                  imgUrl: "assets/icons/button_icon/album.svg",
                  bottomText: "数字专辑",
                  clickIcon: () {
                    goMyIconWithTextDetail("数字专辑");
                  }),
            ],
            scrollDirection: Axis.horizontal,
          ),
        ),
        Container(
          child: Row(
            children: [
              Text("推荐歌单"),
              Image(
                image: AssetImage("assets/icons/button_icon/detail_button.png"),
                width: 20,
                height: 20,
              ),
            ],
          ),
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        )
      ],
    );
  }

  @override
  bool showBackButton() => false;

  //顶部的在父类关闭了，这里开启的是子类，第二层的
  @override
  bool showTitleBar() {
    return true;
  }

  //子部分的顶部标题
  @override
  String titleString() => "发现";

  @override
  Widget indexDrawer() {
    return const DrawerComponent();
  }

  ///点击FindMyIconWithText跳转
  void goMyIconWithTextDetail(String routeUrl) {
    logI("假装已经跳转" + routeUrl);
    // Get.toNamed(routeUrl);
  }
}

class FindController extends BaseController<ApiSer> {
  @override
  void loadNet() {
    showSuccess();
  }

  @override
  void onReady() async {
    super.onReady();
    loadNet();
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}

class FindBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FindController());
  }
}
