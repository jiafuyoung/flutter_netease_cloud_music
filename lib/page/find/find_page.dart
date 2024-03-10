import 'package:card_swiper/card_swiper.dart';
import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:netease_cloud_music_flutter/component/find_page_component.dart';
import 'package:netease_cloud_music_flutter/page/find/api/api_find.dart';
import 'package:netease_cloud_music_flutter/page/find/model/banner_data/find_banner.dart';
import 'package:netease_cloud_music_flutter/page/find/model/rank_song_list/rank_song_list.dart';
import 'package:netease_cloud_music_flutter/page/find/model/recommend_song_list/recommend.dart';
import 'package:netease_cloud_music_flutter/page/find/model/top_list/find_top.dart';
import 'package:netease_cloud_music_flutter/provider/play_songs_model.dart';
import 'package:netease_cloud_music_flutter/utils/log_utils.dart';
import 'package:netease_cloud_music_flutter/widget/pageWidget/base_stateful_widget.dart';
import 'package:netease_cloud_music_flutter/widget/widget_future_builder.dart';
import 'package:provider/provider.dart';

import '../../controller/base_controller.dart';

///通过泛型，类里能直接使用泛型的 controller
class FindPage extends BaseStatefulWidget<FindController> {
  const FindPage({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final svgLength = size.width * 0.25;
    final picLength = size.width * 0.3;
    const picTextHeight = 40.0;
    const svgTextHeight = 20.0;

    final Map<int, RankSongList> rankSongMap = {};

    ///订阅plsysongmodel情况
    return Consumer<PlaySongsModel>(builder: (context, model, _) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              // margin: EdgeInsets.all(20),
              child: controller.bannerList.isEmpty
                  ? Container()
                  : Swiper(
                      itemBuilder: (context, index) {
                        return Container(
                          child: Image.network(
                            controller.bannerList[index].imageUrl!,
                            fit: BoxFit.fill,
                          ),
                          clipBehavior: Clip.hardEdge,
                          height: 180,
                          margin: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18.0))),
                        );
                      },
                      autoplay: true,
                      autoplayDelay: 3000,
                      itemCount: controller.bannerList.length,
                      pagination: const SwiperPagination(),
                    ),
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                      // goSongList(map['bottomText']!);
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
                    logI("这个页面还没写");
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
                      goSongList(controller.recommendList[index].id!,
                          controller.recommendList[index].name);
                    },
                  );
                },
                itemCount: controller.recommendList.length > 7
                    ? 5
                    : controller.recommendList.length,
                scrollDirection: Axis.horizontal,
              ),
              padding: const EdgeInsets.only(left: 20),
            ),
            Container(
              child: FunctionTitle(
                  clickIcon: () {
                    logI("这个页面还没写");
                  },
                  text: "排行榜"),
              margin: const EdgeInsets.fromLTRB(20, 15, 20, 7),
            ),
            SizedBox(
                height: 240,
                width: size.width * 0.95,
                child: Swiper(

                    //轮播图
                    itemCount: controller.rankCount.value,
                    scrollDirection: Axis.horizontal,
                    autoplay: false,
                    loop: false,
                    itemBuilder: (context, rankIndex) {
                      var thisRankList = controller.topList[rankIndex];
                      Map<String, dynamic> map = {};
                      map["id"] = thisRankList.id!;
                      // map["limit"] = 3;
                      map["offset"] = 0;
                      return FindRankListBox(
                        rankListTitle: Container(
                          margin: const EdgeInsets.fromLTRB(20, 15, 20, 7),
                          child: FunctionTitle(
                            clickIcon: () {
                              goSongList(thisRankList.id!, thisRankList.name!);
                            },
                            text: thisRankList.name!,
                          ),
                        ),
                        rankList: Container(
                          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          width: size.width,
                          height: 180,

                          ///使用Future防止网络请求差的时候，数据未及时加载到，出现数组越界的情况
                          ///同时用一个map存已经请求到的rankIndex的数据，防止左滑重复请求
                          child: rankSongMap.containsKey(rankIndex)
                              ? rankSongListView(rankSongMap[rankIndex]!, model)
                              : CustomFutureBuilder<RankSongList>(
                                  params: map,
                                  futureFunc: ApiFind().getRankSongList,
                                  loadingWidget: const Text(""),
                                  builder: (context, songList) {
                                    //每个轮播图里的列表,如果没请求过就请求并放入map
                                    rankSongMap[rankIndex] = songList;
                                    return rankSongListView(songList, model);
                                  },
                                ),
                        ),
                      );
                    }))
            // Container(
            //   child: ,
            // )
          ],
        ),
      );
    });
  }

  ListView rankSongListView(RankSongList songList, PlaySongsModel model) {
    return ListView.builder(
        controller: controller.scrollController,
        itemCount: 3,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, songIndex) {
          var thisSong = songList.songs![songIndex];

          return FindRankList(
              imgUrl: thisSong.al!.picUrl!,
              songName: thisSong.name!,
              author: thisSong.ar!.map((e) => e.name).join("/"), //todo 先只显示一个
              level: "标签",
              clickIcon: () {
                playSong(songList, model, songIndex);
              });
        });
  }

  @override
  bool showSearch() => true;
  @override
  bool showBackButton() => false;

  ///点击FindMyIconWithText跳转
  void goSongList(int playlistId, String name) {
    Future.delayed(
        const Duration(milliseconds: 500),
        () => Get.toNamed("/song_list_page",
            arguments: {"id": playlistId, "name": name}));
    // Get.toNamed(routeUrl);
  }

  void playSong(RankSongList rankSongList, PlaySongsModel model, int index) {
    model.addAllSongToList(rankSongList.songs!, index);
  }
}

///通过泛型，类里能直接使用泛型的api，等同于ApiFind
class FindController extends BaseController<ApiFind> {
  RxList<Recommend> recommendList = <Recommend>[].obs;
  RxList<FindBanner> bannerList = <FindBanner>[].obs;
  RxList<FindTop> topList = <FindTop>[].obs;
  // RxList<RankSongList> rankSongList = <RankSongList>[].obs;
  RxInt rankCount = 0.obs;
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
    httpRequest(api.getBanners(), (value) {
      bannerList.addAll(value.banners ?? []);
    });
    //推荐歌单
    httpRequest(api.getRecommendSongList(), (value) {
      recommendList.addAll(value.recommend ?? []);
    });
    //榜单
    httpRequest(api.getToplist(), (value) {
      rankCount = value.list!.length > 5 ? RxInt(6) : RxInt(value.list!.length);
      topList.addAll(value.list ?? []);
      // for (int i = 0; i < value.list!.length; i++) {
      //   httpRequest(ApiFind().getRankSongList(value.list![i].id!, 3, 0),
      //       (value) {
      //     rankSongList.add(value);
      //   });
      // }
      // rankListFinish = RxBool(true);
    });
  }

  @override
  void onInit() {
    super.onInit();
    showLoading();
    loadNet();
    addSongListListener();
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

//============================================================================//

class FindBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FindController());
  }
}
