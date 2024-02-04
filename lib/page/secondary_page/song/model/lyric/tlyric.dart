import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tlyric.g.dart';

@JsonSerializable()
class Tlyric {
  int? version;
  String? lyric;

  Tlyric({this.version, this.lyric});

  @override
  String toString() => 'Tlyric(version: $version, lyric: $lyric)';

  factory Tlyric.fromJson(Map<String, dynamic> json) {
    return _$TlyricFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TlyricToJson(this);

  Tlyric copyWith({
    int? version,
    String? lyric,
  }) {
    return Tlyric(
      version: version ?? this.version,
      lyric: lyric ?? this.lyric,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Tlyric) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => version.hashCode ^ lyric.hashCode;
}
