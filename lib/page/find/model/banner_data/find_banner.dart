import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'find_banner.g.dart';

@JsonSerializable()
class FindBanner {
  final String? imageUrl;
  final int? targetId;
  final dynamic adid;
  final int? targetType;
  final String? titleColor;
  final String? typeTitle;
  final String? url;
  final bool? exclusive;
  final dynamic monitorImpress;
  final dynamic monitorClick;
  final dynamic monitorType;
  final dynamic monitorImpressList;
  final dynamic monitorClickList;
  final dynamic monitorBlackList;
  final dynamic extMonitor;
  final dynamic extMonitorInfo;
  final dynamic adSource;
  final dynamic adLocation;
  final dynamic adDispatchJson;
  final String? encodeId;
  final dynamic program;
  final dynamic event;
  final dynamic video;
  final dynamic song;
  final String? scm;
  final String? bannerBizType;

  const FindBanner({
    this.imageUrl,
    this.targetId,
    this.adid,
    this.targetType,
    this.titleColor,
    this.typeTitle,
    this.url,
    this.exclusive,
    this.monitorImpress,
    this.monitorClick,
    this.monitorType,
    this.monitorImpressList,
    this.monitorClickList,
    this.monitorBlackList,
    this.extMonitor,
    this.extMonitorInfo,
    this.adSource,
    this.adLocation,
    this.adDispatchJson,
    this.encodeId,
    this.program,
    this.event,
    this.video,
    this.song,
    this.scm,
    this.bannerBizType,
  });

  @override
  String toString() {
    return 'Banner(imageUrl: $imageUrl, targetId: $targetId, adid: $adid, targetType: $targetType, titleColor: $titleColor, typeTitle: $typeTitle, url: $url, exclusive: $exclusive, monitorImpress: $monitorImpress, monitorClick: $monitorClick, monitorType: $monitorType, monitorImpressList: $monitorImpressList, monitorClickList: $monitorClickList, monitorBlackList: $monitorBlackList, extMonitor: $extMonitor, extMonitorInfo: $extMonitorInfo, adSource: $adSource, adLocation: $adLocation, adDispatchJson: $adDispatchJson, encodeId: $encodeId, program: $program, event: $event, video: $video, song: $song, scm: $scm, bannerBizType: $bannerBizType)';
  }

  factory FindBanner.fromJson(Map<String, dynamic> json) {
    return _$FindBannerFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FindBannerToJson(this);

  FindBanner copyWith({
    String? imageUrl,
    int? targetId,
    dynamic adid,
    int? targetType,
    String? titleColor,
    String? typeTitle,
    String? url,
    bool? exclusive,
    dynamic monitorImpress,
    dynamic monitorClick,
    dynamic monitorType,
    dynamic monitorImpressList,
    dynamic monitorClickList,
    dynamic monitorBlackList,
    dynamic extMonitor,
    dynamic extMonitorInfo,
    dynamic adSource,
    dynamic adLocation,
    dynamic adDispatchJson,
    String? encodeId,
    dynamic program,
    dynamic event,
    dynamic video,
    dynamic song,
    String? scm,
    String? bannerBizType,
  }) {
    return FindBanner(
      imageUrl: imageUrl ?? this.imageUrl,
      targetId: targetId ?? this.targetId,
      adid: adid ?? this.adid,
      targetType: targetType ?? this.targetType,
      titleColor: titleColor ?? this.titleColor,
      typeTitle: typeTitle ?? this.typeTitle,
      url: url ?? this.url,
      exclusive: exclusive ?? this.exclusive,
      monitorImpress: monitorImpress ?? this.monitorImpress,
      monitorClick: monitorClick ?? this.monitorClick,
      monitorType: monitorType ?? this.monitorType,
      monitorImpressList: monitorImpressList ?? this.monitorImpressList,
      monitorClickList: monitorClickList ?? this.monitorClickList,
      monitorBlackList: monitorBlackList ?? this.monitorBlackList,
      extMonitor: extMonitor ?? this.extMonitor,
      extMonitorInfo: extMonitorInfo ?? this.extMonitorInfo,
      adSource: adSource ?? this.adSource,
      adLocation: adLocation ?? this.adLocation,
      adDispatchJson: adDispatchJson ?? this.adDispatchJson,
      encodeId: encodeId ?? this.encodeId,
      program: program ?? this.program,
      event: event ?? this.event,
      video: video ?? this.video,
      song: song ?? this.song,
      scm: scm ?? this.scm,
      bannerBizType: bannerBizType ?? this.bannerBizType,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! FindBanner) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      imageUrl.hashCode ^
      targetId.hashCode ^
      adid.hashCode ^
      targetType.hashCode ^
      titleColor.hashCode ^
      typeTitle.hashCode ^
      url.hashCode ^
      exclusive.hashCode ^
      monitorImpress.hashCode ^
      monitorClick.hashCode ^
      monitorType.hashCode ^
      monitorImpressList.hashCode ^
      monitorClickList.hashCode ^
      monitorBlackList.hashCode ^
      extMonitor.hashCode ^
      extMonitorInfo.hashCode ^
      adSource.hashCode ^
      adLocation.hashCode ^
      adDispatchJson.hashCode ^
      encodeId.hashCode ^
      program.hashCode ^
      event.hashCode ^
      video.hashCode ^
      song.hashCode ^
      scm.hashCode ^
      bannerBizType.hashCode;
}
