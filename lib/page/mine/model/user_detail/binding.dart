import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'binding.g.dart';

@JsonSerializable()
class Binding {
  int? expiresIn;
  int? refreshTime;
  int? bindingTime;
  dynamic tokenJsonStr;
  String? url;
  bool? expired;
  int? userId;
  int? id;
  int? type;

  Binding({
    this.expiresIn,
    this.refreshTime,
    this.bindingTime,
    this.tokenJsonStr,
    this.url,
    this.expired,
    this.userId,
    this.id,
    this.type,
  });

  @override
  String toString() {
    return 'Binding(expiresIn: $expiresIn, refreshTime: $refreshTime, bindingTime: $bindingTime, tokenJsonStr: $tokenJsonStr, url: $url, expired: $expired, userId: $userId, id: $id, type: $type)';
  }

  factory Binding.fromJson(Map<String, dynamic> json) {
    return _$BindingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BindingToJson(this);

  Binding copyWith({
    int? expiresIn,
    int? refreshTime,
    int? bindingTime,
    dynamic tokenJsonStr,
    String? url,
    bool? expired,
    int? userId,
    int? id,
    int? type,
  }) {
    return Binding(
      expiresIn: expiresIn ?? this.expiresIn,
      refreshTime: refreshTime ?? this.refreshTime,
      bindingTime: bindingTime ?? this.bindingTime,
      tokenJsonStr: tokenJsonStr ?? this.tokenJsonStr,
      url: url ?? this.url,
      expired: expired ?? this.expired,
      userId: userId ?? this.userId,
      id: id ?? this.id,
      type: type ?? this.type,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Binding) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      expiresIn.hashCode ^
      refreshTime.hashCode ^
      bindingTime.hashCode ^
      tokenJsonStr.hashCode ^
      url.hashCode ^
      expired.hashCode ^
      userId.hashCode ^
      id.hashCode ^
      type.hashCode;
}
