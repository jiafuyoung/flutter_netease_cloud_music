import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'playlist.dart';

part 'song_list_detail.g.dart';

@JsonSerializable()
class SongListDetail {
  int? code;
  dynamic relatedVideos;
  Playlist? playlist;
  dynamic sharedPrivilege;
  dynamic resEntrance;
  dynamic fromUsers;
  int? fromUserCount;
  dynamic songFromUsers;

  SongListDetail({
    this.code,
    this.relatedVideos,
    this.playlist,
    this.sharedPrivilege,
    this.resEntrance,
    this.fromUsers,
    this.fromUserCount,
    this.songFromUsers,
  });

  @override
  String toString() {
    return 'SongListDetail(code: $code, relatedVideos: $relatedVideos, playlist: $playlist, sharedPrivilege: $sharedPrivilege, resEntrance: $resEntrance, fromUsers: $fromUsers, fromUserCount: $fromUserCount, songFromUsers: $songFromUsers)';
  }

  factory SongListDetail.fromJson(Map<String, dynamic> json) {
    return _$SongListDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SongListDetailToJson(this);

  SongListDetail copyWith({
    int? code,
    dynamic relatedVideos,
    Playlist? playlist,
    dynamic sharedPrivilege,
    dynamic resEntrance,
    dynamic fromUsers,
    int? fromUserCount,
    dynamic songFromUsers,
  }) {
    return SongListDetail(
      code: code ?? this.code,
      relatedVideos: relatedVideos ?? this.relatedVideos,
      playlist: playlist ?? this.playlist,
      sharedPrivilege: sharedPrivilege ?? this.sharedPrivilege,
      resEntrance: resEntrance ?? this.resEntrance,
      fromUsers: fromUsers ?? this.fromUsers,
      fromUserCount: fromUserCount ?? this.fromUserCount,
      songFromUsers: songFromUsers ?? this.songFromUsers,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SongListDetail) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      code.hashCode ^
      relatedVideos.hashCode ^
      playlist.hashCode ^
      sharedPrivilege.hashCode ^
      resEntrance.hashCode ^
      fromUsers.hashCode ^
      fromUserCount.hashCode ^
      songFromUsers.hashCode;
}
