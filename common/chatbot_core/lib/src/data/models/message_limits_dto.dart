import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_limits_dto.freezed.dart';

part 'message_limits_dto.g.dart';

@freezed
class MessageLimitsDto with _$MessageLimitsDto {
  const factory MessageLimitsDto({
    @JsonKey(name: 'remaining_messages') required int remainingMessages,
    @JsonKey(name: 'renew_time') DateTime? renewTime,
  }) = _MessageDto;

  factory MessageLimitsDto.fromJson(Map<String, dynamic> json) => _$MessageLimitsDtoFromJson(json);
}
