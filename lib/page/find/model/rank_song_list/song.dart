import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'al.dart';
import 'ar.dart';

part 'song.g.dart';

@JsonSerializable()
class Song {
  String? name;
  int id;
  List<Ar>? ar;
  List<dynamic>? alia;
  int? pop;
  String? rt;
  Al? al;
  int? copyright;
  int? mark;
  int? originCoverType;
  bool? resourceState;
  int? version;
  int? single;
  int? mv;
  int? rtype;
  int? mst;
  int? cp;
  int? publishTime;

  Song({
    this.name,
    required this.id,
    this.ar,
    this.alia,
    this.pop,
    this.rt,
    this.al,
    this.copyright,
    this.mark,
    this.originCoverType,
    this.resourceState,
    this.version,
    this.single,
    this.mv,
    this.rtype,
    this.mst,
    this.cp,
    this.publishTime,
  });

  @override
  String toString() {
    return 'Song(name: $name, id: $id, ar: $ar, alia: $alia, pop: $pop, rt: $rt, al: $al, copyright: $copyright, mark: $mark, originCoverType: $originCoverType, resourceState: $resourceState, version: $version, single: $single, mv: $mv, rtype: $rtype, mst: $mst, cp: $cp, publishTime: $publishTime)';
  }

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);

  Map<String, dynamic> toJson() => _$SongToJson(this);

  Song copyWith({
    String? name,
    int? id,
    List<Ar>? ar,
    List<dynamic>? alia,
    int? pop,
    String? rt,
    Al? al,
    int? copyright,
    int? mark,
    int? originCoverType,
    bool? resourceState,
    int? version,
    int? single,
    int? mv,
    int? rtype,
    int? mst,
    int? cp,
    int? publishTime,
  }) {
    return Song(
      name: name ?? this.name,
      id: id ?? this.id,
      ar: ar ?? this.ar,
      alia: alia ?? this.alia,
      pop: pop ?? this.pop,
      rt: rt ?? this.rt,
      al: al ?? this.al,
      copyright: copyright ?? this.copyright,
      mark: mark ?? this.mark,
      originCoverType: originCoverType ?? this.originCoverType,
      resourceState: resourceState ?? this.resourceState,
      version: version ?? this.version,
      single: single ?? this.single,
      mv: mv ?? this.mv,
      rtype: rtype ?? this.rtype,
      mst: mst ?? this.mst,
      cp: cp ?? this.cp,
      publishTime: publishTime ?? this.publishTime,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Song) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      name.hashCode ^
      id.hashCode ^
      ar.hashCode ^
      alia.hashCode ^
      pop.hashCode ^
      rt.hashCode ^
      al.hashCode ^
      copyright.hashCode ^
      mark.hashCode ^
      originCoverType.hashCode ^
      resourceState.hashCode ^
      version.hashCode ^
      single.hashCode ^
      mv.hashCode ^
      rtype.hashCode ^
      mst.hashCode ^
      cp.hashCode ^
      publishTime.hashCode;
}
