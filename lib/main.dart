import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:netease_cloud_music_flutter/page/login/login_page.dart';
// import 'package:netease_cloud_music_flutter/page/login/login_page.dart';
import 'package:netease_cloud_music_flutter/pageWidget/common_stateful_widget.dart';
import 'package:netease_cloud_music_flutter/route/routes.dart';
import 'package:netease_cloud_music_flutter/utils/injection.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSDK();
  runApp(MyApp());
}

///初始化SDK
Future<void> initSDK() async {
  // SharedPreferences.setMockInitialValues({});
  await Injection().init();
}

class MyApp extends CommonStatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                // initialBinding: TestBinding(),
                // home: TestPage(),
                //要先通过binding 注入 controller
                initialBinding: LoginBinding(),
                home: const LoginPage(),
                locale: const Locale('zh'),
              )),
    );
  }
}
