// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_song_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendSongList _$RecommendSongListFromJson(Map<String, dynamic> json) =>
    RecommendSongList(
      code: json['code'] as int?,
      featureFirst: json['featureFirst'] as bool?,
      haveRcmdSongs: json['haveRcmdSongs'] as bool?,
      recommend: (json['recommend'] as List<dynamic>?)
          ?.map((e) => Recommend.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecommendSongListToJson(RecommendSongList instance) =>
    <String, dynamic>{
      'code': instance.code,
      'featureFirst': instance.featureFirst,
      'haveRcmdSongs': instance.haveRcmdSongs,
      'recommend': instance.recommend,
    };
