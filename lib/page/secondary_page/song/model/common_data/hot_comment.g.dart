// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotComment _$HotCommentFromJson(Map<String, dynamic> json) => HotComment(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      beReplied: json['beReplied'] as List<dynamic>?,
      pendantData: json['pendantData'],
      showFloorComment: json['showFloorComment'],
      status: json['status'] as int?,
      commentId: json['commentId'] as int?,
      content: json['content'] as String?,
      richContent: json['richContent'],
      contentResource: json['contentResource'],
      time: json['time'] as int?,
      timeStr: json['timeStr'] as String?,
      needDisplayTime: json['needDisplayTime'] as bool?,
      likedCount: json['likedCount'] as int?,
      expressionUrl: json['expressionUrl'],
      commentLocationType: json['commentLocationType'] as int?,
      parentCommentId: json['parentCommentId'] as int?,
      decoration: json['decoration'],
      repliedMark: json['repliedMark'],
      grade: json['grade'],
      userBizLevels: json['userBizLevels'],
      ipLocation: json['ipLocation'] == null
          ? null
          : IpLocation.fromJson(json['ipLocation'] as Map<String, dynamic>),
      owner: json['owner'] as bool?,
      liked: json['liked'] as bool?,
    );

Map<String, dynamic> _$HotCommentToJson(HotComment instance) =>
    <String, dynamic>{
      'user': instance.user,
      'beReplied': instance.beReplied,
      'pendantData': instance.pendantData,
      'showFloorComment': instance.showFloorComment,
      'status': instance.status,
      'commentId': instance.commentId,
      'content': instance.content,
      'richContent': instance.richContent,
      'contentResource': instance.contentResource,
      'time': instance.time,
      'timeStr': instance.timeStr,
      'needDisplayTime': instance.needDisplayTime,
      'likedCount': instance.likedCount,
      'expressionUrl': instance.expressionUrl,
      'commentLocationType': instance.commentLocationType,
      'parentCommentId': instance.parentCommentId,
      'decoration': instance.decoration,
      'repliedMark': instance.repliedMark,
      'grade': instance.grade,
      'userBizLevels': instance.userBizLevels,
      'ipLocation': instance.ipLocation,
      'owner': instance.owner,
      'liked': instance.liked,
    };
