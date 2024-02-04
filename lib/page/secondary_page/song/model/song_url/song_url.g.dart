// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_url.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongUrl _$SongUrlFromJson(Map<String, dynamic> json) => SongUrl(
      code: json['code'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SongUrlToJson(SongUrl instance) => <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };
