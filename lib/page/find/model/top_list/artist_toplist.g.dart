// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_toplist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistToplist _$ArtistToplistFromJson(Map<String, dynamic> json) =>
    ArtistToplist(
      coverUrl: json['coverUrl'] as String?,
      name: json['name'] as String?,
      upateFrequency: json['upateFrequency'] as String?,
      position: json['position'] as int?,
      updateFrequency: json['updateFrequency'] as String?,
    );

Map<String, dynamic> _$ArtistToplistToJson(ArtistToplist instance) =>
    <String, dynamic>{
      'coverUrl': instance.coverUrl,
      'name': instance.name,
      'upateFrequency': instance.upateFrequency,
      'position': instance.position,
      'updateFrequency': instance.updateFrequency,
    };
