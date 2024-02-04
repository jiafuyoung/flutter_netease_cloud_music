import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'playlist.dart';

part 'user_play_list.g.dart';

@JsonSerializable()
class UserPlayList {
  String? version;
  bool? more;
  List<Playlist>? playlist;
  int? code;

  UserPlayList({this.version, this.more, this.playlist, this.code});

  @override
  String toString() {
    return 'UserPlayList(version: $version, more: $more, playlist: $playlist, code: $code)';
  }

  factory UserPlayList.fromJson(Map<String, dynamic> json) {
    return _$UserPlayListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserPlayListToJson(this);

  UserPlayList copyWith({
    String? version,
    bool? more,
    List<Playlist>? playlist,
    int? code,
  }) {
    return UserPlayList(
      version: version ?? this.version,
      more: more ?? this.more,
      playlist: playlist ?? this.playlist,
      code: code ?? this.code,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! UserPlayList) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      version.hashCode ^ more.hashCode ^ playlist.hashCode ^ code.hashCode;
}
