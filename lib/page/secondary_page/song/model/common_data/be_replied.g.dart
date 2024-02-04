// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'be_replied.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BeReplied _$BeRepliedFromJson(Map<String, dynamic> json) => BeReplied(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      beRepliedCommentId: json['beRepliedCommentId'] as int?,
      content: json['content'] as String?,
      richContent: json['richContent'],
      status: json['status'] as int?,
      expressionUrl: json['expressionUrl'],
      ipLocation: json['ipLocation'] == null
          ? null
          : IpLocation.fromJson(json['ipLocation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BeRepliedToJson(BeReplied instance) => <String, dynamic>{
      'user': instance.user,
      'beRepliedCommentId': instance.beRepliedCommentId,
      'content': instance.content,
      'richContent': instance.richContent,
      'status': instance.status,
      'expressionUrl': instance.expressionUrl,
      'ipLocation': instance.ipLocation,
    };
