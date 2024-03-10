import 'package:dio/dio.dart';
import 'package:netease_cloud_music_flutter/const/config/http_config.dart';
import 'package:netease_cloud_music_flutter/http/dio_client.dart';
import 'package:netease_cloud_music_flutter/page/secondary_page/song/model/common_data/common_data.dart';
import 'package:netease_cloud_music_flutter/page/secondary_page/song/model/lyric_data_by_net/lyric_data_by_net.dart';

import 'package:netease_cloud_music_flutter/page/secondary_page/song/model/song_url/song_url.dart';
import 'package:netease_cloud_music_flutter/page/secondary_page/song/model/user_play_list/user_play_list.dart';
import 'package:netease_cloud_music_flutter/page/secondary_page/song_list/model/song_list_detail/song_list_detail.dart';
import 'package:retrofit/http.dart';

part 'api_song.g.dart';

@RestApi()
abstract class ApiSong {
  //Dart 强大的空安全（操作符 ? 和 ! ，关键字 late）
  //？（类型后面跟操作符 ? 表示当前变量可为null。）
  //"!" ：放在变量后面，表示此变量值不为null，如果为null则会抛出异常。
  //初始化 late,假设有一个属性，此属性的值来源于服务器或者其他方法，那么此时无法给此属性进行初始化
  factory ApiSong({Dio? dio, String? baseUrl}) {
    dio = DioClient().dio;

    return _ApiSong(dio, baseUrl: HttpConfig.baseUrl);
  }

  @GET("/song/url")
  Future<SongUrl> getSongUrl(@Query("id") int id);

  @GET("/lyric")
  Future<LyricDataByNet> getLyricByApi(@Query("id") int id);

  @GET("/user/playlist")
  Future<UserPlayList> getUserPlayList(@Query("uid") int uid);

  @GET("/playlist/detail")
  Future<SongListDetail> getUserPlayListById(@Query("id") int id);

  @POST("/comment/music")
  Future<CommonData> getSongCommonData(@Body() Map<String, dynamic> params);
  // @GET("/comment/music?id=186016&limit=1")
  // Future<CommonData> getSongCommonData();
}
