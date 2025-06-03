// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_content_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FileContentDtoImpl _$$FileContentDtoImplFromJson(Map<String, dynamic> json) =>
    _$FileContentDtoImpl(
      fileId: json['file_id'] as String,
      fileType: json['file_type'] as String,
      fileName: json['file_name'] as String?,
      base64: json['base64'] as String?,
    );

Map<String, dynamic> _$$FileContentDtoImplToJson(
        _$FileContentDtoImpl instance) =>
    <String, dynamic>{
      'file_id': instance.fileId,
      'file_type': instance.fileType,
      'file_name': instance.fileName,
      'base64': instance.base64,
    };
