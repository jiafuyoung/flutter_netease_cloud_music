import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ip_location.g.dart';

@JsonSerializable()
class IpLocation {
  dynamic ip;
  String? location;
  dynamic userId;

  IpLocation({this.ip, this.location, this.userId});

  @override
  String toString() {
    return 'IpLocation(ip: $ip, location: $location, userId: $userId)';
  }

  factory IpLocation.fromJson(Map<String, dynamic> json) {
    return _$IpLocationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$IpLocationToJson(this);

  IpLocation copyWith({
    dynamic ip,
    String? location,
    dynamic userId,
  }) {
    return IpLocation(
      ip: ip ?? this.ip,
      location: location ?? this.location,
      userId: userId ?? this.userId,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! IpLocation) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => ip.hashCode ^ location.hashCode ^ userId.hashCode;
}
