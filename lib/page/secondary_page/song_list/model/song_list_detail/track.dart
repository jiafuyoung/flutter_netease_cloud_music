import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'al.dart';
import 'ar.dart';

part 'track.g.dart';

@JsonSerializable()
class Track {
  String? name;
  int? id;
  List<Ar>? ar;
  List<dynamic>? alia;
  int? pop;
  Al? al;
  String? cd;
  int? no;
  int? ftype;
  int? djId;
  int? copyright;
  @JsonKey(name: 's_id')
  int? sId;
  int? mark;
  int? originCoverType;
  bool? resourceState;
  int? version;
  int? single;
  int? mv;
  int? mst;
  int? publishTime;

  Track({
    this.name,
    this.id,
    this.ar,
    this.alia,
    this.pop,
    this.al,
    this.cd,
    this.no,
    this.ftype,
    this.djId,
    this.copyright,
    this.sId,
    this.mark,
    this.originCoverType,
    this.resourceState,
    this.version,
    this.single,
    this.mv,
    this.mst,
    this.publishTime,
  });

  @override
  String toString() {
    return 'Track(name: $name, id: $id, ar: $ar, alia: $alia, pop: $pop, al: $al, cd: $cd, no: $no, ftype: $ftype, djId: $djId, copyright: $copyright, sId: $sId, mark: $mark, originCoverType: $originCoverType, resourceState: $resourceState, version: $version, single: $single, mv: $mv, mst: $mst, publishTime: $publishTime)';
  }

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  Map<String, dynamic> toJson() => _$TrackToJson(this);

  Track copyWith({
    String? name,
    int? id,
    List<Ar>? ar,
    List<dynamic>? alia,
    int? pop,
    Al? al,
    String? cd,
    int? no,
    int? ftype,
    int? djId,
    int? copyright,
    int? sId,
    int? mark,
    int? originCoverType,
    bool? resourceState,
    int? version,
    int? single,
    int? mv,
    int? mst,
    int? publishTime,
  }) {
    return Track(
      name: name ?? this.name,
      id: id ?? this.id,
      ar: ar ?? this.ar,
      alia: alia ?? this.alia,
      pop: pop ?? this.pop,
      al: al ?? this.al,
      cd: cd ?? this.cd,
      no: no ?? this.no,
      ftype: ftype ?? this.ftype,
      djId: djId ?? this.djId,
      copyright: copyright ?? this.copyright,
      sId: sId ?? this.sId,
      mark: mark ?? this.mark,
      originCoverType: originCoverType ?? this.originCoverType,
      resourceState: resourceState ?? this.resourceState,
      version: version ?? this.version,
      single: single ?? this.single,
      mv: mv ?? this.mv,
      mst: mst ?? this.mst,
      publishTime: publishTime ?? this.publishTime,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Track) return false;
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
      al.hashCode ^
      cd.hashCode ^
      no.hashCode ^
      ftype.hashCode ^
      djId.hashCode ^
      copyright.hashCode ^
      sId.hashCode ^
      mark.hashCode ^
      originCoverType.hashCode ^
      resourceState.hashCode ^
      version.hashCode ^
      single.hashCode ^
      mv.hashCode ^
      mst.hashCode ^
      publishTime.hashCode;
}
