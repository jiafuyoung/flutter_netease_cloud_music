import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ar.g.dart';

@JsonSerializable()
class Ar {
  int? id;
  String? name;
  List<dynamic>? tns;
  List<dynamic>? alias;

  Ar({this.id, this.name, this.tns, this.alias});

  @override
  String toString() => 'Ar(id: $id, name: $name, tns: $tns, alias: $alias)';

  factory Ar.fromJson(Map<String, dynamic> json) => _$ArFromJson(json);

  Map<String, dynamic> toJson() => _$ArToJson(this);

  Ar copyWith({
    int? id,
    String? name,
    List<dynamic>? tns,
    List<dynamic>? alias,
  }) {
    return Ar(
      id: id ?? this.id,
      name: name ?? this.name,
      tns: tns ?? this.tns,
      alias: alias ?? this.alias,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Ar) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ tns.hashCode ^ alias.hashCode;
}
