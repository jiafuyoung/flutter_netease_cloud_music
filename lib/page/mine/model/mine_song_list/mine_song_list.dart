import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'playlist.dart';

part 'mine_song_list.g.dart';

@JsonSerializable()
class MineSongList {
  String? version;
  bool? more;
  List<Playlist>? playlist;
  int? code;

  MineSongList({this.version, this.more, this.playlist, this.code});

  @override
  String toString() {
    return 'MineSongList(version: $version, more: $more, playlist: $playlist, code: $code)';
  }

  factory MineSongList.fromJson(Map<String, dynamic> json) {
    return _$MineSongListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MineSongListToJson(this);

  MineSongList copyWith({
    String? version,
    bool? more,
    List<Playlist>? playlist,
    int? code,
  }) {
    return MineSongList(
      version: version ?? this.version,
      more: more ?? this.more,
      playlist: playlist ?? this.playlist,
      code: code ?? this.code,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! MineSongList) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      version.hashCode ^ more.hashCode ^ playlist.hashCode ^ code.hashCode;
}
