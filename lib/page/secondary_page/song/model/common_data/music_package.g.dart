// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicPackage _$MusicPackageFromJson(Map<String, dynamic> json) => MusicPackage(
      vipCode: json['vipCode'] as int?,
      rights: json['rights'] as bool?,
      iconUrl: json['iconUrl'] as String?,
    );

Map<String, dynamic> _$MusicPackageToJson(MusicPackage instance) =>
    <String, dynamic>{
      'vipCode': instance.vipCode,
      'rights': instance.rights,
      'iconUrl': instance.iconUrl,
    };
