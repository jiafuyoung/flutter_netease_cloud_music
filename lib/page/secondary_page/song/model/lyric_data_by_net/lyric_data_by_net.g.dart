// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyric_data_by_net.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LyricDataByNet _$LyricDataByNetFromJson(Map<String, dynamic> json) =>
    LyricDataByNet(
      sgc: json['sgc'] as bool?,
      sfy: json['sfy'] as bool?,
      qfy: json['qfy'] as bool?,
      lrc: json['lrc'] == null
          ? null
          : Lrc.fromJson(json['lrc'] as Map<String, dynamic>),
      klyric: json['klyric'] == null
          ? null
          : Klyric.fromJson(json['klyric'] as Map<String, dynamic>),
      tlyric: json['tlyric'] == null
          ? null
          : Tlyric.fromJson(json['tlyric'] as Map<String, dynamic>),
      romalrc: json['romalrc'] == null
          ? null
          : Romalrc.fromJson(json['romalrc'] as Map<String, dynamic>),
      code: json['code'] as int?,
    );

Map<String, dynamic> _$LyricDataByNetToJson(LyricDataByNet instance) =>
    <String, dynamic>{
      'sgc': instance.sgc,
      'sfy': instance.sfy,
      'qfy': instance.qfy,
      'lrc': instance.lrc,
      'klyric': instance.klyric,
      'tlyric': instance.tlyric,
      'romalrc': instance.romalrc,
      'code': instance.code,
    };
