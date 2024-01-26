import 'package:get/get.dart';
import 'package:netease_cloud_music_flutter/page/login/login_page.dart';
import '../logined_page.dart';
import '../page/find/find_page.dart';
import '../page/follow/follow_page.dart';
import '../page/mine/mine_page.dart';

abstract class AppRoutes {
  static const loginedPage = "/logined_page"; //登录后的页面
  static const loginPage = "/login_page"; //登录后的页面
  static const findPage = "/find_page"; //登录后的页面
  static const followPage = "/follow_page"; //登录后的页面
  static const minePage = "/mine_page"; //登录后的页面

  static final routerPages = [
    ///主入口
    GetPage(
        name: AppRoutes.loginedPage, //上面统一定义的静态常量
        page: () => LoginedPage(), //LoginedPage()，页面里所写的构造方法
        binding: LoginedBinding()),
    GetPage(
        name: AppRoutes.loginPage,
        page: () => LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.findPage,
        page: () => FindPage(),
        binding: FindBinding()),
    GetPage(
        name: AppRoutes.followPage,
        page: () => const FollowPage(),
        binding: FollowBinding()),
    GetPage(
        name: AppRoutes.minePage,
        page: () => MinePage(),
        binding: MineBinding()),
  ];
}
