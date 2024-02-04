import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'free_time_trial_privilege.dart';
import 'free_trial_privilege.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  int? id;
  String url;
  int? br;
  int? size;
  String? md5;
  int? code;
  int? expi;
  String? type;
  double? gain;
  int? peak;
  int? fee;
  dynamic uf;
  int? payed;
  int? flag;
  bool? canExtend;
  dynamic freeTrialInfo;
  String? level;
  String? encodeType;
  dynamic channelLayout;
  FreeTrialPrivilege? freeTrialPrivilege;
  FreeTimeTrialPrivilege? freeTimeTrialPrivilege;
  int? urlSource;
  int? rightSource;
  dynamic podcastCtrp;
  dynamic effectTypes;
  int? time;

  Datum({
    this.id,
    required this.url,
    this.br,
    this.size,
    this.md5,
    this.code,
    this.expi,
    this.type,
    this.gain,
    this.peak,
    this.fee,
    this.uf,
    this.payed,
    this.flag,
    this.canExtend,
    this.freeTrialInfo,
    this.level,
    this.encodeType,
    this.channelLayout,
    this.freeTrialPrivilege,
    this.freeTimeTrialPrivilege,
    this.urlSource,
    this.rightSource,
    this.podcastCtrp,
    this.effectTypes,
    this.time,
  });

  @override
  String toString() {
    return 'Datum(id: $id, url: $url, br: $br, size: $size, md5: $md5, code: $code, expi: $expi, type: $type, gain: $gain, peak: $peak, fee: $fee, uf: $uf, payed: $payed, flag: $flag, canExtend: $canExtend, freeTrialInfo: $freeTrialInfo, level: $level, encodeType: $encodeType, channelLayout: $channelLayout, freeTrialPrivilege: $freeTrialPrivilege, freeTimeTrialPrivilege: $freeTimeTrialPrivilege, urlSource: $urlSource, rightSource: $rightSource, podcastCtrp: $podcastCtrp, effectTypes: $effectTypes, time: $time)';
  }

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  Datum copyWith({
    int? id,
    String? url,
    int? br,
    int? size,
    String? md5,
    int? code,
    int? expi,
    String? type,
    double? gain,
    int? peak,
    int? fee,
    dynamic uf,
    int? payed,
    int? flag,
    bool? canExtend,
    dynamic freeTrialInfo,
    String? level,
    String? encodeType,
    dynamic channelLayout,
    FreeTrialPrivilege? freeTrialPrivilege,
    FreeTimeTrialPrivilege? freeTimeTrialPrivilege,
    int? urlSource,
    int? rightSource,
    dynamic podcastCtrp,
    dynamic effectTypes,
    int? time,
  }) {
    return Datum(
      id: id ?? this.id,
      url: url ?? this.url,
      br: br ?? this.br,
      size: size ?? this.size,
      md5: md5 ?? this.md5,
      code: code ?? this.code,
      expi: expi ?? this.expi,
      type: type ?? this.type,
      gain: gain ?? this.gain,
      peak: peak ?? this.peak,
      fee: fee ?? this.fee,
      uf: uf ?? this.uf,
      payed: payed ?? this.payed,
      flag: flag ?? this.flag,
      canExtend: canExtend ?? this.canExtend,
      freeTrialInfo: freeTrialInfo ?? this.freeTrialInfo,
      level: level ?? this.level,
      encodeType: encodeType ?? this.encodeType,
      channelLayout: channelLayout ?? this.channelLayout,
      freeTrialPrivilege: freeTrialPrivilege ?? this.freeTrialPrivilege,
      freeTimeTrialPrivilege:
          freeTimeTrialPrivilege ?? this.freeTimeTrialPrivilege,
      urlSource: urlSource ?? this.urlSource,
      rightSource: rightSource ?? this.rightSource,
      podcastCtrp: podcastCtrp ?? this.podcastCtrp,
      effectTypes: effectTypes ?? this.effectTypes,
      time: time ?? this.time,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Datum) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      url.hashCode ^
      br.hashCode ^
      size.hashCode ^
      md5.hashCode ^
      code.hashCode ^
      expi.hashCode ^
      type.hashCode ^
      gain.hashCode ^
      peak.hashCode ^
      fee.hashCode ^
      uf.hashCode ^
      payed.hashCode ^
      flag.hashCode ^
      canExtend.hashCode ^
      freeTrialInfo.hashCode ^
      level.hashCode ^
      encodeType.hashCode ^
      channelLayout.hashCode ^
      freeTrialPrivilege.hashCode ^
      freeTimeTrialPrivilege.hashCode ^
      urlSource.hashCode ^
      rightSource.hashCode ^
      podcastCtrp.hashCode ^
      effectTypes.hashCode ^
      time.hashCode;
}
