import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'artist_toplist.dart';
import 'find_top.dart';

part 'top_list.g.dart';

@JsonSerializable()
class TopList {
  int? code;
  List<FindTop>? list;
  ArtistToplist? artistToplist;

  TopList({this.code, this.list, this.artistToplist});

  @override
  String toString() {
    return 'TopList(code: $code, list: $list, artistToplist: $artistToplist)';
  }

  factory TopList.fromJson(Map<String, dynamic> json) {
    return _$TopListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TopListToJson(this);

  TopList copyWith({
    int? code,
    List<FindTop>? list,
    ArtistToplist? artistToplist,
  }) {
    return TopList(
      code: code ?? this.code,
      list: list ?? this.list,
      artistToplist: artistToplist ?? this.artistToplist,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! TopList) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => code.hashCode ^ list.hashCode ^ artistToplist.hashCode;
}
