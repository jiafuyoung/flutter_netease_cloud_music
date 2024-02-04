import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lrc.g.dart';

@JsonSerializable()
class Lrc {
  int? version;
  String? lyric;

  Lrc({this.version, this.lyric});

  @override
  String toString() => 'Lrc(version: $version, lyric: $lyric)';

  factory Lrc.fromJson(Map<String, dynamic> json) => _$LrcFromJson(json);

  Map<String, dynamic> toJson() => _$LrcToJson(this);

  Lrc copyWith({
    int? version,
    String? lyric,
  }) {
    return Lrc(
      version: version ?? this.version,
      lyric: lyric ?? this.lyric,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Lrc) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => version.hashCode ^ lyric.hashCode;
}
