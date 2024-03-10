// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_list_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongListDetail _$SongListDetailFromJson(Map<String, dynamic> json) =>
    SongListDetail(
      code: json['code'] as int?,
      relatedVideos: json['relatedVideos'],
      playlist: json['playlist'] == null
          ? null
          : Playlist.fromJson(json['playlist'] as Map<String, dynamic>),
      sharedPrivilege: json['sharedPrivilege'],
      resEntrance: json['resEntrance'],
      fromUsers: json['fromUsers'],
      fromUserCount: json['fromUserCount'] as int?,
      songFromUsers: json['songFromUsers'],
    );

Map<String, dynamic> _$SongListDetailToJson(SongListDetail instance) =>
    <String, dynamic>{
      'code': instance.code,
      'relatedVideos': instance.relatedVideos,
      'playlist': instance.playlist,
      'sharedPrivilege': instance.sharedPrivilege,
      'resEntrance': instance.resEntrance,
      'fromUsers': instance.fromUsers,
      'fromUserCount': instance.fromUserCount,
      'songFromUsers': instance.songFromUsers,
    };
