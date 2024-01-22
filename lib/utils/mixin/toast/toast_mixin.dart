import 'package:fluttertoast/fluttertoast.dart';

/// 混入类 又能写成员变量，又能写成员方法，混入类不能拥有【构造方法】
/// 于多混入来说，混入类的顺序是至关重要的，当存在二义性问题时，会 “后来居上”
/// 访问最后混入类的方法或变量,两个混入类间可以通过 on 关键字产生类似于 继承 的关系
mixin ToastMixin {
  void showToast(String? msg,
      {Toast toastLength = Toast.LENGTH_SHORT,
      ToastGravity gravity = ToastGravity.BOTTOM,
      int timeInSecForIos = 1}) {
    Fluttertoast.showToast(
      msg: msg ?? "",
      toastLength: toastLength,
      gravity: gravity,
      timeInSecForIosWeb: timeInSecForIos,
    );
  }

  void showShortToast(String? msg) {
    showToast(msg, toastLength: Toast.LENGTH_SHORT);
  }

  void showLongToast(String? msg) {
    showToast(msg, toastLength: Toast.LENGTH_LONG);
  }
}
