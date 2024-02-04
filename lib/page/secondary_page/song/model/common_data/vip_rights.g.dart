// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vip_rights.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VipRights _$VipRightsFromJson(Map<String, dynamic> json) => VipRights(
      associator: json['associator'] == null
          ? null
          : Associator.fromJson(json['associator'] as Map<String, dynamic>),
      musicPackage: json['musicPackage'] == null
          ? null
          : MusicPackage.fromJson(json['musicPackage'] as Map<String, dynamic>),
      redplus: json['redplus'],
      redVipAnnualCount: json['redVipAnnualCount'] as int?,
      redVipLevel: json['redVipLevel'] as int?,
      relationType: json['relationType'] as int?,
    );

Map<String, dynamic> _$VipRightsToJson(VipRights instance) => <String, dynamic>{
      'associator': instance.associator,
      'musicPackage': instance.musicPackage,
      'redplus': instance.redplus,
      'redVipAnnualCount': instance.redVipAnnualCount,
      'redVipLevel': instance.redVipLevel,
      'relationType': instance.relationType,
    };
