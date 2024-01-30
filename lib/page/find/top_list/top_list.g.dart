// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopList _$TopListFromJson(Map<String, dynamic> json) => TopList(
      code: json['code'] as int?,
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => FindTop.fromJson(e as Map<String, dynamic>))
          .toList(),
      artistToplist: json['artistToplist'] == null
          ? null
          : ArtistToplist.fromJson(
              json['artistToplist'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TopListToJson(TopList instance) => <String, dynamic>{
      'code': instance.code,
      'list': instance.list,
      'artistToplist': instance.artistToplist,
    };
