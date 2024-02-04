// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recommend _$RecommendFromJson(Map<String, dynamic> json) => Recommend(
      id: json['id'] as int?,
      type: json['type'] as int?,
      name: json['name'] as String,
      copywriter: json['copywriter'] as String?,
      picUrl: json['picUrl'] as String?,
      playcount: json['playcount'] as int?,
      createTime: json['createTime'] as int?,
      creator: Creator.fromJson(json['creator'] as Map<String, dynamic>),
      trackCount: json['trackCount'] as int?,
      userId: json['userId'] as int?,
      alg: json['alg'] as String?,
    );

Map<String, dynamic> _$RecommendToJson(Recommend instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'copywriter': instance.copywriter,
      'picUrl': instance.picUrl,
      'playcount': instance.playcount,
      'createTime': instance.createTime,
      'creator': instance.creator,
      'trackCount': instance.trackCount,
      'userId': instance.userId,
      'alg': instance.alg,
    };
