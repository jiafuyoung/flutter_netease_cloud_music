// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonInfo _$PersonInfoFromJson(Map<String, dynamic> json) => PersonInfo(
      loginType: json['loginType'] as int?,
      code: json['code'] as int?,
      account: json['account'] == null
          ? null
          : Account.fromJson(json['account'] as Map<String, dynamic>),
      token: json['token'] as String?,
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
      cookie: json['cookie'] as String?,
    );

Map<String, dynamic> _$PersonInfoToJson(PersonInfo instance) =>
    <String, dynamic>{
      'loginType': instance.loginType,
      'code': instance.code,
      'account': instance.account?.toJson(),
      'token': instance.token,
      'profile': instance.profile?.toJson(),
      'cookie': instance.cookie,
    };

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      id: json['id'] as int?,
      userName: json['userName'] as String?,
      type: json['type'] as int?,
      status: json['status'] as int?,
      whitelistAuthority: json['whitelistAuthority'] as int?,
      createTime: json['createTime'] as int?,
      salt: json['salt'] as String?,
      tokenVersion: json['tokenVersion'] as int?,
      ban: json['ban'] as int?,
      baoyueVersion: json['baoyueVersion'] as int?,
      donateVersion: json['donateVersion'] as int?,
      vipType: json['vipType'] as int?,
      viptypeVersion: json['viptypeVersion'] as int?,
      anonimousUser: json['anonimousUser'] as bool?,
      uninitialized: json['uninitialized'] as bool?,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'type': instance.type,
      'status': instance.status,
      'whitelistAuthority': instance.whitelistAuthority,
      'createTime': instance.createTime,
      'salt': instance.salt,
      'tokenVersion': instance.tokenVersion,
      'ban': instance.ban,
      'baoyueVersion': instance.baoyueVersion,
      'donateVersion': instance.donateVersion,
      'vipType': instance.vipType,
      'viptypeVersion': instance.viptypeVersion,
      'anonimousUser': instance.anonimousUser,
      'uninitialized': instance.uninitialized,
    };

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      defaultAvatar: json['defaultAvatar'] as bool?,
      mutual: json['mutual'] as bool?,
      avatarImgIdStr: json['avatarImgIdStr'] as String?,
      vipType: json['vipType'] as int?,
      authStatus: json['authStatus'] as int?,
      djStatus: json['djStatus'] as int?,
      detailDescription: json['detailDescription'] as String?,
      accountStatus: json['accountStatus'] as int?,
      nickname: json['nickname'] as String?,
      birthday: json['birthday'] as int?,
      gender: json['gender'] as int?,
      province: json['province'] as int?,
      city: json['city'] as int?,
      avatarImgId: json['avatarImgId'] as int?,
      backgroundImgId: json['backgroundImgId'] as int?,
      avatarUrl: json['avatarUrl'] as String?,
      followed: json['followed'] as bool?,
      backgroundUrl: json['backgroundUrl'] as String?,
      userType: json['userType'] as int?,
      backgroundImgIdStr: json['backgroundImgIdStr'] as String?,
      description: json['description'] as String?,
      userId: json['userId'] as int?,
      signature: json['signature'] as String?,
      authority: json['authority'] as int?,
      followeds: json['followeds'] as int?,
      follows: json['follows'] as int?,
      eventCount: json['eventCount'] as int?,
      playlistCount: json['playlistCount'] as int?,
      playlistBeSubscribedCount: json['playlistBeSubscribedCount'] as int?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'defaultAvatar': instance.defaultAvatar,
      'mutual': instance.mutual,
      'avatarImgIdStr': instance.avatarImgIdStr,
      'vipType': instance.vipType,
      'authStatus': instance.authStatus,
      'djStatus': instance.djStatus,
      'detailDescription': instance.detailDescription,
      'accountStatus': instance.accountStatus,
      'nickname': instance.nickname,
      'birthday': instance.birthday,
      'gender': instance.gender,
      'province': instance.province,
      'city': instance.city,
      'avatarImgId': instance.avatarImgId,
      'backgroundImgId': instance.backgroundImgId,
      'avatarUrl': instance.avatarUrl,
      'followed': instance.followed,
      'backgroundUrl': instance.backgroundUrl,
      'userType': instance.userType,
      'backgroundImgIdStr': instance.backgroundImgIdStr,
      'description': instance.description,
      'userId': instance.userId,
      'signature': instance.signature,
      'authority': instance.authority,
      'followeds': instance.followeds,
      'follows': instance.follows,
      'eventCount': instance.eventCount,
      'playlistCount': instance.playlistCount,
      'playlistBeSubscribedCount': instance.playlistBeSubscribedCount,
    };
