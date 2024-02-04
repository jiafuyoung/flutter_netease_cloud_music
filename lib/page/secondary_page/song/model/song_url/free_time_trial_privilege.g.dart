// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'free_time_trial_privilege.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FreeTimeTrialPrivilege _$FreeTimeTrialPrivilegeFromJson(
        Map<String, dynamic> json) =>
    FreeTimeTrialPrivilege(
      resConsumable: json['resConsumable'] as bool?,
      userConsumable: json['userConsumable'] as bool?,
      type: json['type'] as int?,
      remainTime: json['remainTime'] as int?,
    );

Map<String, dynamic> _$FreeTimeTrialPrivilegeToJson(
        FreeTimeTrialPrivilege instance) =>
    <String, dynamic>{
      'resConsumable': instance.resConsumable,
      'userConsumable': instance.userConsumable,
      'type': instance.type,
      'remainTime': instance.remainTime,
    };
