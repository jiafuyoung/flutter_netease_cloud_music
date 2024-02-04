// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Song _$SongFromJson(Map<String, dynamic> json) => Song(
      name: json['name'] as String?,
      id: json['id'] as int,
      ar: (json['ar'] as List<dynamic>?)
          ?.map((e) => Ar.fromJson(e as Map<String, dynamic>))
          .toList(),
      alia: json['alia'] as List<dynamic>?,
      pop: json['pop'] as int?,
      rt: json['rt'] as String?,
      al: json['al'] == null
          ? null
          : Al.fromJson(json['al'] as Map<String, dynamic>),
      copyright: json['copyright'] as int?,
      mark: json['mark'] as int?,
      originCoverType: json['originCoverType'] as int?,
      resourceState: json['resourceState'] as bool?,
      version: json['version'] as int?,
      single: json['single'] as int?,
      mv: json['mv'] as int?,
      rtype: json['rtype'] as int?,
      mst: json['mst'] as int?,
      cp: json['cp'] as int?,
      publishTime: json['publishTime'] as int?,
    );

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'ar': instance.ar,
      'alia': instance.alia,
      'pop': instance.pop,
      'rt': instance.rt,
      'al': instance.al,
      'copyright': instance.copyright,
      'mark': instance.mark,
      'originCoverType': instance.originCoverType,
      'resourceState': instance.resourceState,
      'version': instance.version,
      'single': instance.single,
      'mv': instance.mv,
      'rtype': instance.rtype,
      'mst': instance.mst,
      'cp': instance.cp,
      'publishTime': instance.publishTime,
    };
