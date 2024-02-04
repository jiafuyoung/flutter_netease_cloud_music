import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'klyric.dart';
import 'lrc.dart';
import 'romalrc.dart';
import 'tlyric.dart';

part 'lyric.g.dart';

class Lyric {
  String? lyric;
  Duration? startTime;
  Duration? endTime;
  double? offset;

  Lyric(this.lyric, {this.startTime, this.endTime, this.offset});

  @override
  String toString() {
    return 'Lyric{lyric: $lyric, startTime: $startTime, endTime: $endTime}';
  }
}

dynamic convertValueByType(value, Type type, {String stack = ""}) {
  if (value == null) {
//    debugPrint("$stack : value is null");
    if (type == String) {
      return "";
    } else if (type == int) {
      return 0;
    } else if (type == double) {
      return 0.0;
    } else if (type == bool) {
      return false;
    }
    return null;
  }

  if (value.runtimeType == type) {
    return value;
  }
  var valueS = value.toString();
  debugPrint("$stack : ${value.runtimeType} is not $type type");
  if (type == String) {
    return valueS;
  } else if (type == int) {
    return int.tryParse(valueS);
  } else if (type == double) {
    return double.tryParse(valueS);
  } else if (type == bool) {
    valueS = valueS.toLowerCase();
    var intValue = int.tryParse(valueS);
    if (intValue != null) {
      return intValue == 1;
    }
    return valueS == "true";
  }
}

void tryCatch(Function f) {
  try {
    f.call();
  } catch (e, stack) {
    debugPrint("$e");
    debugPrint("$stack");
  }
}

@JsonSerializable()
class LyricData {
  bool? sgc;
  bool? sfy;
  bool? qfy;
  Lrc? lrc;
  Klyric? klyric;
  Tlyric? tlyric;
  Romalrc? romalrc;
  int? code;

  LyricData({
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
    return 'LyricData(sgc: $sgc, sfy: $sfy, qfy: $qfy, lrc: $lrc, klyric: $klyric, tlyric: $tlyric, romalrc: $romalrc, code: $code)';
  }

  factory LyricData.fromJson(Map<String, dynamic> json) =>
      _$LyricDataFromJson(json);

  Map<String, dynamic> toJson() => _$LyricDataToJson(this);

  LyricData copyWith({
    bool? sgc,
    bool? sfy,
    bool? qfy,
    Lrc? lrc,
    Klyric? klyric,
    Tlyric? tlyric,
    Romalrc? romalrc,
    int? code,
  }) {
    return LyricData(
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
    if (other is! LyricData) return false;
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
