import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'vip_rights.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  dynamic locationInfo;
  dynamic liveInfo;
  int? anonym;
  dynamic commonIdentity;
  dynamic avatarDetail;
  int? userType;
  String? avatarUrl;
  bool? followed;
  bool? mutual;
  dynamic remarkName;
  dynamic socialUserId;
  VipRights? vipRights;
  String? nickname;
  int? authStatus;
  dynamic expertTags;
  dynamic experts;
  int? vipType;
  int? userId;
  dynamic target;

  User({
    this.locationInfo,
    this.liveInfo,
    this.anonym,
    this.commonIdentity,
    this.avatarDetail,
    this.userType,
    this.avatarUrl,
    this.followed,
    this.mutual,
    this.remarkName,
    this.socialUserId,
    this.vipRights,
    this.nickname,
    this.authStatus,
    this.expertTags,
    this.experts,
    this.vipType,
    this.userId,
    this.target,
  });

  @override
  String toString() {
    return 'User(locationInfo: $locationInfo, liveInfo: $liveInfo, anonym: $anonym, commonIdentity: $commonIdentity, avatarDetail: $avatarDetail, userType: $userType, avatarUrl: $avatarUrl, followed: $followed, mutual: $mutual, remarkName: $remarkName, socialUserId: $socialUserId, vipRights: $vipRights, nickname: $nickname, authStatus: $authStatus, expertTags: $expertTags, experts: $experts, vipType: $vipType, userId: $userId, target: $target)';
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    dynamic locationInfo,
    dynamic liveInfo,
    int? anonym,
    dynamic commonIdentity,
    dynamic avatarDetail,
    int? userType,
    String? avatarUrl,
    bool? followed,
    bool? mutual,
    dynamic remarkName,
    dynamic socialUserId,
    VipRights? vipRights,
    String? nickname,
    int? authStatus,
    dynamic expertTags,
    dynamic experts,
    int? vipType,
    int? userId,
    dynamic target,
  }) {
    return User(
      locationInfo: locationInfo ?? this.locationInfo,
      liveInfo: liveInfo ?? this.liveInfo,
      anonym: anonym ?? this.anonym,
      commonIdentity: commonIdentity ?? this.commonIdentity,
      avatarDetail: avatarDetail ?? this.avatarDetail,
      userType: userType ?? this.userType,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      followed: followed ?? this.followed,
      mutual: mutual ?? this.mutual,
      remarkName: remarkName ?? this.remarkName,
      socialUserId: socialUserId ?? this.socialUserId,
      vipRights: vipRights ?? this.vipRights,
      nickname: nickname ?? this.nickname,
      authStatus: authStatus ?? this.authStatus,
      expertTags: expertTags ?? this.expertTags,
      experts: experts ?? this.experts,
      vipType: vipType ?? this.vipType,
      userId: userId ?? this.userId,
      target: target ?? this.target,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! User) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      locationInfo.hashCode ^
      liveInfo.hashCode ^
      anonym.hashCode ^
      commonIdentity.hashCode ^
      avatarDetail.hashCode ^
      userType.hashCode ^
      avatarUrl.hashCode ^
      followed.hashCode ^
      mutual.hashCode ^
      remarkName.hashCode ^
      socialUserId.hashCode ^
      vipRights.hashCode ^
      nickname.hashCode ^
      authStatus.hashCode ^
      expertTags.hashCode ^
      experts.hashCode ^
      vipType.hashCode ^
      userId.hashCode ^
      target.hashCode;
}
