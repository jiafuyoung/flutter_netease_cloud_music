// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as int?,
      url: json['url'] as String,
      br: json['br'] as int?,
      size: json['size'] as int?,
      md5: json['md5'] as String?,
      code: json['code'] as int?,
      expi: json['expi'] as int?,
      type: json['type'] as String?,
      gain: (json['gain'] as num?)?.toDouble(),
      peak: (json['peak'] as num?)?.toDouble(),
      fee: json['fee'] as int?,
      uf: json['uf'],
      payed: json['payed'] as int?,
      flag: json['flag'] as int?,
      canExtend: json['canExtend'] as bool?,
      freeTrialInfo: json['freeTrialInfo'],
      level: json['level'] as String?,
      encodeType: json['encodeType'] as String?,
      channelLayout: json['channelLayout'],
      freeTrialPrivilege: json['freeTrialPrivilege'] == null
          ? null
          : FreeTrialPrivilege.fromJson(
              json['freeTrialPrivilege'] as Map<String, dynamic>),
      freeTimeTrialPrivilege: json['freeTimeTrialPrivilege'] == null
          ? null
          : FreeTimeTrialPrivilege.fromJson(
              json['freeTimeTrialPrivilege'] as Map<String, dynamic>),
      urlSource: json['urlSource'] as int?,
      rightSource: json['rightSource'] as int?,
      podcastCtrp: json['podcastCtrp'],
      effectTypes: json['effectTypes'],
      time: json['time'] as int?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'br': instance.br,
      'size': instance.size,
      'md5': instance.md5,
      'code': instance.code,
      'expi': instance.expi,
      'type': instance.type,
      'gain': instance.gain,
      'peak': instance.peak,
      'fee': instance.fee,
      'uf': instance.uf,
      'payed': instance.payed,
      'flag': instance.flag,
      'canExtend': instance.canExtend,
      'freeTrialInfo': instance.freeTrialInfo,
      'level': instance.level,
      'encodeType': instance.encodeType,
      'channelLayout': instance.channelLayout,
      'freeTrialPrivilege': instance.freeTrialPrivilege,
      'freeTimeTrialPrivilege': instance.freeTimeTrialPrivilege,
      'urlSource': instance.urlSource,
      'rightSource': instance.rightSource,
      'podcastCtrp': instance.podcastCtrp,
      'effectTypes': instance.effectTypes,
      'time': instance.time,
    };
