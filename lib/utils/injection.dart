import 'package:event_bus/event_bus.dart';
import 'package:get/get.dart';
import 'package:netease_cloud_music_flutter/http/api/login/api_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

///初始化注入对象
//GetxService 是一个长期存活在应用中的类，它的实例一旦被创建，就不会被自动删除，除非你手动调用Get.reset()。
//因此，GetxService 通常用于需要全局访问和长期存在的服务，例如用户认证、数据库操作、网络请求等。
class Injection extends GetxService {
  Future<void> init() async {
    await Get.putAsync(() => SharedPreferences.getInstance());
    Get.lazyPut(() => ApiSer(), fenix: true);
    Get.lazyPut(() => EventBus(), fenix: true);
  }
}
