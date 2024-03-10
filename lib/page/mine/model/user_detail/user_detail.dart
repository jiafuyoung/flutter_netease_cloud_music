import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'binding.dart';
import 'profile.dart';
import 'profile_village_info.dart';
import 'user_point.dart';

part 'user_detail.g.dart';

@JsonSerializable()
class UserDetail {
  int? level;
  int? listenSongs;
  UserPoint? userPoint;
  bool? mobileSign;
  bool? pcSign;
  Profile? profile;
  bool? peopleCanSeeMyPlayRecord;
  List<Binding>? bindings;
  bool? adValid;
  int? code;
  bool? newUser;
  bool? recallUser;
  int? createTime;
  int? createDays;
  ProfileVillageInfo? profileVillageInfo;

  UserDetail({
    this.level,
    this.listenSongs,
    this.userPoint,
    this.mobileSign,
    this.pcSign,
    this.profile,
    this.peopleCanSeeMyPlayRecord,
    this.bindings,
    this.adValid,
    this.code,
    this.newUser,
    this.recallUser,
    this.createTime,
    this.createDays,
    this.profileVillageInfo,
  });

  @override
  String toString() {
    return 'UserDetail(level: $level, listenSongs: $listenSongs, userPoint: $userPoint, mobileSign: $mobileSign, pcSign: $pcSign, profile: $profile, peopleCanSeeMyPlayRecord: $peopleCanSeeMyPlayRecord, bindings: $bindings, adValid: $adValid, code: $code, newUser: $newUser, recallUser: $recallUser, createTime: $createTime, createDays: $createDays, profileVillageInfo: $profileVillageInfo)';
  }

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return _$UserDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserDetailToJson(this);

  UserDetail copyWith({
    int? level,
    int? listenSongs,
    UserPoint? userPoint,
    bool? mobileSign,
    bool? pcSign,
    Profile? profile,
    bool? peopleCanSeeMyPlayRecord,
    List<Binding>? bindings,
    bool? adValid,
    int? code,
    bool? newUser,
    bool? recallUser,
    int? createTime,
    int? createDays,
    ProfileVillageInfo? profileVillageInfo,
  }) {
    return UserDetail(
      level: level ?? this.level,
      listenSongs: listenSongs ?? this.listenSongs,
      userPoint: userPoint ?? this.userPoint,
      mobileSign: mobileSign ?? this.mobileSign,
      pcSign: pcSign ?? this.pcSign,
      profile: profile ?? this.profile,
      peopleCanSeeMyPlayRecord:
          peopleCanSeeMyPlayRecord ?? this.peopleCanSeeMyPlayRecord,
      bindings: bindings ?? this.bindings,
      adValid: adValid ?? this.adValid,
      code: code ?? this.code,
      newUser: newUser ?? this.newUser,
      recallUser: recallUser ?? this.recallUser,
      createTime: createTime ?? this.createTime,
      createDays: createDays ?? this.createDays,
      profileVillageInfo: profileVillageInfo ?? this.profileVillageInfo,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! UserDetail) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      level.hashCode ^
      listenSongs.hashCode ^
      userPoint.hashCode ^
      mobileSign.hashCode ^
      pcSign.hashCode ^
      profile.hashCode ^
      peopleCanSeeMyPlayRecord.hashCode ^
      bindings.hashCode ^
      adValid.hashCode ^
      code.hashCode ^
      newUser.hashCode ^
      recallUser.hashCode ^
      createTime.hashCode ^
      createDays.hashCode ^
      profileVillageInfo.hashCode;
}
