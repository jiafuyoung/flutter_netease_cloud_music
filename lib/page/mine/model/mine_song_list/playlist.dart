import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'creator.dart';

part 'playlist.g.dart';

@JsonSerializable()
class Playlist {
  List<dynamic>? subscribers;
  bool? subscribed;
  Creator? creator;
  dynamic artists;
  dynamic tracks;
  bool? top;
  dynamic updateFrequency;
  int? backgroundCoverId;
  dynamic backgroundCoverUrl;
  int? titleImage;
  dynamic titleImageUrl;
  dynamic englishTitle;
  bool? opRecommend;
  dynamic recommendInfo;
  int? subscribedCount;
  int? cloudTrackCount;
  int? userId;
  int? totalDuration;
  int? coverImgId;
  int? privacy;
  int? trackUpdateTime;
  int? trackCount;
  int? updateTime;
  String? commentThreadId;
  String? coverImgUrl;
  int? specialType;
  bool? anonimous;
  int? createTime;
  bool? highQuality;
  bool? newImported;
  int? trackNumberUpdateTime;
  int? playCount;
  int? adType;
  String? description;
  List<String>? tags;
  bool? ordered;
  int? status;
  String? name;
  int? id;
  @JsonKey(name: 'coverImgId_str')
  String? coverImgIdStr;
  dynamic sharedUsers;
  dynamic shareStatus;
  bool? copied;

  Playlist({
    this.subscribers,
    this.subscribed,
    this.creator,
    this.artists,
    this.tracks,
    this.top,
    this.updateFrequency,
    this.backgroundCoverId,
    this.backgroundCoverUrl,
    this.titleImage,
    this.titleImageUrl,
    this.englishTitle,
    this.opRecommend,
    this.recommendInfo,
    this.subscribedCount,
    this.cloudTrackCount,
    this.userId,
    this.totalDuration,
    this.coverImgId,
    this.privacy,
    this.trackUpdateTime,
    this.trackCount,
    this.updateTime,
    this.commentThreadId,
    this.coverImgUrl,
    this.specialType,
    this.anonimous,
    this.createTime,
    this.highQuality,
    this.newImported,
    this.trackNumberUpdateTime,
    this.playCount,
    this.adType,
    this.description,
    this.tags,
    this.ordered,
    this.status,
    this.name,
    this.id,
    this.coverImgIdStr,
    this.sharedUsers,
    this.shareStatus,
    this.copied,
  });

  @override
  String toString() {
    return 'Playlist(subscribers: $subscribers, subscribed: $subscribed, creator: $creator, artists: $artists, tracks: $tracks, top: $top, updateFrequency: $updateFrequency, backgroundCoverId: $backgroundCoverId, backgroundCoverUrl: $backgroundCoverUrl, titleImage: $titleImage, titleImageUrl: $titleImageUrl, englishTitle: $englishTitle, opRecommend: $opRecommend, recommendInfo: $recommendInfo, subscribedCount: $subscribedCount, cloudTrackCount: $cloudTrackCount, userId: $userId, totalDuration: $totalDuration, coverImgId: $coverImgId, privacy: $privacy, trackUpdateTime: $trackUpdateTime, trackCount: $trackCount, updateTime: $updateTime, commentThreadId: $commentThreadId, coverImgUrl: $coverImgUrl, specialType: $specialType, anonimous: $anonimous, createTime: $createTime, highQuality: $highQuality, newImported: $newImported, trackNumberUpdateTime: $trackNumberUpdateTime, playCount: $playCount, adType: $adType, description: $description, tags: $tags, ordered: $ordered, status: $status, name: $name, id: $id, coverImgIdStr: $coverImgIdStr, sharedUsers: $sharedUsers, shareStatus: $shareStatus, copied: $copied)';
  }

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return _$PlaylistFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PlaylistToJson(this);

  Playlist copyWith({
    List<dynamic>? subscribers,
    bool? subscribed,
    Creator? creator,
    dynamic artists,
    dynamic tracks,
    bool? top,
    dynamic updateFrequency,
    int? backgroundCoverId,
    dynamic backgroundCoverUrl,
    int? titleImage,
    dynamic titleImageUrl,
    dynamic englishTitle,
    bool? opRecommend,
    dynamic recommendInfo,
    int? subscribedCount,
    int? cloudTrackCount,
    int? userId,
    int? totalDuration,
    int? coverImgId,
    int? privacy,
    int? trackUpdateTime,
    int? trackCount,
    int? updateTime,
    String? commentThreadId,
    String? coverImgUrl,
    int? specialType,
    bool? anonimous,
    int? createTime,
    bool? highQuality,
    bool? newImported,
    int? trackNumberUpdateTime,
    int? playCount,
    int? adType,
    String? description,
    List<String>? tags,
    bool? ordered,
    int? status,
    String? name,
    int? id,
    String? coverImgIdStr,
    dynamic sharedUsers,
    dynamic shareStatus,
    bool? copied,
  }) {
    return Playlist(
      subscribers: subscribers ?? this.subscribers,
      subscribed: subscribed ?? this.subscribed,
      creator: creator ?? this.creator,
      artists: artists ?? this.artists,
      tracks: tracks ?? this.tracks,
      top: top ?? this.top,
      updateFrequency: updateFrequency ?? this.updateFrequency,
      backgroundCoverId: backgroundCoverId ?? this.backgroundCoverId,
      backgroundCoverUrl: backgroundCoverUrl ?? this.backgroundCoverUrl,
      titleImage: titleImage ?? this.titleImage,
      titleImageUrl: titleImageUrl ?? this.titleImageUrl,
      englishTitle: englishTitle ?? this.englishTitle,
      opRecommend: opRecommend ?? this.opRecommend,
      recommendInfo: recommendInfo ?? this.recommendInfo,
      subscribedCount: subscribedCount ?? this.subscribedCount,
      cloudTrackCount: cloudTrackCount ?? this.cloudTrackCount,
      userId: userId ?? this.userId,
      totalDuration: totalDuration ?? this.totalDuration,
      coverImgId: coverImgId ?? this.coverImgId,
      privacy: privacy ?? this.privacy,
      trackUpdateTime: trackUpdateTime ?? this.trackUpdateTime,
      trackCount: trackCount ?? this.trackCount,
      updateTime: updateTime ?? this.updateTime,
      commentThreadId: commentThreadId ?? this.commentThreadId,
      coverImgUrl: coverImgUrl ?? this.coverImgUrl,
      specialType: specialType ?? this.specialType,
      anonimous: anonimous ?? this.anonimous,
      createTime: createTime ?? this.createTime,
      highQuality: highQuality ?? this.highQuality,
      newImported: newImported ?? this.newImported,
      trackNumberUpdateTime:
          trackNumberUpdateTime ?? this.trackNumberUpdateTime,
      playCount: playCount ?? this.playCount,
      adType: adType ?? this.adType,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      ordered: ordered ?? this.ordered,
      status: status ?? this.status,
      name: name ?? this.name,
      id: id ?? this.id,
      coverImgIdStr: coverImgIdStr ?? this.coverImgIdStr,
      sharedUsers: sharedUsers ?? this.sharedUsers,
      shareStatus: shareStatus ?? this.shareStatus,
      copied: copied ?? this.copied,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Playlist) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      subscribers.hashCode ^
      subscribed.hashCode ^
      creator.hashCode ^
      artists.hashCode ^
      tracks.hashCode ^
      top.hashCode ^
      updateFrequency.hashCode ^
      backgroundCoverId.hashCode ^
      backgroundCoverUrl.hashCode ^
      titleImage.hashCode ^
      titleImageUrl.hashCode ^
      englishTitle.hashCode ^
      opRecommend.hashCode ^
      recommendInfo.hashCode ^
      subscribedCount.hashCode ^
      cloudTrackCount.hashCode ^
      userId.hashCode ^
      totalDuration.hashCode ^
      coverImgId.hashCode ^
      privacy.hashCode ^
      trackUpdateTime.hashCode ^
      trackCount.hashCode ^
      updateTime.hashCode ^
      commentThreadId.hashCode ^
      coverImgUrl.hashCode ^
      specialType.hashCode ^
      anonimous.hashCode ^
      createTime.hashCode ^
      highQuality.hashCode ^
      newImported.hashCode ^
      trackNumberUpdateTime.hashCode ^
      playCount.hashCode ^
      adType.hashCode ^
      description.hashCode ^
      tags.hashCode ^
      ordered.hashCode ^
      status.hashCode ^
      name.hashCode ^
      id.hashCode ^
      coverImgIdStr.hashCode ^
      sharedUsers.hashCode ^
      shareStatus.hashCode ^
      copied.hashCode;
}
