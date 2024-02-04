import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'find_banner.dart';

part 'banner_data.g.dart';

@JsonSerializable()
class BannerData {
  final List<FindBanner>? banners;
  final int? code;

  const BannerData({this.banners, this.code});

  @override
  String toString() => 'BannerData(banners: $banners, code: $code)';

  factory BannerData.fromJson(Map<String, dynamic> json) {
    return _$BannerDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BannerDataToJson(this);

  BannerData copyWith({
    List<FindBanner>? banners,
    int? code,
  }) {
    return BannerData(
      banners: banners ?? this.banners,
      code: code ?? this.code,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! BannerData) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => banners.hashCode ^ code.hashCode;
}
