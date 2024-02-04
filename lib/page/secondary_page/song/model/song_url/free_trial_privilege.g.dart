// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'free_trial_privilege.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FreeTrialPrivilege _$FreeTrialPrivilegeFromJson(Map<String, dynamic> json) =>
    FreeTrialPrivilege(
      resConsumable: json['resConsumable'] as bool?,
      userConsumable: json['userConsumable'] as bool?,
      listenType: json['listenType'],
      cannotListenReason: json['cannotListenReason'],
      playReason: json['playReason'],
    );

Map<String, dynamic> _$FreeTrialPrivilegeToJson(FreeTrialPrivilege instance) =>
    <String, dynamic>{
      'resConsumable': instance.resConsumable,
      'userConsumable': instance.userConsumable,
      'listenType': instance.listenType,
      'cannotListenReason': instance.cannotListenReason,
      'playReason': instance.playReason,
    };
