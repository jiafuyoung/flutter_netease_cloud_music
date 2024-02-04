import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'comment.dart';
import 'hot_comment.dart';

part 'common_data.g.dart';

@JsonSerializable()
class CommonData {
  bool? isMusician;
  int? cnum;
  int? userId;
  List<dynamic>? topComments;
  bool? moreHot;
  List<HotComment>? hotComments;
  dynamic commentBanner;
  int? code;
  List<Comment>? comments;
  int? total;
  bool? more;

  CommonData({
    this.isMusician,
    this.cnum,
    this.userId,
    this.topComments,
    this.moreHot,
    this.hotComments,
    this.commentBanner,
    this.code,
    this.comments,
    this.total,
    this.more,
  });

  @override
  String toString() {
    return 'CommonData(isMusician: $isMusician, cnum: $cnum, userId: $userId, topComments: $topComments, moreHot: $moreHot, hotComments: $hotComments, commentBanner: $commentBanner, code: $code, comments: $comments, total: $total, more: $more)';
  }

  factory CommonData.fromJson(Map<String, dynamic> json) {
    return _$CommonDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CommonDataToJson(this);

  CommonData copyWith({
    bool? isMusician,
    int? cnum,
    int? userId,
    List<dynamic>? topComments,
    bool? moreHot,
    List<HotComment>? hotComments,
    dynamic commentBanner,
    int? code,
    List<Comment>? comments,
    int? total,
    bool? more,
  }) {
    return CommonData(
      isMusician: isMusician ?? this.isMusician,
      cnum: cnum ?? this.cnum,
      userId: userId ?? this.userId,
      topComments: topComments ?? this.topComments,
      moreHot: moreHot ?? this.moreHot,
      hotComments: hotComments ?? this.hotComments,
      commentBanner: commentBanner ?? this.commentBanner,
      code: code ?? this.code,
      comments: comments ?? this.comments,
      total: total ?? this.total,
      more: more ?? this.more,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! CommonData) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      isMusician.hashCode ^
      cnum.hashCode ^
      userId.hashCode ^
      topComments.hashCode ^
      moreHot.hashCode ^
      hotComments.hashCode ^
      commentBanner.hashCode ^
      code.hashCode ^
      comments.hashCode ^
      total.hashCode ^
      more.hashCode;
}
