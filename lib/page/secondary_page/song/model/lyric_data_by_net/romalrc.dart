import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'romalrc.g.dart';

@JsonSerializable()
class Romalrc {
  int? version;
  String? lyric;

  Romalrc({this.version, this.lyric});

  @override
  String toString() => 'Romalrc(version: $version, lyric: $lyric)';

  factory Romalrc.fromJson(Map<String, dynamic> json) {
    return _$RomalrcFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RomalrcToJson(this);

  Romalrc copyWith({
    int? version,
    String? lyric,
  }) {
    return Romalrc(
      version: version ?? this.version,
      lyric: lyric ?? this.lyric,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Romalrc) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => version.hashCode ^ lyric.hashCode;
}
