// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mine_song_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MineSongList _$MineSongListFromJson(Map<String, dynamic> json) => MineSongList(
      version: json['version'] as String?,
      more: json['more'] as bool?,
      playlist: (json['playlist'] as List<dynamic>?)
          ?.map((e) => Playlist.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['code'] as int?,
    );

Map<String, dynamic> _$MineSongListToJson(MineSongList instance) =>
    <String, dynamic>{
      'version': instance.version,
      'more': instance.more,
      'playlist': instance.playlist,
      'code': instance.code,
    };
