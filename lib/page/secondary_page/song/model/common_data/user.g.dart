// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      locationInfo: json['locationInfo'],
      liveInfo: json['liveInfo'],
      anonym: json['anonym'] as int?,
      commonIdentity: json['commonIdentity'],
      avatarDetail: json['avatarDetail'],
      userType: json['userType'] as int?,
      avatarUrl: json['avatarUrl'] as String?,
      followed: json['followed'] as bool?,
      mutual: json['mutual'] as bool?,
      remarkName: json['remarkName'],
      socialUserId: json['socialUserId'],
      vipRights: json['vipRights'] == null
          ? null
          : VipRights.fromJson(json['vipRights'] as Map<String, dynamic>),
      nickname: json['nickname'] as String?,
      authStatus: json['authStatus'] as int?,
      expertTags: json['expertTags'],
      experts: json['experts'],
      vipType: json['vipType'] as int?,
      userId: json['userId'] as int?,
      target: json['target'],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'locationInfo': instance.locationInfo,
      'liveInfo': instance.liveInfo,
      'anonym': instance.anonym,
      'commonIdentity': instance.commonIdentity,
      'avatarDetail': instance.avatarDetail,
      'userType': instance.userType,
      'avatarUrl': instance.avatarUrl,
      'followed': instance.followed,
      'mutual': instance.mutual,
      'remarkName': instance.remarkName,
      'socialUserId': instance.socialUserId,
      'vipRights': instance.vipRights,
      'nickname': instance.nickname,
      'authStatus': instance.authStatus,
      'expertTags': instance.expertTags,
      'experts': instance.experts,
      'vipType': instance.vipType,
      'userId': instance.userId,
      'target': instance.target,
    };
