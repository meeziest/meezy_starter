// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContentDtoImpl _$$ContentDtoImplFromJson(Map<String, dynamic> json) =>
    _$ContentDtoImpl(
      text: json['text'] as String?,
      files: (json['files'] as List<dynamic>)
          .map((e) => FileContentDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ContentDtoImplToJson(_$ContentDtoImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'files': instance.files,
    };
