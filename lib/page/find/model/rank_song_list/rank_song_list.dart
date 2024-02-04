import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'song.dart';

part 'rank_song_list.g.dart';

@JsonSerializable()
class RankSongList {
  List<Song>? songs;
  int? code;

  RankSongList({this.songs, this.code});

  @override
  String toString() => 'RankSongList(songs: $songs, code: $code)';

  factory RankSongList.fromJson(Map<String, dynamic> json) {
    return _$RankSongListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RankSongListToJson(this);

  RankSongList copyWith({
    List<Song>? songs,
    int? code,
  }) {
    return RankSongList(
      songs: songs ?? this.songs,
      code: code ?? this.code,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! RankSongList) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => songs.hashCode ^ code.hashCode;
}
