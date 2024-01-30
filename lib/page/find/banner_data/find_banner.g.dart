// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FindBanner _$BannerFromJson(Map<String, dynamic> json) => FindBanner(
      imageUrl: json['imageUrl'] as String?,
      targetId: json['targetId'] as int?,
      adid: json['adid'],
      targetType: json['targetType'] as int?,
      titleColor: json['titleColor'] as String?,
      typeTitle: json['typeTitle'] as String?,
      url: json['url'] as String?,
      exclusive: json['exclusive'] as bool?,
      monitorImpress: json['monitorImpress'],
      monitorClick: json['monitorClick'],
      monitorType: json['monitorType'],
      monitorImpressList: json['monitorImpressList'],
      monitorClickList: json['monitorClickList'],
      monitorBlackList: json['monitorBlackList'],
      extMonitor: json['extMonitor'],
      extMonitorInfo: json['extMonitorInfo'],
      adSource: json['adSource'],
      adLocation: json['adLocation'],
      adDispatchJson: json['adDispatchJson'],
      encodeId: json['encodeId'] as String?,
      program: json['program'],
      event: json['event'],
      video: json['video'],
      song: json['song'],
      scm: json['scm'] as String?,
      bannerBizType: json['bannerBizType'] as String?,
    );

Map<String, dynamic> _$BannerToJson(FindBanner instance) => <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'targetId': instance.targetId,
      'adid': instance.adid,
      'targetType': instance.targetType,
      'titleColor': instance.titleColor,
      'typeTitle': instance.typeTitle,
      'url': instance.url,
      'exclusive': instance.exclusive,
      'monitorImpress': instance.monitorImpress,
      'monitorClick': instance.monitorClick,
      'monitorType': instance.monitorType,
      'monitorImpressList': instance.monitorImpressList,
      'monitorClickList': instance.monitorClickList,
      'monitorBlackList': instance.monitorBlackList,
      'extMonitor': instance.extMonitor,
      'extMonitorInfo': instance.extMonitorInfo,
      'adSource': instance.adSource,
      'adLocation': instance.adLocation,
      'adDispatchJson': instance.adDispatchJson,
      'encodeId': instance.encodeId,
      'program': instance.program,
      'event': instance.event,
      'video': instance.video,
      'song': instance.song,
      'scm': instance.scm,
      'bannerBizType': instance.bannerBizType,
    };
