import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'privacy_item_unlimit.g.dart';

@JsonSerializable()
class PrivacyItemUnlimit {
  bool? area;
  bool? college;
  bool? gender;
  bool? age;
  bool? villageAge;

  PrivacyItemUnlimit({
    this.area,
    this.college,
    this.gender,
    this.age,
    this.villageAge,
  });

  @override
  String toString() {
    return 'PrivacyItemUnlimit(area: $area, college: $college, gender: $gender, age: $age, villageAge: $villageAge)';
  }

  factory PrivacyItemUnlimit.fromJson(Map<String, dynamic> json) {
    return _$PrivacyItemUnlimitFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PrivacyItemUnlimitToJson(this);

  PrivacyItemUnlimit copyWith({
    bool? area,
    bool? college,
    bool? gender,
    bool? age,
    bool? villageAge,
  }) {
    return PrivacyItemUnlimit(
      area: area ?? this.area,
      college: college ?? this.college,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      villageAge: villageAge ?? this.villageAge,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! PrivacyItemUnlimit) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      area.hashCode ^
      college.hashCode ^
      gender.hashCode ^
      age.hashCode ^
      villageAge.hashCode;
}
