import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'creator.dart';

part 'recommend.g.dart';

@JsonSerializable()
class Recommend {
  int? id;
  int? type;
  String name;
  String? copywriter;
  String? picUrl;
  int? playcount;
  int? createTime;
  Creator creator;
  int? trackCount;
  int? userId;
  String? alg;

  Recommend({
    this.id,
    this.type,
    required this.name,
    this.copywriter,
    this.picUrl,
    this.playcount,
    this.createTime,
    required this.creator,
    this.trackCount,
    this.userId,
    this.alg,
  });

  @override
  String toString() {
    return 'Recommend(id: $id, type: $type, name: $name, copywriter: $copywriter, picUrl: $picUrl, playcount: $playcount, createTime: $createTime, creator: $creator, trackCount: $trackCount, userId: $userId, alg: $alg)';
  }

  factory Recommend.fromJson(Map<String, dynamic> json) {
    return _$RecommendFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RecommendToJson(this);

  Recommend copyWith({
    int? id,
    int? type,
    String? name,
    String? copywriter,
    String? picUrl,
    int? playcount,
    int? createTime,
    Creator? creator,
    int? trackCount,
    int? userId,
    String? alg,
  }) {
    return Recommend(
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      copywriter: copywriter ?? this.copywriter,
      picUrl: picUrl ?? this.picUrl,
      playcount: playcount ?? this.playcount,
      createTime: createTime ?? this.createTime,
      creator: creator ?? this.creator,
      trackCount: trackCount ?? this.trackCount,
      userId: userId ?? this.userId,
      alg: alg ?? this.alg,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Recommend) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      type.hashCode ^
      name.hashCode ^
      copywriter.hashCode ^
      picUrl.hashCode ^
      playcount.hashCode ^
      createTime.hashCode ^
      creator.hashCode ^
      trackCount.hashCode ^
      userId.hashCode ^
      alg.hashCode;
}
