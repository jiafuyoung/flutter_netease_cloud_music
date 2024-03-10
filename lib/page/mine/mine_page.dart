import "dart:convert";
import "dart:ui";

import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:netease_cloud_music_flutter/component/mine_page_component.dart';
import "package:netease_cloud_music_flutter/controller/base_controller.dart";
import "package:netease_cloud_music_flutter/http/preferences/user_preferences.dart";
import "package:netease_cloud_music_flutter/page/mine/api/api_mine.dart";
import "package:netease_cloud_music_flutter/page/mine/model/mine_song_list/mine_song_list.dart";
import "package:netease_cloud_music_flutter/page/mine/model/mine_song_list/playlist.dart";
import 'package:netease_cloud_music_flutter/page/mine/model/personinfo/person_info_login_status.dart';
import "package:netease_cloud_music_flutter/page/mine/model/user_detail/user_detail.dart";
import "package:netease_cloud_music_flutter/utils/log_utils.dart";
import 'package:netease_cloud_music_flutter/widget/pageWidget/base_stateful_widget.dart';

class MinePage extends BaseStatefulWidget<MineController> {
  MinePage({Key? key}) : super(key: key);

  final MineController _mineController = Get.find();

  @override
  Widget buildContent(BuildContext context) {
    PersonInfoLoginStatus person = controller.personRx.value;
    UserDetail userDetail = controller.userDetailRx.value;
    MineSongList mineSongList = controller.mineSongListRx.value;

    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              ///背景图
              SizedBox(
                child: CachedNetworkImage(
                  imageUrl: person.profile!.backgroundUrl!,
                  // fit: BoxFit.cover,
                ),
              ),

              ///设置毛玻璃模糊，使背景图不影响上层文字
              // BackdropFilter(
              //   filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
              //   child: Container(
              //     ///产生暗背景效果
              //     color: Colors.black.withOpacity(0.4),
              //   ),
              // ),

              ///渐变模糊 TODO
              ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: ShaderMask(
                    shaderCallback: (rect) {
                      ///线性渐变
                      return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.3)
                          ],
                          stops: const [
                            0.4,
                            0.75
                          ]).createShader(rect);
                    },
                    blendMode: BlendMode.dstOut,
                    child: Image.network(person.profile!.backgroundUrl!,
                        fit: BoxFit.cover, alignment: Alignment.topCenter),
                  )),

              SizedBox(
                child: Column(
                  children: [
                    ///昵称，签名，关注，粉丝，等级
                    PersonInfoComponent(
                      imageUrl: person.profile!.avatarUrl,
                      nickName: person.profile!.nickname,
                      introduce: person.profile?.signature,
                      fansNumber: userDetail.profile!.followeds == null
                          ? ""
                          : userDetail.profile!.followeds.toString(),
                      followNumber: (userDetail.profile!.follows == null)
                          ? ""
                          : userDetail.profile!.follows.toString(),
                      level: userDetail.level == null
                          ? ""
                          : userDetail.level.toString(),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            child: mineSongList.playlist!.isEmpty
                ? Container()
                : Column(
                    children:
                        List.generate(mineSongList.playlist!.length, (index) {
                      Playlist playlist = mineSongList.playlist![index];
                      return SongListItem(
                        imageUrl: playlist.coverImgUrl!,
                        songListName: playlist.name!,
                        author: playlist.creator!.nickname ?? "",
                        playCount: playlist.playCount.toString(),
                        count: playlist.trackCount.toString(),
                        tapAction: () {
                          goToSongList(playlist);
                        },
                      );
                    }),
                  ),
          )
        ],
      ),
    );
  }

  @override
  bool showBackButton() => false;

  void goToSongList(Playlist playlist) {
    logI("进入歌单列表");
    Future.delayed(
        const Duration(milliseconds: 500),
        () => Get.toNamed("/song_list_page",
            arguments: {"id": playlist.id, "name": playlist.name}));
  }
}

class MineController extends BaseController<ApiMine> {
  Rx<PersonInfoLoginStatus> personRx = PersonInfoLoginStatus().obs;
  Rx<UserDetail> userDetailRx = UserDetail().obs;
  Rx<MineSongList> mineSongListRx = MineSongList().obs;

  @override
  void onReady() {
    super.onReady();
    loadNet();
    showSuccess();
  }

  @override
  void loadNet() async {
    logI("!!!!!!!!!!!!!");
    var _userInfoPreference = await UserPreferences().getUserInfoLoginStatus();

    PersonInfoLoginStatus _personInfo =
        PersonInfoLoginStatus.fromJson(jsonDecode(_userInfoPreference!));

    personRx = Rx(_personInfo);
    httpRequest(api.getUserDetail(_personInfo.account!.id!), (value) {
      userDetailRx = Rx(value);
    });
    httpRequest(api.getUserMineSongList(_personInfo.account!.id!), (value) {
      mineSongListRx = Rx(value);
    });
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}

class MineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MineController());
  }
}
