import 'package:json_annotation/json_annotation.dart';

part 'person_info.g.dart';

//生成.g.dart文件
//flutter pub run build_runner build --delete-conflicting-outputs
@JsonSerializable(explicitToJson: true)
class PersonInfo {
  int? loginType;
  int? code;
  Account? account;
  String? token;
  Profile? profile;
  String cookie = "";

  PersonInfo(
      {this.loginType,
      this.code,
      this.account,
      this.token,
      this.profile,
      required this.cookie});

  PersonInfo.fromJson(Map<String, dynamic> json) {
    loginType = json['loginType'];
    code = json['code'];
    account =
        json['account'] != null ? new Account.fromJson(json['account']) : null;
    token = json['token'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;

    cookie = json['cookie'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loginType'] = this.loginType;
    data['code'] = this.code;
    if (this.account != null) {
      data['account'] = this.account!.toJson();
    }
    data['token'] = this.token;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    data['cookie'] = this.cookie;
    return data;
  }
}

@JsonSerializable()
class Account {
  int? id;
  String? userName;
  int? type;
  int? status;
  int? whitelistAuthority;
  int? createTime;
  String? salt;
  int? tokenVersion;
  int? ban;
  int? baoyueVersion;
  int? donateVersion;
  int? vipType;
  int? viptypeVersion;
  bool? anonimousUser;
  bool? uninitialized;

  Account(
      {this.id,
      this.userName,
      this.type,
      this.status,
      this.whitelistAuthority,
      this.createTime,
      this.salt,
      this.tokenVersion,
      this.ban,
      this.baoyueVersion,
      this.donateVersion,
      this.vipType,
      this.viptypeVersion,
      this.anonimousUser,
      this.uninitialized});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    type = json['type'];
    status = json['status'];
    whitelistAuthority = json['whitelistAuthority'];
    createTime = json['createTime'];
    salt = json['salt'];
    tokenVersion = json['tokenVersion'];
    ban = json['ban'];
    baoyueVersion = json['baoyueVersion'];
    donateVersion = json['donateVersion'];
    vipType = json['vipType'];
    viptypeVersion = json['viptypeVersion'];
    anonimousUser = json['anonimousUser'];
    uninitialized = json['uninitialized'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['type'] = this.type;
    data['status'] = this.status;
    data['whitelistAuthority'] = this.whitelistAuthority;
    data['createTime'] = this.createTime;
    data['salt'] = this.salt;
    data['tokenVersion'] = this.tokenVersion;
    data['ban'] = this.ban;
    data['baoyueVersion'] = this.baoyueVersion;
    data['donateVersion'] = this.donateVersion;
    data['vipType'] = this.vipType;
    data['viptypeVersion'] = this.viptypeVersion;
    data['anonimousUser'] = this.anonimousUser;
    data['uninitialized'] = this.uninitialized;
    return data;
  }
}

@JsonSerializable()
class Profile {
  bool? defaultAvatar;
  bool? mutual;
  String? avatarImgIdStr;
  int? vipType;
  int? authStatus;
  int? djStatus;
  String? detailDescription;
  int? accountStatus;
  String? nickname;
  int? birthday;
  int? gender;
  int? province;
  int? city;
  int? avatarImgId;
  int? backgroundImgId;
  String? avatarUrl;
  bool? followed;
  String? backgroundUrl;
  int? userType;
  String? backgroundImgIdStr;
  String? description;
  int? userId;
  String? signature;
  int? authority;
  int? followeds;
  int? follows;
  int? eventCount;
  int? playlistCount;
  int? playlistBeSubscribedCount;

  Profile(
      {this.defaultAvatar,
      this.mutual,
      // this.remarkName,
      this.avatarImgIdStr,
      this.vipType,
      this.authStatus,
      this.djStatus,
      this.detailDescription,
      this.accountStatus,
      this.nickname,
      this.birthday,
      this.gender,
      this.province,
      this.city,
      this.avatarImgId,
      this.backgroundImgId,
      this.avatarUrl,
      this.followed,
      this.backgroundUrl,
      this.userType,
      this.backgroundImgIdStr,
      this.description,
      this.userId,
      this.signature,
      this.authority,
      this.followeds,
      this.follows,
      this.eventCount,
      this.playlistCount,
      this.playlistBeSubscribedCount});

  Profile.fromJson(Map<String, dynamic> json) {
    defaultAvatar = json['defaultAvatar'];
    mutual = json['mutual'];
    avatarImgIdStr = json['avatarImgIdStr'];
    vipType = json['vipType'];
    authStatus = json['authStatus'];
    djStatus = json['djStatus'];
    detailDescription = json['detailDescription'];
    accountStatus = json['accountStatus'];
    nickname = json['nickname'];
    birthday = json['birthday'];
    gender = json['gender'];
    province = json['province'];
    city = json['city'];
    avatarImgId = json['avatarImgId'];
    backgroundImgId = json['backgroundImgId'];
    avatarUrl = json['avatarUrl'];
    followed = json['followed'];
    backgroundUrl = json['backgroundUrl'];
    userType = json['userType'];
    backgroundImgIdStr = json['backgroundImgIdStr'];
    description = json['description'];
    userId = json['userId'];
    signature = json['signature'];
    authority = json['authority'];
    followeds = json['followeds'];
    follows = json['follows'];
    eventCount = json['eventCount'];
    playlistCount = json['playlistCount'];
    playlistBeSubscribedCount = json['playlistBeSubscribedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['defaultAvatar'] = this.defaultAvatar;
    data['mutual'] = this.mutual;
    // data['remarkName'] = this.remarkName;
    data['avatarImgIdStr'] = this.avatarImgIdStr;
    data['vipType'] = this.vipType;
    data['authStatus'] = this.authStatus;
    data['djStatus'] = this.djStatus;
    data['detailDescription'] = this.detailDescription;

    data['accountStatus'] = this.accountStatus;
    data['nickname'] = this.nickname;
    data['birthday'] = this.birthday;
    data['gender'] = this.gender;
    data['province'] = this.province;
    data['city'] = this.city;
    data['avatarImgId'] = this.avatarImgId;
    data['backgroundImgId'] = this.backgroundImgId;
    data['avatarUrl'] = this.avatarUrl;
    data['followed'] = this.followed;
    data['backgroundUrl'] = this.backgroundUrl;
    data['userType'] = this.userType;
    data['backgroundImgIdStr'] = this.backgroundImgIdStr;
    data['description'] = this.description;
    data['userId'] = this.userId;
    data['signature'] = this.signature;
    data['authority'] = this.authority;
    data['followeds'] = this.followeds;
    data['follows'] = this.follows;
    data['eventCount'] = this.eventCount;
    data['playlistCount'] = this.playlistCount;
    data['playlistBeSubscribedCount'] = this.playlistBeSubscribedCount;
    return data;
  }
}
