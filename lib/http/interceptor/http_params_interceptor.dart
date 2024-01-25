import 'package:dio/dio.dart';
import 'package:netease_cloud_music_flutter/const/constants.dart';
import 'package:netease_cloud_music_flutter/http/preferences/user_preferences.dart';

///请求参数拦截器
class HttpParamsInterceptor extends Interceptor {
  static const VERSION = "version";
  static const TOKEN = "token";
  static const DEVICE_NO = "deviceNo";
  static const APP_TYPE_KEY = "appType";
  static const APP_TYPE_VALUE = "Android";
  static const APP_ID_KEY = "appId";
  static const JSON_BODY = "jsonBody";
  static const SIGN = "sign";
  static const TIMESTAMP = "timestamp";
  static const UTF_8 = "UTF-8";
  static const APP_ID = "test_android";

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var headers = options.headers;
    Map<String, dynamic> body = options.data;
    var cookie = await UserPreferences().getCookies();

    if (options.method == METHOD_GET) {
      options.path = options.path + "?cookie=" + cookie.toString();
    } else {
      body["cookie"] = cookie.toString();
    }

    headers["token"] =
        "MHRYOVRHbEZBL1M0anlXRTdrYWY3Z2hpL1hzWFNZTTh4dWI1NXdKdjRFTG1obUhrN1hjbnJieDlZUnUwT1ArWkRkbmp0ajdIR3dpU1dSdGJRTFRnNnZUZEtwV1dIQWpxSWFORjNUU3JsRzA9";

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
}
