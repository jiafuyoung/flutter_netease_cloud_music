import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'privacy_item_unlimit.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  PrivacyItemUnlimit? privacyItemUnlimit;
  dynamic avatarDetail;
  String? avatarImgIdStr;
  String? backgroundImgIdStr;
  int? city;
  bool? mutual;
  bool? defaultAvatar;
  String? detailDescription;
  int? vipType;
  bool? followed;
  int? createTime;
  dynamic remarkName;
  int? authStatus;
  dynamic expertTags;
  int? avatarImgId;
  int? birthday;
  int? gender;
  String? nickname;
  String? avatarUrl;
  int? backgroundImgId;
  String? backgroundUrl;
  int? userType;
  int? accountStatus;
  int? province;
  int? djStatus;
  String? description;
  int? userId;
  String? signature;
  int? authority;
  int? followeds;
  int? follows;
  bool? blacklist;
  int? eventCount;
  int? allSubscribedCount;
  int? playlistBeSubscribedCount;
  dynamic followTime;
  bool? followMe;
  List<dynamic>? artistIdentity;
  int? cCount;
  bool? inBlacklist;
  @JsonKey(name: 'sDJPCount')
  int? sDjpCount;
  int? playlistCount;
  int? sCount;
  int? newFollows;

  Profile({
    this.privacyItemUnlimit,
    this.avatarDetail,
    this.avatarImgIdStr,
    this.backgroundImgIdStr,
    this.city,
    this.mutual,
    this.defaultAvatar,
    this.detailDescription,
    this.vipType,
    this.followed,
    this.createTime,
    this.remarkName,
    this.authStatus,
    this.expertTags,
    this.avatarImgId,
    this.birthday,
    this.gender,
    this.nickname,
    this.avatarUrl,
    this.backgroundImgId,
    this.backgroundUrl,
    this.userType,
    this.accountStatus,
    this.province,
    this.djStatus,
    this.description,
    this.userId,
    this.signature,
    this.authority,
    this.followeds,
    this.follows,
    this.blacklist,
    this.eventCount,
    this.allSubscribedCount,
    this.playlistBeSubscribedCount,
    this.followTime,
    this.followMe,
    this.artistIdentity,
    this.cCount,
    this.inBlacklist,
    this.sDjpCount,
    this.playlistCount,
    this.sCount,
    this.newFollows,
  });

  @override
  String toString() {
    return 'Profile(privacyItemUnlimit: $privacyItemUnlimit, avatarDetail: $avatarDetail, avatarImgIdStr: $avatarImgIdStr, backgroundImgIdStr: $backgroundImgIdStr, city: $city, mutual: $mutual, defaultAvatar: $defaultAvatar, detailDescription: $detailDescription, vipType: $vipType, followed: $followed, createTime: $createTime, remarkName: $remarkName, authStatus: $authStatus, expertTags: $expertTags, avatarImgId: $avatarImgId, birthday: $birthday, gender: $gender, nickname: $nickname, avatarUrl: $avatarUrl, backgroundImgId: $backgroundImgId, backgroundUrl: $backgroundUrl, userType: $userType, accountStatus: $accountStatus, province: $province, djStatus: $djStatus, description: $description, userId: $userId, signature: $signature, authority: $authority, followeds: $followeds, follows: $follows, blacklist: $blacklist, eventCount: $eventCount, allSubscribedCount: $allSubscribedCount, playlistBeSubscribedCount: $playlistBeSubscribedCount, followTime: $followTime, followMe: $followMe, artistIdentity: $artistIdentity, cCount: $cCount, inBlacklist: $inBlacklist, sDjpCount: $sDjpCount, playlistCount: $playlistCount, sCount: $sCount, newFollows: $newFollows)';
  }

  factory Profile.fromJson(Map<String, dynamic> json) {
    return _$ProfileFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  Profile copyWith({
    PrivacyItemUnlimit? privacyItemUnlimit,
    dynamic avatarDetail,
    String? avatarImgIdStr,
    String? backgroundImgIdStr,
    int? city,
    bool? mutual,
    bool? defaultAvatar,
    String? detailDescription,
    int? vipType,
    bool? followed,
    int? createTime,
    dynamic remarkName,
    int? authStatus,
    dynamic expertTags,
    int? avatarImgId,
    int? birthday,
    int? gender,
    String? nickname,
    String? avatarUrl,
    int? backgroundImgId,
    String? backgroundUrl,
    int? userType,
    int? accountStatus,
    int? province,
    int? djStatus,
    String? description,
    int? userId,
    String? signature,
    int? authority,
    int? followeds,
    int? follows,
    bool? blacklist,
    int? eventCount,
    int? allSubscribedCount,
    int? playlistBeSubscribedCount,
    dynamic followTime,
    bool? followMe,
    List<dynamic>? artistIdentity,
    int? cCount,
    bool? inBlacklist,
    int? sDjpCount,
    int? playlistCount,
    int? sCount,
    int? newFollows,
  }) {
    return Profile(
      privacyItemUnlimit: privacyItemUnlimit ?? this.privacyItemUnlimit,
      avatarDetail: avatarDetail ?? this.avatarDetail,
      avatarImgIdStr: avatarImgIdStr ?? this.avatarImgIdStr,
      backgroundImgIdStr: backgroundImgIdStr ?? this.backgroundImgIdStr,
      city: city ?? this.city,
      mutual: mutual ?? this.mutual,
      defaultAvatar: defaultAvatar ?? this.defaultAvatar,
      detailDescription: detailDescription ?? this.detailDescription,
      vipType: vipType ?? this.vipType,
      followed: followed ?? this.followed,
      createTime: createTime ?? this.createTime,
      remarkName: remarkName ?? this.remarkName,
      authStatus: authStatus ?? this.authStatus,
      expertTags: expertTags ?? this.expertTags,
      avatarImgId: avatarImgId ?? this.avatarImgId,
      birthday: birthday ?? this.birthday,
      gender: gender ?? this.gender,
      nickname: nickname ?? this.nickname,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      backgroundImgId: backgroundImgId ?? this.backgroundImgId,
      backgroundUrl: backgroundUrl ?? this.backgroundUrl,
      userType: userType ?? this.userType,
      accountStatus: accountStatus ?? this.accountStatus,
      province: province ?? this.province,
      djStatus: djStatus ?? this.djStatus,
      description: description ?? this.description,
      userId: userId ?? this.userId,
      signature: signature ?? this.signature,
      authority: authority ?? this.authority,
      followeds: followeds ?? this.followeds,
      follows: follows ?? this.follows,
      blacklist: blacklist ?? this.blacklist,
      eventCount: eventCount ?? this.eventCount,
      allSubscribedCount: allSubscribedCount ?? this.allSubscribedCount,
      playlistBeSubscribedCount:
          playlistBeSubscribedCount ?? this.playlistBeSubscribedCount,
      followTime: followTime ?? this.followTime,
      followMe: followMe ?? this.followMe,
      artistIdentity: artistIdentity ?? this.artistIdentity,
      cCount: cCount ?? this.cCount,
      inBlacklist: inBlacklist ?? this.inBlacklist,
      sDjpCount: sDjpCount ?? this.sDjpCount,
      playlistCount: playlistCount ?? this.playlistCount,
      sCount: sCount ?? this.sCount,
      newFollows: newFollows ?? this.newFollows,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Profile) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      privacyItemUnlimit.hashCode ^
      avatarDetail.hashCode ^
      avatarImgIdStr.hashCode ^
      backgroundImgIdStr.hashCode ^
      city.hashCode ^
      mutual.hashCode ^
      defaultAvatar.hashCode ^
      detailDescription.hashCode ^
      vipType.hashCode ^
      followed.hashCode ^
      createTime.hashCode ^
      remarkName.hashCode ^
      authStatus.hashCode ^
      expertTags.hashCode ^
      avatarImgId.hashCode ^
      birthday.hashCode ^
      gender.hashCode ^
      nickname.hashCode ^
      avatarUrl.hashCode ^
      backgroundImgId.hashCode ^
      backgroundUrl.hashCode ^
      userType.hashCode ^
      accountStatus.hashCode ^
      province.hashCode ^
      djStatus.hashCode ^
      description.hashCode ^
      userId.hashCode ^
      signature.hashCode ^
      authority.hashCode ^
      followeds.hashCode ^
      follows.hashCode ^
      blacklist.hashCode ^
      eventCount.hashCode ^
      allSubscribedCount.hashCode ^
      playlistBeSubscribedCount.hashCode ^
      followTime.hashCode ^
      followMe.hashCode ^
      artistIdentity.hashCode ^
      cCount.hashCode ^
      inBlacklist.hashCode ^
      sDjpCount.hashCode ^
      playlistCount.hashCode ^
      sCount.hashCode ^
      newFollows.hashCode;
}
