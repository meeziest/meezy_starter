// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prompt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromptImpl _$$PromptImplFromJson(Map<String, dynamic> json) => _$PromptImpl(
      model: json['model'] as String,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      temperature: (json['temperature'] as num).toDouble(),
      maxTokens: (json['maxTokens'] as num).toInt(),
      seed: (json['seed'] as num?)?.toInt(),
      topP: (json['topP'] as num?)?.toDouble(),
      topK: (json['topK'] as num?)?.toDouble(),
      presencePenalty: (json['presencePenalty'] as num?)?.toDouble(),
      frequencyPenalty: (json['frequencyPenalty'] as num?)?.toDouble(),
      repetitionPenalty: (json['repetitionPenalty'] as num?)?.toDouble(),
      topLogprobs: (json['topLogprobs'] as num?)?.toInt(),
      minP: (json['minP'] as num?)?.toDouble(),
      topA: (json['topA'] as num?)?.toDouble(),
      transforms: (json['transforms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      models:
          (json['models'] as List<dynamic>?)?.map((e) => e as String).toList(),
      reasoning: json['reasoning'] == null
          ? null
          : Reasoning.fromJson(json['reasoning'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PromptImplToJson(_$PromptImpl instance) =>
    <String, dynamic>{
      'model': instance.model,
      'messages': instance.messages,
      'temperature': instance.temperature,
      'maxTokens': instance.maxTokens,
      'seed': instance.seed,
      'topP': instance.topP,
      'topK': instance.topK,
      'presencePenalty': instance.presencePenalty,
      'frequencyPenalty': instance.frequencyPenalty,
      'repetitionPenalty': instance.repetitionPenalty,
      'topLogprobs': instance.topLogprobs,
      'minP': instance.minP,
      'topA': instance.topA,
      'transforms': instance.transforms,
      'models': instance.models,
      'reasoning': instance.reasoning,
    };

_$ChatMessageImpl _$$ChatMessageImplFromJson(Map<String, dynamic> json) =>
    _$ChatMessageImpl(
      role: $enumDecode(_$RoleEnumMap, json['role']),
      content: json['content'] as String,
    );

Map<String, dynamic> _$$ChatMessageImplToJson(_$ChatMessageImpl instance) =>
    <String, dynamic>{
      'role': _$RoleEnumMap[instance.role]!,
      'content': instance.content,
    };

const _$RoleEnumMap = {
  Role.system: 'system',
  Role.developer: 'developer',
  Role.user: 'user',
  Role.assistant: 'assistant',
  Role.tool: 'tool',
};

_$ReasoningImpl _$$ReasoningImplFromJson(Map<String, dynamic> json) =>
    _$ReasoningImpl(
      effort: $enumDecode(_$EffortEnumMap, json['effort']),
      exclude: json['exclude'] as bool,
      maxTokens: (json['maxTokens'] as num).toInt(),
    );

Map<String, dynamic> _$$ReasoningImplToJson(_$ReasoningImpl instance) =>
    <String, dynamic>{
      'effort': _$EffortEnumMap[instance.effort]!,
      'exclude': instance.exclude,
      'maxTokens': instance.maxTokens,
    };

const _$EffortEnumMap = {
  Effort.low: 'low',
  Effort.medium: 'medium',
  Effort.high: 'high',
};
