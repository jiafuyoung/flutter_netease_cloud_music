import 'package:dio/dio.dart';
import 'package:netease_cloud_music_flutter/const/config/http_config.dart';
import 'package:netease_cloud_music_flutter/http/dio_client.dart';
import 'package:netease_cloud_music_flutter/page/mine/model/mine_song_list/mine_song_list.dart';
import 'package:netease_cloud_music_flutter/page/mine/model/user_detail/user_detail.dart';
import 'package:retrofit/http.dart';

part 'api_mine.g.dart';

@RestApi()
abstract class ApiMine {
  //Dart 强大的空安全（操作符 ? 和 ! ，关键字 late）
  //？（类型后面跟操作符 ? 表示当前变量可为null。）
  //"!" ：放在变量后面，表示此变量值不为null，如果为null则会抛出异常。
  //初始化 late,假设有一个属性，此属性的值来源于服务器或者其他方法，那么此时无法给此属性进行初始化
  factory ApiMine({Dio? dio, String? baseUrl}) {
    dio = DioClient().dio;

    return _ApiMine(dio, baseUrl: HttpConfig.baseUrl);
  }

  @GET("/user/detail")
  Future<UserDetail> getUserDetail(@Query("uid") int uid);

  @GET("/user/playlist")
  Future<MineSongList> getUserMineSongList(@Query("uid") int uid);
}
