// To generate all nessessary methods (deep copy, fromJson, etc.)
import 'package:freezed_annotation/freezed_annotation.dart';

import 'file_content_dto.dart';

part 'content_dto.freezed.dart';

// To generate toJson method for server communication
part 'content_dto.g.dart';

///This is dummy DTO for demonstration purposes
@freezed
class ContentDto with _$ContentDto {
  const factory ContentDto({
    required String? text,
    required List<FileContentDto> files,
  }) = _ContentDto;

  factory ContentDto.fromJson(Map<String, dynamic> json) => _$ContentDtoFromJson(json);
}
