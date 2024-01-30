import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'artist_toplist.g.dart';

@JsonSerializable()
class ArtistToplist {
  String? coverUrl;
  String? name;
  String? upateFrequency;
  int? position;
  String? updateFrequency;

  ArtistToplist({
    this.coverUrl,
    this.name,
    this.upateFrequency,
    this.position,
    this.updateFrequency,
  });

  @override
  String toString() {
    return 'ArtistToplist(coverUrl: $coverUrl, name: $name, upateFrequency: $upateFrequency, position: $position, updateFrequency: $updateFrequency)';
  }

  factory ArtistToplist.fromJson(Map<String, dynamic> json) {
    return _$ArtistToplistFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ArtistToplistToJson(this);

  ArtistToplist copyWith({
    String? coverUrl,
    String? name,
    String? upateFrequency,
    int? position,
    String? updateFrequency,
  }) {
    return ArtistToplist(
      coverUrl: coverUrl ?? this.coverUrl,
      name: name ?? this.name,
      upateFrequency: upateFrequency ?? this.upateFrequency,
      position: position ?? this.position,
      updateFrequency: updateFrequency ?? this.updateFrequency,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ArtistToplist) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      coverUrl.hashCode ^
      name.hashCode ^
      upateFrequency.hashCode ^
      position.hashCode ^
      updateFrequency.hashCode;
}
