import 'package:logger/logger.dart';

//日志工具类
var _logger = Logger(
    // printer: PrettyPrinter(
    //   methodCount: 0,
    // ),
    );

logV(String msg) {
  _logger.t(msg);
}

logD(String msg) {
  _logger.d(msg);
}

logI(String msg) {
  _logger.i(msg);
}

logW(String msg) {
  _logger.w(msg);
}

logE(String msg) {
  _logger.e(msg);
}

logWTF(String msg) {
  _logger.f(msg);
}
