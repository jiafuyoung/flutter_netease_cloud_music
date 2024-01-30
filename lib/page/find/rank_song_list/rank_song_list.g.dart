// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rank_song_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RankSongList _$RankSongListFromJson(Map<String, dynamic> json) => RankSongList(
      songs: (json['songs'] as List<dynamic>?)
          ?.map((e) => Song.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['code'] as int?,
    );

Map<String, dynamic> _$RankSongListToJson(RankSongList instance) =>
    <String, dynamic>{
      'songs': instance.songs,
      'code': instance.code,
    };
