import 'package:dio/dio.dart';
import 'package:netease_cloud_music_flutter/const/http_config.dart';
import 'package:netease_cloud_music_flutter/http/dio_client.dart';
import 'package:retrofit/http.dart';

import '../../page/mine/model/person_info.dart';

part 'api_ser.g.dart';

//Retrofit通过注解方式定义API接口，并支持同步和异步请求。它还支持多种HTTP请求方法（如GET、POST、PUT、DELETE等）和请求参数的自动处理。
@RestApi(baseUrl: HttpConfig.baseUrl)
abstract class ApiSer {
  //Dart 强大的空安全（操作符 ? 和 ! ，关键字 late）
  //？（类型后面跟操作符 ? 表示当前变量可为null。）
  //! ：放在变量后面，表示此变量值不为null，如果为null则会抛出异常。
  //初始化 late,假设有一个属性，此属性的值来源于服务器或者其他方法，那么此时无法给此属性进行初始化
  factory ApiSer({Dio? dio, String? baseUrl}) {
    dio = DioClient().dio;
    return _ApiSer(dio, baseUrl: baseUrl);
  }

  @GET("/login/cellphone")
  Future<PersonInfo> getPersonInfo(
      @Query("phone") String phone, @Query("password") String password);
}
