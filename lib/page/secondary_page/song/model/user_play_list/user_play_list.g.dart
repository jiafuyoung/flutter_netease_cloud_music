// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_play_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPlayList _$UserPlayListFromJson(Map<String, dynamic> json) => UserPlayList(
      version: json['version'] as String?,
      more: json['more'] as bool?,
      playlist: (json['playlist'] as List<dynamic>?)
          ?.map((e) => Playlist.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['code'] as int?,
    );

Map<String, dynamic> _$UserPlayListToJson(UserPlayList instance) =>
    <String, dynamic>{
      'version': instance.version,
      'more': instance.more,
      'playlist': instance.playlist,
      'code': instance.code,
    };
