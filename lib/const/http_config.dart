import 'package:dio/dio.dart';

class HttpConfig {
  //接口基础地址
  static const baseUrl = 'http://wawayoung.top:3000';
  static const connectTimeout = 5000;
  static const receiveTimeout = 3000;

  //基础配置
  static final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout);
}
