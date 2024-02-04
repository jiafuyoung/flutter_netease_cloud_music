import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'free_time_trial_privilege.g.dart';

@JsonSerializable()
class FreeTimeTrialPrivilege {
  bool? resConsumable;
  bool? userConsumable;
  int? type;
  int? remainTime;

  FreeTimeTrialPrivilege({
    this.resConsumable,
    this.userConsumable,
    this.type,
    this.remainTime,
  });

  @override
  String toString() {
    return 'FreeTimeTrialPrivilege(resConsumable: $resConsumable, userConsumable: $userConsumable, type: $type, remainTime: $remainTime)';
  }

  factory FreeTimeTrialPrivilege.fromJson(Map<String, dynamic> json) {
    return _$FreeTimeTrialPrivilegeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FreeTimeTrialPrivilegeToJson(this);

  FreeTimeTrialPrivilege copyWith({
    bool? resConsumable,
    bool? userConsumable,
    int? type,
    int? remainTime,
  }) {
    return FreeTimeTrialPrivilege(
      resConsumable: resConsumable ?? this.resConsumable,
      userConsumable: userConsumable ?? this.userConsumable,
      type: type ?? this.type,
      remainTime: remainTime ?? this.remainTime,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! FreeTimeTrialPrivilege) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      resConsumable.hashCode ^
      userConsumable.hashCode ^
      type.hashCode ^
      remainTime.hashCode;
}
