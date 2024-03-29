// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Creator _$CreatorFromJson(Map<String, dynamic> json) => Creator(
      defaultAvatar: json['defaultAvatar'] as bool?,
      province: json['province'] as int?,
      authStatus: json['authStatus'] as int?,
      followed: json['followed'] as bool?,
      avatarUrl: json['avatarUrl'] as String?,
      accountStatus: json['accountStatus'] as int?,
      gender: json['gender'] as int?,
      city: json['city'] as int?,
      birthday: json['birthday'] as int?,
      userId: json['userId'] as int?,
      userType: json['userType'] as int?,
      nickname: json['nickname'] as String?,
      signature: json['signature'] as String?,
      description: json['description'] as String?,
      detailDescription: json['detailDescription'] as String?,
      avatarImgId: json['avatarImgId'] as int?,
      backgroundImgId: json['backgroundImgId'] as int?,
      backgroundUrl: json['backgroundUrl'] as String?,
      authority: json['authority'] as int?,
      mutual: json['mutual'] as bool?,
      expertTags: json['expertTags'],
      experts: json['experts'],
      djStatus: json['djStatus'] as int?,
      vipType: json['vipType'] as int?,
      remarkName: json['remarkName'],
      authenticationTypes: json['authenticationTypes'] as int?,
      avatarDetail: json['avatarDetail'],
      avatarImgIdStr: json['avatarImgIdStr'] as String?,
      backgroundImgIdStr: json['backgroundImgIdStr'] as String?,
      anchor: json['anchor'] as bool?,
    );

Map<String, dynamic> _$CreatorToJson(Creator instance) => <String, dynamic>{
      'defaultAvatar': instance.defaultAvatar,
      'province': instance.province,
      'authStatus': instance.authStatus,
      'followed': instance.followed,
      'avatarUrl': instance.avatarUrl,
      'accountStatus': instance.accountStatus,
      'gender': instance.gender,
      'city': instance.city,
      'birthday': instance.birthday,
      'userId': instance.userId,
      'userType': instance.userType,
      'nickname': instance.nickname,
      'signature': instance.signature,
      'description': instance.description,
      'detailDescription': instance.detailDescription,
      'avatarImgId': instance.avatarImgId,
      'backgroundImgId': instance.backgroundImgId,
      'backgroundUrl': instance.backgroundUrl,
      'authority': instance.authority,
      'mutual': instance.mutual,
      'expertTags': instance.expertTags,
      'experts': instance.experts,
      'djStatus': instance.djStatus,
      'vipType': instance.vipType,
      'remarkName': instance.remarkName,
      'authenticationTypes': instance.authenticationTypes,
      'avatarDetail': instance.avatarDetail,
      'avatarImgIdStr': instance.avatarImgIdStr,
      'backgroundImgIdStr': instance.backgroundImgIdStr,
      'anchor': instance.anchor,
    };
