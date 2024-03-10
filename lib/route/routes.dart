import 'package:get/get.dart';
import 'package:netease_cloud_music_flutter/page/login/login_page.dart';
import 'package:netease_cloud_music_flutter/page/secondary_page/song/play_song_page.dart';
import 'package:netease_cloud_music_flutter/page/secondary_page/song_list/song_list_page.dart';
import '../logined_page.dart';
import '../page/find/find_page.dart';
import '../page/follow/follow_page.dart';
import '../page/mine/mine_page.dart';

abstract class AppRoutes {
  static const loginedPage = "/logined_page"; //登录后的页面
  static const loginPage = "/login_page"; //登录页
  static const findPage = "/find_page"; //发现页
  static const followPage = "/follow_page"; //关注页
  static const minePage = "/mine_page"; //个人信息页面
  static const playSongPage = "/play_song_page"; //播放页
  static const songListPage = "/song_list_page"; //歌单里的歌曲列表页面

  static final routerPages = [
    ///主入口
    GetPage(
        name: AppRoutes.loginedPage, //上面统一定义的静态常量
        page: () => const LoginedPage(), //LoginedPage()，页面里所写的构造方法
        binding: LoginedBinding()),
    GetPage(
        name: AppRoutes.loginPage,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.findPage,
        page: () => const FindPage(),
        binding: FindBinding()),
    GetPage(
        name: AppRoutes.followPage,
        page: () => const FollowPage(),
        binding: FollowBinding()),
    GetPage(
        name: AppRoutes.minePage,
        page: () => MinePage(),
        binding: MineBinding()),
    GetPage(
      name: AppRoutes.playSongPage,
      page: () => const PlaySongsPage(),
    ),
    GetPage(
        name: AppRoutes.songListPage,
        page: () => const SongListPage(),
        binding: SongListBinding()),
  ];
}
