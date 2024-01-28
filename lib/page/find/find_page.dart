import 'package:card_swiper/card_swiper.dart';
import "package:flutter/material.dart";
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
    final size = MediaQuery.of(context).size;
    final svgLength = size.width * 0.25;
    final picLength = size.width * 0.3;
    const picTextHeight = 40.0;
    const svgTextHeight = 20.0;
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
            pagination: const SwiperPagination(),
            control: const SwiperControl(),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: svgLength + svgTextHeight,
          child: ListView.builder(
            itemBuilder: (context, index) {
              Map<String, String> map = controller.data[index];
              return FindPicWithText(
                pic: FindImportantEntrySvg(
                  img: map['img']!,
                  sideLength: svgLength,
                ),
                text: FindTextBelowEntrySvg(
                  text: map['bottomText']!,
                  textHeight: svgTextHeight,
                  textWidth: svgLength,
                ),
                clickIcon: () {
                  goMyIconWithTextDetail(map['bottomText']!);
                },
              );
            },
            itemCount: controller.data.length,
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
          margin: const EdgeInsets.fromLTRB(20, 15, 20, 7),
        ),
        Container(
          height: picLength + picTextHeight,
          child: ListView.builder(
            ///设置滚动控制器
            controller: controller.scrollController,
            itemBuilder: (context, index) {
              return FindPicWithText(
                pic: FindSongListPic(
                  img: controller.recommendList[index].creator.avatarUrl,
                  sideLength: picLength,
                ),
                text: FindTextBelowPic(
                  text: controller.recommendList[index].name,
                  textHeight: picTextHeight,
                  textWidth: svgLength,
                ),
                clickIcon: () {
                  goMyIconWithTextDetail(controller.recommendList[index].name);
                },
              );
            },
            itemCount: 7,
            scrollDirection: Axis.horizontal,
          ),
          padding: const EdgeInsets.only(left: 20),
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

class FindController extends BaseController<ApiFind> {
  RxList<Recommend> recommendList = <Recommend>[].obs;
  List<Map<String, String>> data = [
    {
      "img": "assets/icons/button_icon/daily_song_full.svg",
      "bottomText": "每日推荐",
      "routerUrl": "每日推荐"
    },
    {
      "img": "assets/icons/button_icon/person_random.svg",
      "bottomText": "私人漫游",
      "routerUrl": "私人漫游"
    },
    {
      "img": "assets/icons/button_icon/song_list.svg",
      "bottomText": "歌单",
      "routerUrl": "歌单"
    },
    {
      "img": "assets/icons/button_icon/rank_list.svg",
      "bottomText": "排行榜",
      "routerUrl": "排行榜"
    },
    {
      "img": "assets/icons/button_icon/album.svg",
      "bottomText": "数字专辑",
      "routerUrl": "数字专辑"
    }
  ];

  ScrollController scrollController = ScrollController();

  @override
  void loadNet() async {
    httpRequest(ApiFind().getRecommendSongList(), (value) {
      data[1];
      recommendList.addAll(value.recommend ?? []);
    });
  }

  @override
  void onInit() {
    loadNet();
    addSongListListener();
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    showSuccess();
  }

  @override
  void onHidden() {
    logI("触发onHidden");
  }

  void addSongListListener() {
    /// 为滚动控制器添加监听
    scrollController.addListener(() {
      /// _scrollController.position.pixels 是当前像素点位置
      /// _scrollController.position.maxScrollExtent 当前列表最大可滚动位置
      /// 如果二者相等 , 那么就触发上拉加载更多机制
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        /// 触发上拉加载更多机制
        logI("拉到头了");
      }
    });
  }
}

class FindBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FindController());
  }
}
