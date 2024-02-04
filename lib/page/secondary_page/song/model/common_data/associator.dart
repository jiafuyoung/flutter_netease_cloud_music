import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'associator.g.dart';

@JsonSerializable()
class Associator {
  int? vipCode;
  bool? rights;
  String? iconUrl;

  Associator({this.vipCode, this.rights, this.iconUrl});

  @override
  String toString() {
    return 'Associator(vipCode: $vipCode, rights: $rights, iconUrl: $iconUrl)';
  }

  factory Associator.fromJson(Map<String, dynamic> json) {
    return _$AssociatorFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AssociatorToJson(this);

  Associator copyWith({
    int? vipCode,
    bool? rights,
    String? iconUrl,
  }) {
    return Associator(
      vipCode: vipCode ?? this.vipCode,
      rights: rights ?? this.rights,
      iconUrl: iconUrl ?? this.iconUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Associator) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => vipCode.hashCode ^ rights.hashCode ^ iconUrl.hashCode;
}
