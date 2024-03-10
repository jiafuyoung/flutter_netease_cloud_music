// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Track _$TrackFromJson(Map<String, dynamic> json) => Track(
      name: json['name'] as String?,
      id: json['id'] as int?,
      ar: (json['ar'] as List<dynamic>?)
          ?.map((e) => Ar.fromJson(e as Map<String, dynamic>))
          .toList(),
      alia: json['alia'] as List<dynamic>?,
      pop: json['pop'] as int?,
      al: json['al'] == null
          ? null
          : Al.fromJson(json['al'] as Map<String, dynamic>),
      cd: json['cd'] as String?,
      no: json['no'] as int?,
      ftype: json['ftype'] as int?,
      djId: json['djId'] as int?,
      copyright: json['copyright'] as int?,
      sId: json['s_id'] as int?,
      mark: json['mark'] as int?,
      originCoverType: json['originCoverType'] as int?,
      resourceState: json['resourceState'] as bool?,
      version: json['version'] as int?,
      single: json['single'] as int?,
      mv: json['mv'] as int?,
      mst: json['mst'] as int?,
      publishTime: json['publishTime'] as int?,
    );

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'ar': instance.ar,
      'alia': instance.alia,
      'pop': instance.pop,
      'al': instance.al,
      'cd': instance.cd,
      'no': instance.no,
      'ftype': instance.ftype,
      'djId': instance.djId,
      'copyright': instance.copyright,
      's_id': instance.sId,
      'mark': instance.mark,
      'originCoverType': instance.originCoverType,
      'resourceState': instance.resourceState,
      'version': instance.version,
      'single': instance.single,
      'mv': instance.mv,
      'mst': instance.mst,
      'publishTime': instance.publishTime,
    };
