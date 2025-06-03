import 'package:freezed_annotation/freezed_annotation.dart';

part 'gpt_prediction.freezed.dart';
part 'gpt_prediction.g.dart';

@freezed
class GptPrediction with _$GptPrediction {
  const factory GptPrediction({
    required String id,
    required String provider,
    required String model,
    required String object,
    required int created,
    required List<Choice> choices,
    required Usage usage,
  }) = _GptPrediction;

  factory GptPrediction.fromJson(Map<String, dynamic> json) => _$GptPredictionFromJson(json);
}

@freezed
class Choice with _$Choice {
  const factory Choice({
    required dynamic logprobs,
    @JsonKey(name: 'finish_reason') required String finishReason,
    @JsonKey(name: 'native_finish_reason') required String nativeFinishReason,
    required int index,
    required Message message,
  }) = _Choice;

  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);
}

@freezed
class Message with _$Message {
  const factory Message({
    required String role,
    required String content,
    required String? refusal,
    required String? reasoning,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}

@freezed
class Usage with _$Usage {
  const factory Usage({
    @JsonKey(name: 'prompt_tokens') required int promptTokens,
    @JsonKey(name: 'completion_tokens') required int completionTokens,
    @JsonKey(name: 'total_tokens') required int totalTokens,
  }) = _Usage;

  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);
}
