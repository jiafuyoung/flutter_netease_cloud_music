import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_point.g.dart';

@JsonSerializable()
class UserPoint {
  int? userId;
  int? balance;
  int? updateTime;
  int? version;
  int? status;
  int? blockBalance;

  UserPoint({
    this.userId,
    this.balance,
    this.updateTime,
    this.version,
    this.status,
    this.blockBalance,
  });

  @override
  String toString() {
    return 'UserPoint(userId: $userId, balance: $balance, updateTime: $updateTime, version: $version, status: $status, blockBalance: $blockBalance)';
  }

  factory UserPoint.fromJson(Map<String, dynamic> json) {
    return _$UserPointFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserPointToJson(this);

  UserPoint copyWith({
    int? userId,
    int? balance,
    int? updateTime,
    int? version,
    int? status,
    int? blockBalance,
  }) {
    return UserPoint(
      userId: userId ?? this.userId,
      balance: balance ?? this.balance,
      updateTime: updateTime ?? this.updateTime,
      version: version ?? this.version,
      status: status ?? this.status,
      blockBalance: blockBalance ?? this.blockBalance,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! UserPoint) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      userId.hashCode ^
      balance.hashCode ^
      updateTime.hashCode ^
      version.hashCode ^
      status.hashCode ^
      blockBalance.hashCode;
}
