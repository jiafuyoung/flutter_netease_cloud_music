// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_info_login_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonInfoLoginStatus _$PersonInfoLoginStatusFromJson(
        Map<String, dynamic> json) =>
    PersonInfoLoginStatus(
      code: json['code'] as int?,
      account: json['account'] == null
          ? null
          : Account.fromJson(json['account'] as Map<String, dynamic>),
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonInfoLoginStatusToJson(
        PersonInfoLoginStatus instance) =>
    <String, dynamic>{
      'code': instance.code,
      'account': instance.account?.toJson(),
      'profile': instance.profile?.toJson(),
    };

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      id: json['id'] as int?,
      userName: json['userName'] as String?,
      type: json['type'] as int?,
      status: json['status'] as int?,
      whitelistAuthority: json['whitelistAuthority'] as int?,
      createTime: json['createTime'] as int?,
      tokenVersion: json['tokenVersion'] as int?,
      ban: json['ban'] as int?,
      baoyueVersion: json['baoyueVersion'] as int?,
      donateVersion: json['donateVersion'] as int?,
      vipType: json['vipType'] as int?,
      anonimousUser: json['anonimousUser'] as bool?,
      paidFee: json['paidFee'] as bool?,
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'type': instance.type,
      'status': instance.status,
      'whitelistAuthority': instance.whitelistAuthority,
      'createTime': instance.createTime,
      'tokenVersion': instance.tokenVersion,
      'ban': instance.ban,
      'baoyueVersion': instance.baoyueVersion,
      'donateVersion': instance.donateVersion,
      'vipType': instance.vipType,
      'anonimousUser': instance.anonimousUser,
      'paidFee': instance.paidFee,
    };

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      userId: json['userId'] as int?,
      userType: json['userType'] as int?,
      nickname: json['nickname'] as String,
      avatarImgId: json['avatarImgId'] as int?,
      avatarUrl: json['avatarUrl'] as String,
      backgroundImgId: json['backgroundImgId'] as int?,
      backgroundUrl: json['backgroundUrl'] as String?,
      signature: json['signature'] as String?,
      createTime: json['createTime'] as int?,
      userName: json['userName'] as String?,
      accountType: json['accountType'] as int?,
      shortUserName: json['shortUserName'] as String?,
      birthday: json['birthday'] as int?,
      authority: json['authority'] as int?,
      gender: json['gender'] as int?,
      accountStatus: json['accountStatus'] as int?,
      province: json['province'] as int?,
      city: json['city'] as int?,
      authStatus: json['authStatus'] as int?,
      description: json['description'] as String?,
      detailDescription: json['detailDescription'] as String?,
      defaultAvatar: json['defaultAvatar'] as bool?,
      expertTags: json['expertTags'] as String?,
      experts: json['experts'] as String?,
      djStatus: json['djStatus'] as int?,
      locationStatus: json['locationStatus'] as int?,
      vipType: json['vipType'] as int?,
      followed: json['followed'] as bool?,
      mutual: json['mutual'] as bool?,
      authenticated: json['authenticated'] as bool?,
      lastLoginTime: json['lastLoginTime'] as int?,
      lastLoginIP: json['lastLoginIP'] as String?,
      remarkName: json['remarkName'] as String?,
      viptypeVersion: json['viptypeVersion'] as int?,
      authenticationTypes: json['authenticationTypes'] as int?,
      avatarDetail: json['avatarDetail'] as String?,
      anchor: json['anchor'] as bool?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'userId': instance.userId,
      'userType': instance.userType,
      'nickname': instance.nickname,
      'avatarImgId': instance.avatarImgId,
      'avatarUrl': instance.avatarUrl,
      'backgroundImgId': instance.backgroundImgId,
      'backgroundUrl': instance.backgroundUrl,
      'signature': instance.signature,
      'createTime': instance.createTime,
      'userName': instance.userName,
      'accountType': instance.accountType,
      'shortUserName': instance.shortUserName,
      'birthday': instance.birthday,
      'authority': instance.authority,
      'gender': instance.gender,
      'accountStatus': instance.accountStatus,
      'province': instance.province,
      'city': instance.city,
      'authStatus': instance.authStatus,
      'description': instance.description,
      'detailDescription': instance.detailDescription,
      'defaultAvatar': instance.defaultAvatar,
      'expertTags': instance.expertTags,
      'experts': instance.experts,
      'djStatus': instance.djStatus,
      'locationStatus': instance.locationStatus,
      'vipType': instance.vipType,
      'followed': instance.followed,
      'mutual': instance.mutual,
      'authenticated': instance.authenticated,
      'lastLoginTime': instance.lastLoginTime,
      'lastLoginIP': instance.lastLoginIP,
      'remarkName': instance.remarkName,
      'viptypeVersion': instance.viptypeVersion,
      'authenticationTypes': instance.authenticationTypes,
      'avatarDetail': instance.avatarDetail,
      'anchor': instance.anchor,
    };
