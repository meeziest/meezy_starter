// To generate all nessessary methods (deep copy, fromJson, etc.)
import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_content_dto.freezed.dart';
// To generate toJson method for server communication
part 'file_content_dto.g.dart';

///This is dummy DTO for demonstration purposes
@freezed
class FileContentDto with _$FileContentDto {
  const factory FileContentDto({
    @JsonKey(name: 'file_id') required String fileId,
    @JsonKey(name: 'file_type') required String fileType,
    @JsonKey(name: 'file_name') String? fileName,
    String? base64,
  }) = _FileContentDto;

  factory FileContentDto.fromJson(Map<String, dynamic> json) =>
      _$FileContentDtoFromJson(json);
}
