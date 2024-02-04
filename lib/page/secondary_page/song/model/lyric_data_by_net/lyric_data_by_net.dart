import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'klyric.dart';
import 'lrc.dart';
import 'romalrc.dart';
import 'tlyric.dart';

part 'lyric_data_by_net.g.dart';

@JsonSerializable()
class LyricDataByNet {
  bool? sgc;
  bool? sfy;
  bool? qfy;
  Lrc? lrc;
  Klyric? klyric;
  Tlyric? tlyric;
  Romalrc? romalrc;
  int? code;

  LyricDataByNet({
    this.sgc,
    this.sfy,
    this.qfy,
    this.lrc,
    this.klyric,
    this.tlyric,
    this.romalrc,
    this.code,
  });

  @override
  String toString() {
    return 'LyricDataByNet(sgc: $sgc, sfy: $sfy, qfy: $qfy, lrc: $lrc, klyric: $klyric, tlyric: $tlyric, romalrc: $romalrc, code: $code)';
  }

  factory LyricDataByNet.fromJson(Map<String, dynamic> json) {
    return _$LyricDataByNetFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LyricDataByNetToJson(this);

  LyricDataByNet copyWith({
    bool? sgc,
    bool? sfy,
    bool? qfy,
    Lrc? lrc,
    Klyric? klyric,
    Tlyric? tlyric,
    Romalrc? romalrc,
    int? code,
  }) {
    return LyricDataByNet(
      sgc: sgc ?? this.sgc,
      sfy: sfy ?? this.sfy,
      qfy: qfy ?? this.qfy,
      lrc: lrc ?? this.lrc,
      klyric: klyric ?? this.klyric,
      tlyric: tlyric ?? this.tlyric,
      romalrc: romalrc ?? this.romalrc,
      code: code ?? this.code,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! LyricDataByNet) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      sgc.hashCode ^
      sfy.hashCode ^
      qfy.hashCode ^
      lrc.hashCode ^
      klyric.hashCode ^
      tlyric.hashCode ^
      romalrc.hashCode ^
      code.hashCode;
}
