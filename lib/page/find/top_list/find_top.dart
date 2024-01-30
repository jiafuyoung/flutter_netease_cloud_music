import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'find_top.g.dart';

@JsonSerializable()
class FindTop {
  List<dynamic>? subscribers;
  dynamic subscribed;
  dynamic creator;
  dynamic artists;
  dynamic tracks;
  String? updateFrequency;
  int? backgroundCoverId;
  dynamic backgroundCoverUrl;
  int? titleImage;
  dynamic coverText;
  dynamic titleImageUrl;
  dynamic coverImageUrl;
  dynamic iconImageUrl;
  dynamic englishTitle;
  bool? opRecommend;
  dynamic recommendInfo;
  dynamic socialPlaylistCover;
  int? tsSongCount;
  int? adType;
  int? trackNumberUpdateTime;
  int? subscribedCount;
  int? cloudTrackCount;
  int? trackUpdateTime;
  int? playCount;
  int? updateTime;
  int? specialType;
  int? coverImgId;
  bool? anonimous;
  int? trackCount;
  String? commentThreadId;
  int? privacy;
  bool? newImported;
  int? totalDuration;
  String? coverImgUrl;
  bool? highQuality;
  int? createTime;
  bool? ordered;
  String? description;
  int? status;
  List<dynamic>? tags;
  int? userId;
  String? name;
  int? id;
  @JsonKey(name: 'coverImgId_str')
  String? coverImgIdStr;
  @JsonKey(name: 'ToplistType')
  String? toplistType;

  FindTop({
    this.subscribers,
    this.subscribed,
    this.creator,
    this.artists,
    this.tracks,
    this.updateFrequency,
    this.backgroundCoverId,
    this.backgroundCoverUrl,
    this.titleImage,
    this.coverText,
    this.titleImageUrl,
    this.coverImageUrl,
    this.iconImageUrl,
    this.englishTitle,
    this.opRecommend,
    this.recommendInfo,
    this.socialPlaylistCover,
    this.tsSongCount,
    this.adType,
    this.trackNumberUpdateTime,
    this.subscribedCount,
    this.cloudTrackCount,
    this.trackUpdateTime,
    this.playCount,
    this.updateTime,
    this.specialType,
    this.coverImgId,
    this.anonimous,
    this.trackCount,
    this.commentThreadId,
    this.privacy,
    this.newImported,
    this.totalDuration,
    this.coverImgUrl,
    this.highQuality,
    this.createTime,
    this.ordered,
    this.description,
    this.status,
    this.tags,
    this.userId,
    this.name,
    this.id,
    this.coverImgIdStr,
    this.toplistType,
  });

  @override
  String toString() {
    return 'List(subscribers: $subscribers, subscribed: $subscribed, creator: $creator, artists: $artists, tracks: $tracks, updateFrequency: $updateFrequency, backgroundCoverId: $backgroundCoverId, backgroundCoverUrl: $backgroundCoverUrl, titleImage: $titleImage, coverText: $coverText, titleImageUrl: $titleImageUrl, coverImageUrl: $coverImageUrl, iconImageUrl: $iconImageUrl, englishTitle: $englishTitle, opRecommend: $opRecommend, recommendInfo: $recommendInfo, socialPlaylistCover: $socialPlaylistCover, tsSongCount: $tsSongCount, adType: $adType, trackNumberUpdateTime: $trackNumberUpdateTime, subscribedCount: $subscribedCount, cloudTrackCount: $cloudTrackCount, trackUpdateTime: $trackUpdateTime, playCount: $playCount, updateTime: $updateTime, specialType: $specialType, coverImgId: $coverImgId, anonimous: $anonimous, trackCount: $trackCount, commentThreadId: $commentThreadId, privacy: $privacy, newImported: $newImported, totalDuration: $totalDuration, coverImgUrl: $coverImgUrl, highQuality: $highQuality, createTime: $createTime, ordered: $ordered, description: $description, status: $status, tags: $tags, userId: $userId, name: $name, id: $id, coverImgIdStr: $coverImgIdStr, toplistType: $toplistType)';
  }

  factory FindTop.fromJson(Map<String, dynamic> json) =>
      _$FindTopFromJson(json);

  Map<String, dynamic> toJson() => _$FindTopToJson(this);

  FindTop copyWith({
    List<dynamic>? subscribers,
    dynamic subscribed,
    dynamic creator,
    dynamic artists,
    dynamic tracks,
    String? updateFrequency,
    int? backgroundCoverId,
    dynamic backgroundCoverUrl,
    int? titleImage,
    dynamic coverText,
    dynamic titleImageUrl,
    dynamic coverImageUrl,
    dynamic iconImageUrl,
    dynamic englishTitle,
    bool? opRecommend,
    dynamic recommendInfo,
    dynamic socialPlaylistCover,
    int? tsSongCount,
    int? adType,
    int? trackNumberUpdateTime,
    int? subscribedCount,
    int? cloudTrackCount,
    int? trackUpdateTime,
    int? playCount,
    int? updateTime,
    int? specialType,
    int? coverImgId,
    bool? anonimous,
    int? trackCount,
    String? commentThreadId,
    int? privacy,
    bool? newImported,
    int? totalDuration,
    String? coverImgUrl,
    bool? highQuality,
    int? createTime,
    bool? ordered,
    String? description,
    int? status,
    List<dynamic>? tags,
    int? userId,
    String? name,
    int? id,
    String? coverImgIdStr,
    String? toplistType,
  }) {
    return FindTop(
      subscribers: subscribers ?? this.subscribers,
      subscribed: subscribed ?? this.subscribed,
      creator: creator ?? this.creator,
      artists: artists ?? this.artists,
      tracks: tracks ?? this.tracks,
      updateFrequency: updateFrequency ?? this.updateFrequency,
      backgroundCoverId: backgroundCoverId ?? this.backgroundCoverId,
      backgroundCoverUrl: backgroundCoverUrl ?? this.backgroundCoverUrl,
      titleImage: titleImage ?? this.titleImage,
      coverText: coverText ?? this.coverText,
      titleImageUrl: titleImageUrl ?? this.titleImageUrl,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      iconImageUrl: iconImageUrl ?? this.iconImageUrl,
      englishTitle: englishTitle ?? this.englishTitle,
      opRecommend: opRecommend ?? this.opRecommend,
      recommendInfo: recommendInfo ?? this.recommendInfo,
      socialPlaylistCover: socialPlaylistCover ?? this.socialPlaylistCover,
      tsSongCount: tsSongCount ?? this.tsSongCount,
      adType: adType ?? this.adType,
      trackNumberUpdateTime:
          trackNumberUpdateTime ?? this.trackNumberUpdateTime,
      subscribedCount: subscribedCount ?? this.subscribedCount,
      cloudTrackCount: cloudTrackCount ?? this.cloudTrackCount,
      trackUpdateTime: trackUpdateTime ?? this.trackUpdateTime,
      playCount: playCount ?? this.playCount,
      updateTime: updateTime ?? this.updateTime,
      specialType: specialType ?? this.specialType,
      coverImgId: coverImgId ?? this.coverImgId,
      anonimous: anonimous ?? this.anonimous,
      trackCount: trackCount ?? this.trackCount,
      commentThreadId: commentThreadId ?? this.commentThreadId,
      privacy: privacy ?? this.privacy,
      newImported: newImported ?? this.newImported,
      totalDuration: totalDuration ?? this.totalDuration,
      coverImgUrl: coverImgUrl ?? this.coverImgUrl,
      highQuality: highQuality ?? this.highQuality,
      createTime: createTime ?? this.createTime,
      ordered: ordered ?? this.ordered,
      description: description ?? this.description,
      status: status ?? this.status,
      tags: tags ?? this.tags,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      id: id ?? this.id,
      coverImgIdStr: coverImgIdStr ?? this.coverImgIdStr,
      toplistType: toplistType ?? this.toplistType,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! FindTop) return false;
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
      updateFrequency.hashCode ^
      backgroundCoverId.hashCode ^
      backgroundCoverUrl.hashCode ^
      titleImage.hashCode ^
      coverText.hashCode ^
      titleImageUrl.hashCode ^
      coverImageUrl.hashCode ^
      iconImageUrl.hashCode ^
      englishTitle.hashCode ^
      opRecommend.hashCode ^
      recommendInfo.hashCode ^
      socialPlaylistCover.hashCode ^
      tsSongCount.hashCode ^
      adType.hashCode ^
      trackNumberUpdateTime.hashCode ^
      subscribedCount.hashCode ^
      cloudTrackCount.hashCode ^
      trackUpdateTime.hashCode ^
      playCount.hashCode ^
      updateTime.hashCode ^
      specialType.hashCode ^
      coverImgId.hashCode ^
      anonimous.hashCode ^
      trackCount.hashCode ^
      commentThreadId.hashCode ^
      privacy.hashCode ^
      newImported.hashCode ^
      totalDuration.hashCode ^
      coverImgUrl.hashCode ^
      highQuality.hashCode ^
      createTime.hashCode ^
      ordered.hashCode ^
      description.hashCode ^
      status.hashCode ^
      tags.hashCode ^
      userId.hashCode ^
      name.hashCode ^
      id.hashCode ^
      coverImgIdStr.hashCode ^
      toplistType.hashCode;
}
