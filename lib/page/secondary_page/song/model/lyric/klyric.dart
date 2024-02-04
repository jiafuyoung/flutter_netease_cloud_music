import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'klyric.g.dart';

@JsonSerializable()
class Klyric {
  int? version;
  String? lyric;

  Klyric({this.version, this.lyric});

  @override
  String toString() => 'Klyric(version: $version, lyric: $lyric)';

  factory Klyric.fromJson(Map<String, dynamic> json) {
    return _$KlyricFromJson(json);
  }

  Map<String, dynamic> toJson() => _$KlyricToJson(this);

  Klyric copyWith({
    int? version,
    String? lyric,
  }) {
    return Klyric(
      version: version ?? this.version,
      lyric: lyric ?? this.lyric,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Klyric) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => version.hashCode ^ lyric.hashCode;
}
