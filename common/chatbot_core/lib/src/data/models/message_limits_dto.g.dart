// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_limits_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageDtoImpl _$$MessageDtoImplFromJson(Map<String, dynamic> json) =>
    _$MessageDtoImpl(
      remainingMessages: (json['remaining_messages'] as num).toInt(),
      renewTime: json['renew_time'] == null
          ? null
          : DateTime.parse(json['renew_time'] as String),
    );

Map<String, dynamic> _$$MessageDtoImplToJson(_$MessageDtoImpl instance) =>
    <String, dynamic>{
      'remaining_messages': instance.remainingMessages,
      'renew_time': instance.renewTime?.toIso8601String(),
    };
