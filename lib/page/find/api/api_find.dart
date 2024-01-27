import 'package:dio/dio.dart';
import 'package:netease_cloud_music_flutter/const/config/http_config.dart';
import 'package:netease_cloud_music_flutter/http/dio_client.dart';
import 'package:retrofit/http.dart';

import '../recommend_song_list/recommend_song_list.dart';

part 'api_find.g.dart';

//生成.g.dart文件
//flutter pub run build_runner build --delete-conflicting-outputs

@RestApi()
abstract class ApiFind {
  factory ApiFind({Dio? dio, String? baseUrl}) {
    dio = DioClient().dio;

    return _ApiFind(dio, baseUrl: HttpConfig.baseUrl);
  }

  @GET("/recommend/resource")
  Future<RecommendSongList> getRecommendSongList();
}
