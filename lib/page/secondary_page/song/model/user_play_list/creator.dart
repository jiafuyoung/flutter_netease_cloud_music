import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'creator.g.dart';

@JsonSerializable()
class Creator {
  bool? defaultAvatar;
  int? province;
  int? authStatus;
  bool? followed;
  String? avatarUrl;
  int? accountStatus;
  int? gender;
  int? city;
  int? birthday;
  int? userId;
  int? userType;
  String? nickname;
  String? signature;
  String? description;
  String? detailDescription;
  int? avatarImgId;
  int? backgroundImgId;
  String? backgroundUrl;
  int? authority;
  bool? mutual;
  dynamic expertTags;
  dynamic experts;
  int? djStatus;
  int? vipType;
  dynamic remarkName;
  int? authenticationTypes;
  dynamic avatarDetail;
  bool? anchor;
  String? avatarImgIdStr;
  String? backgroundImgIdStr;

  Creator({
    this.defaultAvatar,
    this.province,
    this.authStatus,
    this.followed,
    this.avatarUrl,
    this.accountStatus,
    this.gender,
    this.city,
    this.birthday,
    required this.userId,
    this.userType,
    this.nickname,
    this.signature,
    this.description,
    this.detailDescription,
    this.avatarImgId,
    this.backgroundImgId,
    this.backgroundUrl,
    this.authority,
    this.mutual,
    this.expertTags,
    this.experts,
    this.djStatus,
    this.vipType,
    this.remarkName,
    this.authenticationTypes,
    this.avatarDetail,
    this.anchor,
    this.avatarImgIdStr,
    this.backgroundImgIdStr,
  });

  @override
  String toString() {
    return 'Creator(defaultAvatar: $defaultAvatar, province: $province, authStatus: $authStatus, followed: $followed, avatarUrl: $avatarUrl, accountStatus: $accountStatus, gender: $gender, city: $city, birthday: $birthday, userId: $userId, userType: $userType, nickname: $nickname, signature: $signature, description: $description, detailDescription: $detailDescription, avatarImgId: $avatarImgId, backgroundImgId: $backgroundImgId, backgroundUrl: $backgroundUrl, authority: $authority, mutual: $mutual, expertTags: $expertTags, experts: $experts, djStatus: $djStatus, vipType: $vipType, remarkName: $remarkName, authenticationTypes: $authenticationTypes, avatarDetail: $avatarDetail, anchor: $anchor, avatarImgIdStr: $avatarImgIdStr, backgroundImgIdStr: $backgroundImgIdStr, avatarImgIdStr: $avatarImgIdStr)';
  }

  factory Creator.fromJson(Map<String, dynamic> json) {
    return _$CreatorFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreatorToJson(this);

  Creator copyWith({
    bool? defaultAvatar,
    int? province,
    int? authStatus,
    bool? followed,
    String? avatarUrl,
    int? accountStatus,
    int? gender,
    int? city,
    int? birthday,
    int? userId,
    int? userType,
    String? nickname,
    String? signature,
    String? description,
    String? detailDescription,
    int? avatarImgId,
    int? backgroundImgId,
    String? backgroundUrl,
    int? authority,
    bool? mutual,
    dynamic expertTags,
    dynamic experts,
    int? djStatus,
    int? vipType,
    dynamic remarkName,
    int? authenticationTypes,
    dynamic avatarDetail,
    bool? anchor,
    String? avatarImgIdStr,
    String? backgroundImgIdStr,
  }) {
    return Creator(
      defaultAvatar: defaultAvatar ?? this.defaultAvatar,
      province: province ?? this.province,
      authStatus: authStatus ?? this.authStatus,
      followed: followed ?? this.followed,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      accountStatus: accountStatus ?? this.accountStatus,
      gender: gender ?? this.gender,
      city: city ?? this.city,
      birthday: birthday ?? this.birthday,
      userId: userId ?? this.userId,
      userType: userType ?? this.userType,
      nickname: nickname ?? this.nickname,
      signature: signature ?? this.signature,
      description: description ?? this.description,
      detailDescription: detailDescription ?? this.detailDescription,
      avatarImgId: avatarImgId ?? this.avatarImgId,
      backgroundImgId: backgroundImgId ?? this.backgroundImgId,
      backgroundUrl: backgroundUrl ?? this.backgroundUrl,
      authority: authority ?? this.authority,
      mutual: mutual ?? this.mutual,
      expertTags: expertTags ?? this.expertTags,
      experts: experts ?? this.experts,
      djStatus: djStatus ?? this.djStatus,
      vipType: vipType ?? this.vipType,
      remarkName: remarkName ?? this.remarkName,
      authenticationTypes: authenticationTypes ?? this.authenticationTypes,
      avatarDetail: avatarDetail ?? this.avatarDetail,
      anchor: anchor ?? this.anchor,
      avatarImgIdStr: avatarImgIdStr ?? this.avatarImgIdStr,
      backgroundImgIdStr: backgroundImgIdStr ?? this.backgroundImgIdStr,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Creator) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      defaultAvatar.hashCode ^
      province.hashCode ^
      authStatus.hashCode ^
      followed.hashCode ^
      avatarUrl.hashCode ^
      accountStatus.hashCode ^
      gender.hashCode ^
      city.hashCode ^
      birthday.hashCode ^
      userId.hashCode ^
      userType.hashCode ^
      nickname.hashCode ^
      signature.hashCode ^
      description.hashCode ^
      detailDescription.hashCode ^
      avatarImgId.hashCode ^
      backgroundImgId.hashCode ^
      backgroundUrl.hashCode ^
      authority.hashCode ^
      mutual.hashCode ^
      expertTags.hashCode ^
      experts.hashCode ^
      djStatus.hashCode ^
      vipType.hashCode ^
      remarkName.hashCode ^
      authenticationTypes.hashCode ^
      avatarDetail.hashCode ^
      anchor.hashCode ^
      avatarImgIdStr.hashCode ^
      backgroundImgIdStr.hashCode ^
      avatarImgIdStr.hashCode;
}
