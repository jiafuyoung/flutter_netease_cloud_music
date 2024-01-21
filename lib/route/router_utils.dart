import 'package:get/get.dart';
import 'routes.dart';

class RouterUtils {
  //find页面
  static void toFindPage() {
    Get.toNamed(AppRoutes.findPage);
  }

  static void toLoginPage() {
    Get.toNamed(AppRoutes.loginedPage);
  }

  static void toFollowPage() {
    Get.toNamed(AppRoutes.followPage);
  }

  static void toMinePage() {
    Get.toNamed(AppRoutes.minePage);
  }
}
