import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netease_cloud_music_flutter/component/load_state_widget.dart';
import 'package:netease_cloud_music_flutter/component/mine_page_component.dart';
import 'package:netease_cloud_music_flutter/component/play_song_component.dart';
import 'package:netease_cloud_music_flutter/controller/base_controller.dart';
import 'package:netease_cloud_music_flutter/page/find/api/api_find.dart';
import 'package:netease_cloud_music_flutter/page/find/model/rank_song_list/song.dart';
import 'package:netease_cloud_music_flutter/page/secondary_page/song/api/api_song.dart';
import 'package:netease_cloud_music_flutter/page/secondary_page/song_list/model/song_list_detail/song_list_detail.dart';
import 'package:netease_cloud_music_flutter/page/secondary_page/song_list/model/song_list_detail/track.dart';
import 'package:netease_cloud_music_flutter/provider/play_songs_model.dart';
import 'package:netease_cloud_music_flutter/widget/pageWidget/base_stateful_widget.dart';
import 'package:provider/provider.dart';

class SongListPage extends BaseStatefulWidget<SongListController> {
  const SongListPage({Key? key}) : super(key: key);

  @override
  bool showBackButton() => true;

  @override
  bool showTitleBar() => true;

  @override
  Widget titleWidget() {
    return titleView(controller.inParam["name"] ?? "");
  }

  @override
  Widget buildContent(BuildContext context) {
    if (!controller.finish.value) {
      return Container();
    }
    // SongListDetail songListDetail = controller.songListDetailRx.value;
    // List<Track> songList = controller.trackListRx;
    List<Song> songList = controller.songListRx;
    // return Container();
    return SizedBox(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: songList.isEmpty
                  ? Container()
                  : Column(
                      children: List.generate(
                          songList.length,
                          (index) => SongItem(
                                isPlay: false,
                                seq: (index + 1).toString(),
                                song: songList[index],
                                tapAction: () => playSongAndAddAllMusic(
                                    context, songList, index),
                              ))),
            ),
          ),
          const PlaySongBottom(),
        ],
      ),
    );
  }

  void playSongAndAddAllMusic(
      BuildContext context, List<Song> songList, int index) {
    Provider.of<PlaySongsModel>(context, listen: false)
        .addAllSongToList(songList, index);
  }
}

class SongListController extends BaseController<ApiSong> {
  RxBool finish = false.obs;
  Map<String, dynamic> inParam = {};
  Rx<SongListDetail> songListDetailRx = SongListDetail().obs;
  RxList<Song> songListRx = <Song>[].obs;
  RxList<Track> trackListRx = <Track>[].obs;

  @override
  void loadNet() {
    // httpRequest(api.getUserPlayListById(playlist.id!), (value) {
    //   songListDetailRx = Rx(value);
    //   trackListRx = RxList(value.playlist!.tracks!);
    // });
    Map<String, dynamic> params = {
      "id": inParam["id"],
    };
    httpRequest(ApiFind().getRankSongList(params), (value) {
      songListRx = RxList(value.songs!);
    });
  }

  @override
  void onReady() {
    super.onReady();
    inParam = Get.arguments;
    loadNet();
    finish = RxBool(true);
    showSuccess();
  }

  @override
  void onHidden() {}
}

class SongListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SongListController());
  }
}
