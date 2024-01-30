import 'package:card_swiper/card_swiper.dart';
import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:netease_cloud_music_flutter/component/drawer_component.dart';
import 'package:netease_cloud_music_flutter/component/find_component.dart';
import 'package:netease_cloud_music_flutter/page/find/api/api_find.dart';
import 'package:netease_cloud_music_flutter/page/find/banner_data/find_banner.dart';
import 'package:netease_cloud_music_flutter/page/find/rank_song_list/rank_song_list.dart';
import 'package:netease_cloud_music_flutter/page/find/rank_song_list/song.dart';
import 'package:netease_cloud_music_flutter/page/find/recommend_song_list/recommend.dart';
import 'package:netease_cloud_music_flutter/page/find/top_list/find_top.dart';
import 'package:netease_cloud_music_flutter/utils/log_utils.dart';
import 'package:netease_cloud_music_flutter/widget/pageWidget/base_stateful_widget.dart';

import '../../controller/base_controller.dart';

//不能继承 Login，否则不能使用 controller 里的网络请求
// class FindPage extends LoginedPage<FindController> {
class FindPage extends BaseStatefulWidget<FindController> {
  const FindPage({Key? key}) : super(key: key);

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
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 200,
            // margin: EdgeInsets.all(20),
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Image.network(
                    controller.bannerList[index].imageUrl!,
                    fit: BoxFit.fill,
                  ),
                  clipBehavior: Clip.hardEdge,
                  height: 180,
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(18.0))),
                );
              },
              autoplay: true,
              itemCount: controller.bannerList.length,
              pagination: const SwiperPagination(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
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
            child: FunctionTitle(
                clickIcon: () {
                  goMyIconWithTextDetail("推荐歌单");
                },
                text: "推荐歌单"),
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
                    goMyIconWithTextDetail(
                        controller.recommendList[index].name);
                  },
                );
              },
              itemCount: 7,
              scrollDirection: Axis.horizontal,
            ),
            padding: const EdgeInsets.only(left: 20),
          ),
          Container(
            child: FunctionTitle(
                clickIcon: () {
                  goMyIconWithTextDetail("排行榜");
                },
                text: "排行榜"),
            margin: const EdgeInsets.fromLTRB(20, 15, 20, 7),
          ),
          SizedBox(
              height: 240,
              width: size.width * 0.95,
              child: Swiper(
                  itemCount: controller.rankCount.value,
                  scrollDirection: Axis.horizontal,
                  autoplay: false,
                  loop: false,
                  itemBuilder: (context, rankIndex) {
                    return FindRankListBox(
                      rankListTitle: Container(
                        margin: const EdgeInsets.fromLTRB(20, 15, 20, 7),
                        child: FunctionTitle(
                          clickIcon: () {
                            goMyIconWithTextDetail(
                                controller.topList[rankIndex].name!);
                          },
                          text: controller.topList[rankIndex].name!,
                        ),
                      ),
                      rankList: Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        width: size.width,
                        height: 180,
                        child: ListView.builder(
                            controller: controller.scrollController,
                            itemCount: 3,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, songIndex) {
                              return FindRankList(
                                  imgUrl: controller.rankSongList[rankIndex]
                                      .songs![songIndex].al!.picUrl!,
                                  text1: controller.rankSongList[rankIndex]
                                      .songs![songIndex].name!,
                                  text2: controller
                                      .rankSongList[rankIndex]
                                      .songs![songIndex]
                                      .ar![0]
                                      .name!, //todo 先只显示一个
                                  text3: "标签",
                                  clickIcon: () {
                                    goMyIconWithTextDetail("具体内容");
                                  });
                            }),
                      ),
                    );
                  }))
          // Container(
          //   child: ,
          // )
        ],
      ),
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
  RxList<FindBanner> bannerList = <FindBanner>[].obs;
  RxList<FindTop> topList = <FindTop>[].obs;
  RxList<RankSongList> rankSongList = <RankSongList>[].obs;
  RxInt rankCount = 6.obs;
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
    //轮播图
    httpRequest(ApiFind().getBanners(), (value) {
      bannerList.addAll(value.banners ?? []);
    });
    //推荐歌单
    httpRequest(ApiFind().getRecommendSongList(), (value) {
      recommendList.addAll(value.recommend ?? []);
    });
    //榜单
    httpRequest(ApiFind().getToplist(), (value) {
      topList.addAll(value.list ?? []);
      for (int i = 1; i <= value.list!.length; i++) {
        httpRequest(ApiFind().getRankSongList(value.list![i].id!, 3, 0),
            (value) {
          rankSongList.add(value);
        });
      }
    });
  }

  @override
  void onInit() {
    loadNet();
    addSongListListener();
    super.onInit();
  }

  //榜单歌单
  void getRankSongList() {
    for (int i = 1; i <= topList.length; i++) {
      httpRequest(ApiFind().getRankSongList(topList[i].id!, 3, 0), (value) {
        rankSongList.add(value);
      });
    }
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
