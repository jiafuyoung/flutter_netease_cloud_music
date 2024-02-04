import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'song_url.g.dart';

@JsonSerializable()
class SongUrl {
  int? code;
  List<Datum>? data;

  SongUrl({this.code, this.data});

  @override
  String toString() => 'SongUrl(code: $code, data: $data)';

  factory SongUrl.fromJson(Map<String, dynamic> json) {
    return _$SongUrlFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SongUrlToJson(this);

  SongUrl copyWith({
    int? code,
    List<Datum>? data,
  }) {
    return SongUrl(
      code: code ?? this.code,
      data: data ?? this.data,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SongUrl) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => code.hashCode ^ data.hashCode;
}
