import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'ip_location.dart';
import 'user.dart';

part 'be_replied.g.dart';

@JsonSerializable()
class BeReplied {
  User? user;
  int? beRepliedCommentId;
  String? content;
  dynamic richContent;
  int? status;
  dynamic expressionUrl;
  IpLocation? ipLocation;

  BeReplied({
    this.user,
    this.beRepliedCommentId,
    this.content,
    this.richContent,
    this.status,
    this.expressionUrl,
    this.ipLocation,
  });

  @override
  String toString() {
    return 'BeReplied(user: $user, beRepliedCommentId: $beRepliedCommentId, content: $content, richContent: $richContent, status: $status, expressionUrl: $expressionUrl, ipLocation: $ipLocation)';
  }

  factory BeReplied.fromJson(Map<String, dynamic> json) {
    return _$BeRepliedFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BeRepliedToJson(this);

  BeReplied copyWith({
    User? user,
    int? beRepliedCommentId,
    String? content,
    dynamic richContent,
    int? status,
    dynamic expressionUrl,
    IpLocation? ipLocation,
  }) {
    return BeReplied(
      user: user ?? this.user,
      beRepliedCommentId: beRepliedCommentId ?? this.beRepliedCommentId,
      content: content ?? this.content,
      richContent: richContent ?? this.richContent,
      status: status ?? this.status,
      expressionUrl: expressionUrl ?? this.expressionUrl,
      ipLocation: ipLocation ?? this.ipLocation,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! BeReplied) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      user.hashCode ^
      beRepliedCommentId.hashCode ^
      content.hashCode ^
      richContent.hashCode ^
      status.hashCode ^
      expressionUrl.hashCode ^
      ipLocation.hashCode;
}
