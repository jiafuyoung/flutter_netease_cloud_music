import 'package:card_swiper/card_swiper.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import "package:get/get.dart";
import 'package:netease_cloud_music_flutter/component/drawer_component.dart';
import 'package:netease_cloud_music_flutter/component/my_icon.dart';
import 'package:netease_cloud_music_flutter/page/find/api/api_find.dart';
import 'package:netease_cloud_music_flutter/page/find/recommend_song_list/recommend.dart';
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
                  img: SvgPicture.asset(
                      "assets/icons/button_icon/daily_song_full.svg"),
                  bottomText: "每日推荐",
                  clickIcon: () {
                    goMyIconWithTextDetail("每日推荐");
                  }),
              FindMyIconWithText(
                  img: SvgPicture.asset(
                      "assets/icons/button_icon/person_random.svg"),
                  bottomText: "私人漫游",
                  clickIcon: () {
                    goMyIconWithTextDetail("私人漫游");
                  }),
              FindMyIconWithText(
                  img: SvgPicture.asset(
                      "assets/icons/button_icon/song_list.svg"),
                  bottomText: "歌单",
                  clickIcon: () {
                    goMyIconWithTextDetail("歌单");
                  }),
              FindMyIconWithText(
                  img: SvgPicture.asset(
                      "assets/icons/button_icon/rank_list.svg"),
                  bottomText: "排行榜",
                  clickIcon: () {
                    goMyIconWithTextDetail("排行榜");
                  }),
              FindMyIconWithText(
                  img: SvgPicture.asset("assets/icons/button_icon/album.svg"),
                  bottomText: "数字专辑",
                  clickIcon: () {
                    goMyIconWithTextDetail("数字专辑");
                  }),
            ],
            scrollDirection: Axis.horizontal,
          ),
        ),
        Container(
          child: const Row(
            children: [
              Text("推荐歌单"),
              Image(
                image: AssetImage("assets/icons/button_icon/detail_button.png"),
                width: 20,
                height: 20,
              ),
            ],
          ),
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        ),
        SizedBox(
          child: ListView.builder(
            itemBuilder: (context, index) {
              logI("开始渲染");
              return FindMyIconWithText(
                  img: Image(
                    image: NetworkImage(
                        controller.recommendList[index].creator.avatarUrl),
                  ),
                  bottomText: controller.recommendList[index].name);
            },
            itemCount: 7,
            scrollDirection: Axis.horizontal,
          ),
          height: 200,
        )
        // Container(
        //   child: FutureBuilder(
        //       future: controller.recommend,
        //       builder: ((context, snapshot) {
        //         if (snapshot.connectionState == ConnectionState.waiting) {
        //           return const CircularProgressIndicator();
        //         } else if (snapshot.hasError) {
        //           return const Text("获取推荐列表发生错误");
        //         } else {
        //           return ListView.builder(
        //             itemBuilder: (context, index) {
        //               logI("开始渲染");
        //               List<Recommend> recomaandList = snapshot.data!.recommend;
        //               return FindMyIconWithText(
        //                   img: Image(
        //                     image: NetworkImage(
        //                         recomaandList[index].creator!.avatarUrl),
        //                   ),
        //                   bottomText: recomaandList[index].name);
        //             },
        //             itemCount: 7,
        //             scrollDirection: Axis.horizontal,
        //           );
        //         }
        //       })),
        //   height: 200,
        // )
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

class FindController extends BaseController<ApiFind> {
  RxList<Recommend> recommendList = <Recommend>[].obs;

  @override
  void loadNet() async {
    httpRequest(ApiFind().getRecommendSongList(), (value) {
      recommendList.addAll(value.recommend ?? []);
    });
  }

  @override
  void onInit() {
    loadNet();
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    showSuccess();
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
