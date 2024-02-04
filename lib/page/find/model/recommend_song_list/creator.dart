import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'creator.g.dart';

@JsonSerializable()
class Creator {
  bool? mutual;
  dynamic remarkName;
  int? accountStatus;
  int? vipType;
  int? province;
  String avatarUrl;
  int? authStatus;
  int? userType;
  String? nickname;
  int? gender;
  int? birthday;
  int? city;
  String? backgroundUrl;
  dynamic expertTags;
  int? djStatus;
  bool? followed;
  int? avatarImgId;
  int? backgroundImgId;
  String? detailDescription;
  bool? defaultAvatar;
  String? backgroundImgIdStr;
  String? avatarImgIdStr;
  String? description;
  int? userId;
  String? signature;
  int? authority;

  Creator({
    this.mutual,
    this.remarkName,
    this.accountStatus,
    this.vipType,
    this.province,
    required this.avatarUrl,
    this.authStatus,
    this.userType,
    this.nickname,
    this.gender,
    this.birthday,
    this.city,
    this.backgroundUrl,
    this.expertTags,
    this.djStatus,
    this.followed,
    this.avatarImgId,
    this.backgroundImgId,
    this.detailDescription,
    this.defaultAvatar,
    this.backgroundImgIdStr,
    this.avatarImgIdStr,
    this.description,
    this.userId,
    this.signature,
    this.authority,
  });

  @override
  String toString() {
    return 'Creator(mutual: $mutual, remarkName: $remarkName, accountStatus: $accountStatus, vipType: $vipType, province: $province, avatarUrl: $avatarUrl, authStatus: $authStatus, userType: $userType, nickname: $nickname, gender: $gender, birthday: $birthday, city: $city, backgroundUrl: $backgroundUrl, expertTags: $expertTags, djStatus: $djStatus, followed: $followed, avatarImgId: $avatarImgId, backgroundImgId: $backgroundImgId, detailDescription: $detailDescription, defaultAvatar: $defaultAvatar, backgroundImgIdStr: $backgroundImgIdStr, avatarImgIdStr: $avatarImgIdStr, description: $description, userId: $userId, signature: $signature, authority: $authority)';
  }

  factory Creator.fromJson(Map<String, dynamic> json) {
    return _$CreatorFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreatorToJson(this);

  Creator copyWith({
    bool? mutual,
    dynamic remarkName,
    int? accountStatus,
    int? vipType,
    int? province,
    String? avatarUrl,
    int? authStatus,
    int? userType,
    String? nickname,
    int? gender,
    int? birthday,
    int? city,
    String? backgroundUrl,
    dynamic expertTags,
    int? djStatus,
    bool? followed,
    int? avatarImgId,
    int? backgroundImgId,
    String? detailDescription,
    bool? defaultAvatar,
    String? backgroundImgIdStr,
    String? avatarImgIdStr,
    String? description,
    int? userId,
    String? signature,
    int? authority,
  }) {
    return Creator(
      mutual: mutual ?? this.mutual,
      remarkName: remarkName ?? this.remarkName,
      accountStatus: accountStatus ?? this.accountStatus,
      vipType: vipType ?? this.vipType,
      province: province ?? this.province,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      authStatus: authStatus ?? this.authStatus,
      userType: userType ?? this.userType,
      nickname: nickname ?? this.nickname,
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
      city: city ?? this.city,
      backgroundUrl: backgroundUrl ?? this.backgroundUrl,
      expertTags: expertTags ?? this.expertTags,
      djStatus: djStatus ?? this.djStatus,
      followed: followed ?? this.followed,
      avatarImgId: avatarImgId ?? this.avatarImgId,
      backgroundImgId: backgroundImgId ?? this.backgroundImgId,
      detailDescription: detailDescription ?? this.detailDescription,
      defaultAvatar: defaultAvatar ?? this.defaultAvatar,
      backgroundImgIdStr: backgroundImgIdStr ?? this.backgroundImgIdStr,
      avatarImgIdStr: avatarImgIdStr ?? this.avatarImgIdStr,
      description: description ?? this.description,
      userId: userId ?? this.userId,
      signature: signature ?? this.signature,
      authority: authority ?? this.authority,
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
      mutual.hashCode ^
      remarkName.hashCode ^
      accountStatus.hashCode ^
      vipType.hashCode ^
      province.hashCode ^
      avatarUrl.hashCode ^
      authStatus.hashCode ^
      userType.hashCode ^
      nickname.hashCode ^
      gender.hashCode ^
      birthday.hashCode ^
      city.hashCode ^
      backgroundUrl.hashCode ^
      expertTags.hashCode ^
      djStatus.hashCode ^
      followed.hashCode ^
      avatarImgId.hashCode ^
      backgroundImgId.hashCode ^
      detailDescription.hashCode ^
      defaultAvatar.hashCode ^
      backgroundImgIdStr.hashCode ^
      avatarImgIdStr.hashCode ^
      description.hashCode ^
      userId.hashCode ^
      signature.hashCode ^
      authority.hashCode;
}
