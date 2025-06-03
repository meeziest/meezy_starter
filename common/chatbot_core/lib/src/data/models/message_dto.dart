// To generate all nessessary methods (deep copy, fromJson, etc.)
import 'package:freezed_annotation/freezed_annotation.dart';

import 'content_dto.dart';

part 'message_dto.freezed.dart';

// To generate toJson method for server communication
part 'message_dto.g.dart';

///This is dummy DTO for demonstration purposes
@freezed
class MessageDto with _$MessageDto {
  const factory MessageDto({
    required String id,
    required ContentDto content,
    @JsonKey(name: 'created_at') required String createdAt,
    required String role,
  }) = _MessageDto;

  factory MessageDto.fromJson(Map<String, dynamic> json) => _$MessageDtoFromJson(json);
}
