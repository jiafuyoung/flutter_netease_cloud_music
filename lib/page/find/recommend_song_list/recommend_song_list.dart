import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'recommend.dart';

part 'recommend_song_list.g.dart';

@JsonSerializable()
class RecommendSongList {
  int? code;
  bool? featureFirst;
  bool? haveRcmdSongs;
  List<Recommend>? recommend;

  RecommendSongList({
    this.code,
    this.featureFirst,
    this.haveRcmdSongs,
    this.recommend,
  });

  @override
  String toString() {
    return 'RecommendSongList(code: $code, featureFirst: $featureFirst, haveRcmdSongs: $haveRcmdSongs, recommend: $recommend)';
  }

  factory RecommendSongList.fromJson(Map<String, dynamic> json) {
    return _$RecommendSongListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RecommendSongListToJson(this);

  RecommendSongList copyWith({
    int? code,
    bool? featureFirst,
    bool? haveRcmdSongs,
    List<Recommend>? recommend,
  }) {
    return RecommendSongList(
      code: code ?? this.code,
      featureFirst: featureFirst ?? this.featureFirst,
      haveRcmdSongs: haveRcmdSongs ?? this.haveRcmdSongs,
      recommend: recommend ?? this.recommend,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! RecommendSongList) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      code.hashCode ^
      featureFirst.hashCode ^
      haveRcmdSongs.hashCode ^
      recommend.hashCode;
}
