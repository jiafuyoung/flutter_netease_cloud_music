// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'al.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Al _$AlFromJson(Map<String, dynamic> json) => Al(
      id: json['id'] as int?,
      name: json['name'] as String?,
      picUrl: json['picUrl'] as String?,
      tns: json['tns'] as List<dynamic>?,
      picStr: json['pic_str'] as String?,
      pic: json['pic'] as int?,
    );

Map<String, dynamic> _$AlToJson(Al instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picUrl': instance.picUrl,
      'tns': instance.tns,
      'pic_str': instance.picStr,
      'pic': instance.pic,
    };
