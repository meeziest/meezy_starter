import 'package:freezed_annotation/freezed_annotation.dart';

part 'prompt.freezed.dart';
part 'prompt.g.dart';

@freezed
class Prompt with _$Prompt {
  const factory Prompt({
    required String model,
    required List<ChatMessage> messages,
    required double temperature,
    required int maxTokens,
    int? seed,
    double? topP,
    double? topK,
    double? presencePenalty,
    double? frequencyPenalty,
    double? repetitionPenalty,
    int? topLogprobs,
    double? minP,
    double? topA,
    List<String>? transforms,
    List<String>? models,
    Reasoning? reasoning,
  }) = _Prompt;

  factory Prompt.fromJson(Map<String, dynamic> json) => _$PromptFromJson(json);
}

@freezed
class ChatMessage with _$ChatMessage {
  const factory ChatMessage({required Role role, required String content}) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);
}

@JsonEnum(alwaysCreate: true)
enum Role { system, developer, user, assistant, tool }

@JsonEnum(alwaysCreate: true)
enum Effort { low, medium, high }

@freezed
class Reasoning with _$Reasoning {
  const factory Reasoning({required Effort effort, required bool exclude, required int maxTokens}) = _Reasoning;

  factory Reasoning.fromJson(Map<String, dynamic> json) => _$ReasoningFromJson(json);
}
