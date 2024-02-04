import 'package:dio/dio.dart';
import 'package:netease_cloud_music_flutter/const/config/http_config.dart';
import 'package:netease_cloud_music_flutter/http/dio_client.dart';
import 'package:netease_cloud_music_flutter/page/find/model/banner_data/banner_data.dart';
import 'package:netease_cloud_music_flutter/page/find/model/rank_song_list/rank_song_list.dart';
import 'package:netease_cloud_music_flutter/page/find/model/top_list/top_list.dart';
import 'package:retrofit/http.dart';

import '../model/recommend_song_list/recommend_song_list.dart';

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

  @GET("/banner?type=2")
  Future<BannerData> getBanners();

  @GET("/toplist")
  Future<TopList> getToplist();

  @GET("/playlist/track/all")
  Future<RankSongList> getRankSongList(@Query("id") int id,
      @Query("limit") int limit, @Query("offset") int offset);
}
