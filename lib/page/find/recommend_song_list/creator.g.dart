// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Creator _$CreatorFromJson(Map<String, dynamic> json) => Creator(
      mutual: json['mutual'] as bool?,
      remarkName: json['remarkName'],
      accountStatus: json['accountStatus'] as int?,
      vipType: json['vipType'] as int?,
      province: json['province'] as int?,
      avatarUrl: json['avatarUrl'] as String,
      authStatus: json['authStatus'] as int?,
      userType: json['userType'] as int?,
      nickname: json['nickname'] as String?,
      gender: json['gender'] as int?,
      birthday: json['birthday'] as int?,
      city: json['city'] as int?,
      backgroundUrl: json['backgroundUrl'] as String?,
      expertTags: json['expertTags'],
      djStatus: json['djStatus'] as int?,
      followed: json['followed'] as bool?,
      avatarImgId: json['avatarImgId'] as int?,
      backgroundImgId: json['backgroundImgId'] as int?,
      detailDescription: json['detailDescription'] as String?,
      defaultAvatar: json['defaultAvatar'] as bool?,
      backgroundImgIdStr: json['backgroundImgIdStr'] as String?,
      avatarImgIdStr: json['avatarImgIdStr'] as String?,
      description: json['description'] as String?,
      userId: json['userId'] as int?,
      signature: json['signature'] as String?,
      authority: json['authority'] as int?,
    );

Map<String, dynamic> _$CreatorToJson(Creator instance) => <String, dynamic>{
      'mutual': instance.mutual,
      'remarkName': instance.remarkName,
      'accountStatus': instance.accountStatus,
      'vipType': instance.vipType,
      'province': instance.province,
      'avatarUrl': instance.avatarUrl,
      'authStatus': instance.authStatus,
      'userType': instance.userType,
      'nickname': instance.nickname,
      'gender': instance.gender,
      'birthday': instance.birthday,
      'city': instance.city,
      'backgroundUrl': instance.backgroundUrl,
      'expertTags': instance.expertTags,
      'djStatus': instance.djStatus,
      'followed': instance.followed,
      'avatarImgId': instance.avatarImgId,
      'backgroundImgId': instance.backgroundImgId,
      'detailDescription': instance.detailDescription,
      'defaultAvatar': instance.defaultAvatar,
      'backgroundImgIdStr': instance.backgroundImgIdStr,
      'avatarImgIdStr': instance.avatarImgIdStr,
      'description': instance.description,
      'userId': instance.userId,
      'signature': instance.signature,
      'authority': instance.authority,
    };
