// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Playlist _$PlaylistFromJson(Map<String, dynamic> json) => Playlist(
      id: json['id'] as int?,
      name: json['name'] as String?,
      coverImgId: json['coverImgId'] as int?,
      coverImgUrl: json['coverImgUrl'] as String?,
      coverImgIdStr: json['coverImgId_str'] as String?,
      adType: json['adType'] as int?,
      userId: json['userId'] as int?,
      createTime: json['createTime'] as int?,
      status: json['status'] as int?,
      opRecommend: json['opRecommend'] as bool?,
      highQuality: json['highQuality'] as bool?,
      newImported: json['newImported'] as bool?,
      updateTime: json['updateTime'] as int?,
      trackCount: json['trackCount'] as int?,
      specialType: json['specialType'] as int?,
      privacy: json['privacy'] as int?,
      trackUpdateTime: json['trackUpdateTime'] as int?,
      commentThreadId: json['commentThreadId'] as String?,
      playCount: json['playCount'] as int?,
      trackNumberUpdateTime: json['trackNumberUpdateTime'] as int?,
      subscribedCount: json['subscribedCount'] as int?,
      cloudTrackCount: json['cloudTrackCount'] as int?,
      ordered: json['ordered'] as bool?,
      description: json['description'],
      tags: json['tags'] as List<dynamic>?,
      updateFrequency: json['updateFrequency'],
      backgroundCoverId: json['backgroundCoverId'] as int?,
      backgroundCoverUrl: json['backgroundCoverUrl'],
      titleImage: json['titleImage'] as int?,
      titleImageUrl: json['titleImageUrl'],
      englishTitle: json['englishTitle'],
      officialPlaylistType: json['officialPlaylistType'],
      copied: json['copied'] as bool?,
      relateResType: json['relateResType'],
      subscribers: json['subscribers'] as List<dynamic>?,
      subscribed: json['subscribed'] as bool?,
      creator: json['creator'] == null
          ? null
          : Creator.fromJson(json['creator'] as Map<String, dynamic>),
      tracks: (json['tracks'] as List<dynamic>?)
          ?.map((e) => Track.fromJson(e as Map<String, dynamic>))
          .toList(),
      videoIds: json['videoIds'],
      videos: json['videos'],
      bannedTrackIds: json['bannedTrackIds'],
      mvResourceInfos: json['mvResourceInfos'],
      shareCount: json['shareCount'] as int?,
      commentCount: json['commentCount'] as int?,
      remixVideo: json['remixVideo'],
      sharedUsers: json['sharedUsers'],
      historySharedUsers: json['historySharedUsers'],
      gradeStatus: json['gradeStatus'] as String?,
      score: json['score'],
      algTags: json['algTags'],
      trialMode: json['trialMode'] as int?,
    );

Map<String, dynamic> _$PlaylistToJson(Playlist instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coverImgId': instance.coverImgId,
      'coverImgUrl': instance.coverImgUrl,
      'coverImgId_str': instance.coverImgIdStr,
      'adType': instance.adType,
      'userId': instance.userId,
      'createTime': instance.createTime,
      'status': instance.status,
      'opRecommend': instance.opRecommend,
      'highQuality': instance.highQuality,
      'newImported': instance.newImported,
      'updateTime': instance.updateTime,
      'trackCount': instance.trackCount,
      'specialType': instance.specialType,
      'privacy': instance.privacy,
      'trackUpdateTime': instance.trackUpdateTime,
      'commentThreadId': instance.commentThreadId,
      'playCount': instance.playCount,
      'trackNumberUpdateTime': instance.trackNumberUpdateTime,
      'subscribedCount': instance.subscribedCount,
      'cloudTrackCount': instance.cloudTrackCount,
      'ordered': instance.ordered,
      'description': instance.description,
      'tags': instance.tags,
      'updateFrequency': instance.updateFrequency,
      'backgroundCoverId': instance.backgroundCoverId,
      'backgroundCoverUrl': instance.backgroundCoverUrl,
      'titleImage': instance.titleImage,
      'titleImageUrl': instance.titleImageUrl,
      'englishTitle': instance.englishTitle,
      'officialPlaylistType': instance.officialPlaylistType,
      'copied': instance.copied,
      'relateResType': instance.relateResType,
      'subscribers': instance.subscribers,
      'subscribed': instance.subscribed,
      'creator': instance.creator,
      'tracks': instance.tracks,
      'videoIds': instance.videoIds,
      'videos': instance.videos,
      'bannedTrackIds': instance.bannedTrackIds,
      'mvResourceInfos': instance.mvResourceInfos,
      'shareCount': instance.shareCount,
      'commentCount': instance.commentCount,
      'remixVideo': instance.remixVideo,
      'sharedUsers': instance.sharedUsers,
      'historySharedUsers': instance.historySharedUsers,
      'gradeStatus': instance.gradeStatus,
      'score': instance.score,
      'algTags': instance.algTags,
      'trialMode': instance.trialMode,
    };
