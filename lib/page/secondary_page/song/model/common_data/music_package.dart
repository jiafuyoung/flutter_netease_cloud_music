import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'music_package.g.dart';

@JsonSerializable()
class MusicPackage {
  int? vipCode;
  bool? rights;
  String? iconUrl;

  MusicPackage({this.vipCode, this.rights, this.iconUrl});

  @override
  String toString() {
    return 'MusicPackage(vipCode: $vipCode, rights: $rights, iconUrl: $iconUrl)';
  }

  factory MusicPackage.fromJson(Map<String, dynamic> json) {
    return _$MusicPackageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MusicPackageToJson(this);

  MusicPackage copyWith({
    int? vipCode,
    bool? rights,
    String? iconUrl,
  }) {
    return MusicPackage(
      vipCode: vipCode ?? this.vipCode,
      rights: rights ?? this.rights,
      iconUrl: iconUrl ?? this.iconUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! MusicPackage) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => vipCode.hashCode ^ rights.hashCode ^ iconUrl.hashCode;
}
