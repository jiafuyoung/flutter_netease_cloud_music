// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResult _$BaseResultFromJson(Map<String, dynamic> json) => BaseResult(
      statusCode: json['statusCode'] as int?,
      statusMessage: json['statusMessage'] as String?,
      data: json['data'] as Map<String, dynamic>?,
      extra: json['extra'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$BaseResultToJson(BaseResult instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
      'data': instance.data,
      'extra': instance.extra,
    };
