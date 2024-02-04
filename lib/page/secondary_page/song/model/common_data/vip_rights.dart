import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'associator.dart';
import 'music_package.dart';

part 'vip_rights.g.dart';

@JsonSerializable()
class VipRights {
  Associator? associator;
  MusicPackage? musicPackage;
  dynamic redplus;
  int? redVipAnnualCount;
  int? redVipLevel;
  int? relationType;

  VipRights({
    this.associator,
    this.musicPackage,
    this.redplus,
    this.redVipAnnualCount,
    this.redVipLevel,
    this.relationType,
  });

  @override
  String toString() {
    return 'VipRights(associator: $associator, musicPackage: $musicPackage, redplus: $redplus, redVipAnnualCount: $redVipAnnualCount, redVipLevel: $redVipLevel, relationType: $relationType)';
  }

  factory VipRights.fromJson(Map<String, dynamic> json) {
    return _$VipRightsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VipRightsToJson(this);

  VipRights copyWith({
    Associator? associator,
    MusicPackage? musicPackage,
    dynamic redplus,
    int? redVipAnnualCount,
    int? redVipLevel,
    int? relationType,
  }) {
    return VipRights(
      associator: associator ?? this.associator,
      musicPackage: musicPackage ?? this.musicPackage,
      redplus: redplus ?? this.redplus,
      redVipAnnualCount: redVipAnnualCount ?? this.redVipAnnualCount,
      redVipLevel: redVipLevel ?? this.redVipLevel,
      relationType: relationType ?? this.relationType,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! VipRights) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      associator.hashCode ^
      musicPackage.hashCode ^
      redplus.hashCode ^
      redVipAnnualCount.hashCode ^
      redVipLevel.hashCode ^
      relationType.hashCode;
}
