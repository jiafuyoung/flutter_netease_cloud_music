// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ip_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IpLocation _$IpLocationFromJson(Map<String, dynamic> json) => IpLocation(
      ip: json['ip'],
      location: json['location'] as String?,
      userId: json['userId'],
    );

Map<String, dynamic> _$IpLocationToJson(IpLocation instance) =>
    <String, dynamic>{
      'ip': instance.ip,
      'location': instance.location,
      'userId': instance.userId,
    };
