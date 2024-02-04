import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'be_replied.dart';
import 'ip_location.dart';
import 'user.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  User? user;
  List<BeReplied>? beReplied;
  dynamic pendantData;
  dynamic showFloorComment;
  int? status;
  int? commentId;
  String? content;
  dynamic richContent;
  dynamic contentResource;
  int? time;
  String? timeStr;
  bool? needDisplayTime;
  int? likedCount;
  dynamic expressionUrl;
  int? commentLocationType;
  int? parentCommentId;
  dynamic repliedMark;
  dynamic grade;
  dynamic userBizLevels;
  IpLocation? ipLocation;
  bool? owner;
  bool? liked;

  Comment({
    this.user,
    this.beReplied,
    this.pendantData,
    this.showFloorComment,
    this.status,
    this.commentId,
    this.content,
    this.richContent,
    this.contentResource,
    this.time,
    this.timeStr,
    this.needDisplayTime,
    this.likedCount,
    this.expressionUrl,
    this.commentLocationType,
    this.parentCommentId,
    this.repliedMark,
    this.grade,
    this.userBizLevels,
    this.ipLocation,
    this.owner,
    this.liked,
  });

  @override
  String toString() {
    return 'Comment(user: $user, beReplied: $beReplied, pendantData: $pendantData, showFloorComment: $showFloorComment, status: $status, commentId: $commentId, content: $content, richContent: $richContent, contentResource: $contentResource, time: $time, timeStr: $timeStr, needDisplayTime: $needDisplayTime, likedCount: $likedCount, expressionUrl: $expressionUrl, commentLocationType: $commentLocationType, parentCommentId: $parentCommentId, repliedMark: $repliedMark, grade: $grade, userBizLevels: $userBizLevels, ipLocation: $ipLocation, owner: $owner, liked: $liked)';
  }

  factory Comment.fromJson(Map<String, dynamic> json) {
    return _$CommentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CommentToJson(this);

  Comment copyWith({
    User? user,
    List<BeReplied>? beReplied,
    dynamic pendantData,
    dynamic showFloorComment,
    int? status,
    int? commentId,
    String? content,
    dynamic richContent,
    dynamic contentResource,
    int? time,
    String? timeStr,
    bool? needDisplayTime,
    int? likedCount,
    dynamic expressionUrl,
    int? commentLocationType,
    int? parentCommentId,
    dynamic repliedMark,
    dynamic grade,
    dynamic userBizLevels,
    IpLocation? ipLocation,
    bool? owner,
    bool? liked,
  }) {
    return Comment(
      user: user ?? this.user,
      beReplied: beReplied ?? this.beReplied,
      pendantData: pendantData ?? this.pendantData,
      showFloorComment: showFloorComment ?? this.showFloorComment,
      status: status ?? this.status,
      commentId: commentId ?? this.commentId,
      content: content ?? this.content,
      richContent: richContent ?? this.richContent,
      contentResource: contentResource ?? this.contentResource,
      time: time ?? this.time,
      timeStr: timeStr ?? this.timeStr,
      needDisplayTime: needDisplayTime ?? this.needDisplayTime,
      likedCount: likedCount ?? this.likedCount,
      expressionUrl: expressionUrl ?? this.expressionUrl,
      commentLocationType: commentLocationType ?? this.commentLocationType,
      parentCommentId: parentCommentId ?? this.parentCommentId,
      repliedMark: repliedMark ?? this.repliedMark,
      grade: grade ?? this.grade,
      userBizLevels: userBizLevels ?? this.userBizLevels,
      ipLocation: ipLocation ?? this.ipLocation,
      owner: owner ?? this.owner,
      liked: liked ?? this.liked,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Comment) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      user.hashCode ^
      beReplied.hashCode ^
      pendantData.hashCode ^
      showFloorComment.hashCode ^
      status.hashCode ^
      commentId.hashCode ^
      content.hashCode ^
      richContent.hashCode ^
      contentResource.hashCode ^
      time.hashCode ^
      timeStr.hashCode ^
      needDisplayTime.hashCode ^
      likedCount.hashCode ^
      expressionUrl.hashCode ^
      commentLocationType.hashCode ^
      parentCommentId.hashCode ^
      repliedMark.hashCode ^
      grade.hashCode ^
      userBizLevels.hashCode ^
      ipLocation.hashCode ^
      owner.hashCode ^
      liked.hashCode;
}
