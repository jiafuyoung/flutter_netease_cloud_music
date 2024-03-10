// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetail _$UserDetailFromJson(Map<String, dynamic> json) => UserDetail(
      level: json['level'] as int?,
      listenSongs: json['listenSongs'] as int?,
      userPoint: json['userPoint'] == null
          ? null
          : UserPoint.fromJson(json['userPoint'] as Map<String, dynamic>),
      mobileSign: json['mobileSign'] as bool?,
      pcSign: json['pcSign'] as bool?,
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
      peopleCanSeeMyPlayRecord: json['peopleCanSeeMyPlayRecord'] as bool?,
      bindings: (json['bindings'] as List<dynamic>?)
          ?.map((e) => Binding.fromJson(e as Map<String, dynamic>))
          .toList(),
      adValid: json['adValid'] as bool?,
      code: json['code'] as int?,
      newUser: json['newUser'] as bool?,
      recallUser: json['recallUser'] as bool?,
      createTime: json['createTime'] as int?,
      createDays: json['createDays'] as int?,
      profileVillageInfo: json['profileVillageInfo'] == null
          ? null
          : ProfileVillageInfo.fromJson(
              json['profileVillageInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDetailToJson(UserDetail instance) =>
    <String, dynamic>{
      'level': instance.level,
      'listenSongs': instance.listenSongs,
      'userPoint': instance.userPoint,
      'mobileSign': instance.mobileSign,
      'pcSign': instance.pcSign,
      'profile': instance.profile,
      'peopleCanSeeMyPlayRecord': instance.peopleCanSeeMyPlayRecord,
      'bindings': instance.bindings,
      'adValid': instance.adValid,
      'code': instance.code,
      'newUser': instance.newUser,
      'recallUser': instance.recallUser,
      'createTime': instance.createTime,
      'createDays': instance.createDays,
      'profileVillageInfo': instance.profileVillageInfo,
    };
