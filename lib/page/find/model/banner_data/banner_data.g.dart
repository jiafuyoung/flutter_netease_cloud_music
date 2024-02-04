// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerData _$BannerDataFromJson(Map<String, dynamic> json) => BannerData(
      banners: (json['banners'] as List<dynamic>?)
          ?.map((e) => FindBanner.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['code'] as int?,
    );

Map<String, dynamic> _$BannerDataToJson(BannerData instance) =>
    <String, dynamic>{
      'banners': instance.banners,
      'code': instance.code,
    };
