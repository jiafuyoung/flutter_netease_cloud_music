// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonData _$CommonDataFromJson(Map<String, dynamic> json) => CommonData(
      isMusician: json['isMusician'] as bool?,
      cnum: json['cnum'] as int?,
      userId: json['userId'] as int?,
      topComments: json['topComments'] as List<dynamic>?,
      moreHot: json['moreHot'] as bool?,
      hotComments: (json['hotComments'] as List<dynamic>?)
          ?.map((e) => HotComment.fromJson(e as Map<String, dynamic>))
          .toList(),
      commentBanner: json['commentBanner'],
      code: json['code'] as int?,
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
      more: json['more'] as bool?,
    );

Map<String, dynamic> _$CommonDataToJson(CommonData instance) =>
    <String, dynamic>{
      'isMusician': instance.isMusician,
      'cnum': instance.cnum,
      'userId': instance.userId,
      'topComments': instance.topComments,
      'moreHot': instance.moreHot,
      'hotComments': instance.hotComments,
      'commentBanner': instance.commentBanner,
      'code': instance.code,
      'comments': instance.comments,
      'total': instance.total,
      'more': instance.more,
    };
