import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_village_info.g.dart';

@JsonSerializable()
class ProfileVillageInfo {
  String? title;
  dynamic imageUrl;
  String? targetUrl;

  ProfileVillageInfo({this.title, this.imageUrl, this.targetUrl});

  @override
  String toString() {
    return 'ProfileVillageInfo(title: $title, imageUrl: $imageUrl, targetUrl: $targetUrl)';
  }

  factory ProfileVillageInfo.fromJson(Map<String, dynamic> json) {
    return _$ProfileVillageInfoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileVillageInfoToJson(this);

  ProfileVillageInfo copyWith({
    String? title,
    dynamic imageUrl,
    String? targetUrl,
  }) {
    return ProfileVillageInfo(
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      targetUrl: targetUrl ?? this.targetUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ProfileVillageInfo) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => title.hashCode ^ imageUrl.hashCode ^ targetUrl.hashCode;
}
