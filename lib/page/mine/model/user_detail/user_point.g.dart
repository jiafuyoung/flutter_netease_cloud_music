// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPoint _$UserPointFromJson(Map<String, dynamic> json) => UserPoint(
      userId: json['userId'] as int?,
      balance: json['balance'] as int?,
      updateTime: json['updateTime'] as int?,
      version: json['version'] as int?,
      status: json['status'] as int?,
      blockBalance: json['blockBalance'] as int?,
    );

Map<String, dynamic> _$UserPointToJson(UserPoint instance) => <String, dynamic>{
      'userId': instance.userId,
      'balance': instance.balance,
      'updateTime': instance.updateTime,
      'version': instance.version,
      'status': instance.status,
      'blockBalance': instance.blockBalance,
    };
