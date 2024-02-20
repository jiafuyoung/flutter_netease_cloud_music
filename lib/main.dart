import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:netease_cloud_music_flutter/application.dart';
import 'package:netease_cloud_music_flutter/page/login/welcome.dart';
import 'package:netease_cloud_music_flutter/provider/play_list_model.dart';
import 'package:netease_cloud_music_flutter/provider/play_songs_model.dart';
// import 'package:netease_cloud_music_flutter/page/login/login_page.dart';
import 'package:netease_cloud_music_flutter/widget/pageWidget/common_stateful_widget.dart';
import 'package:netease_cloud_music_flutter/route/routes.dart';
import 'package:netease_cloud_music_flutter/utils/injection.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initSDK();
  Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<PlaySongsModel>(
        create: (_) => PlaySongsModel()..init(),
      ),
      ChangeNotifierProvider<PlayListModel>(
        create: (_) => PlayListModel(),
      ),
    ],
    child: const MyApp(),
  ));
}

///初始化SDK
Future<void> initSDK() async {
  await Injection().init();
}

class MyApp extends CommonStatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  ///设置并启用Dart：Preview Flutter Ui Guides选项。这样可以很容易地发现代码中的父子关系，这在UI文件中有许多嵌套小部件时尤其有用。
  @override
  Widget build(BuildContext context) {
    Application.screenWidth = MediaQuery.of(context).size.width;
    return RefreshConfiguration(
      footerTriggerDistance: 15,
      dragSpeedRatio: 0.91,
      headerBuilder: () => const MaterialClassicHeader(),
      footerBuilder: () => const ClassicFooter(),
      enableLoadingWhenNoData: false,
      enableRefreshVibrate: false,
      enableLoadMoreVibrate: false,
      shouldFooterFollowWhenNotFull: (state) {
        // If you want load more with noMoreData state ,may be you should return false
        return false;
      },
      child: ScreenUtilInit(
          designSize: const Size(750, 1334),
          builder: (context, weight) => GetMaterialApp(
                debugShowCheckedModeBanner: false, //关闭右上角debug 字样
                getPages: AppRoutes.routerPages,
                defaultTransition: Transition.rightToLeft,
                transitionDuration: const Duration(milliseconds: 150),
                title: 'Flutter 网易云',
                theme: ThemeData(
                  primarySwatch: Colors.red,
                ),
                //要先通过binding 注入 controller
                initialBinding: WelcomeBinding(),
                home: const WelcomePage(),
                locale: const Locale('zh'),
              )),
    );
  }
}
