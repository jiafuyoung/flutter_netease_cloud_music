// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'binding.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Binding _$BindingFromJson(Map<String, dynamic> json) => Binding(
      expiresIn: json['expiresIn'] as int?,
      refreshTime: json['refreshTime'] as int?,
      bindingTime: json['bindingTime'] as int?,
      tokenJsonStr: json['tokenJsonStr'],
      url: json['url'] as String?,
      expired: json['expired'] as bool?,
      userId: json['userId'] as int?,
      id: json['id'] as int?,
      type: json['type'] as int?,
    );

Map<String, dynamic> _$BindingToJson(Binding instance) => <String, dynamic>{
      'expiresIn': instance.expiresIn,
      'refreshTime': instance.refreshTime,
      'bindingTime': instance.bindingTime,
      'tokenJsonStr': instance.tokenJsonStr,
      'url': instance.url,
      'expired': instance.expired,
      'userId': instance.userId,
      'id': instance.id,
      'type': instance.type,
    };
