// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gpt_prediction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GptPredictionImpl _$$GptPredictionImplFromJson(Map<String, dynamic> json) =>
    _$GptPredictionImpl(
      id: json['id'] as String,
      provider: json['provider'] as String,
      model: json['model'] as String,
      object: json['object'] as String,
      created: (json['created'] as num).toInt(),
      choices: (json['choices'] as List<dynamic>)
          .map((e) => Choice.fromJson(e as Map<String, dynamic>))
          .toList(),
      usage: Usage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GptPredictionImplToJson(_$GptPredictionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'provider': instance.provider,
      'model': instance.model,
      'object': instance.object,
      'created': instance.created,
      'choices': instance.choices,
      'usage': instance.usage,
    };

_$ChoiceImpl _$$ChoiceImplFromJson(Map<String, dynamic> json) => _$ChoiceImpl(
      logprobs: json['logprobs'],
      finishReason: json['finish_reason'] as String,
      nativeFinishReason: json['native_finish_reason'] as String,
      index: (json['index'] as num).toInt(),
      message: Message.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChoiceImplToJson(_$ChoiceImpl instance) =>
    <String, dynamic>{
      'logprobs': instance.logprobs,
      'finish_reason': instance.finishReason,
      'native_finish_reason': instance.nativeFinishReason,
      'index': instance.index,
      'message': instance.message,
    };

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      role: json['role'] as String,
      content: json['content'] as String,
      refusal: json['refusal'] as String?,
      reasoning: json['reasoning'] as String?,
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
      'refusal': instance.refusal,
      'reasoning': instance.reasoning,
    };

_$UsageImpl _$$UsageImplFromJson(Map<String, dynamic> json) => _$UsageImpl(
      promptTokens: (json['prompt_tokens'] as num).toInt(),
      completionTokens: (json['completion_tokens'] as num).toInt(),
      totalTokens: (json['total_tokens'] as num).toInt(),
    );

Map<String, dynamic> _$$UsageImplToJson(_$UsageImpl instance) =>
    <String, dynamic>{
      'prompt_tokens': instance.promptTokens,
      'completion_tokens': instance.completionTokens,
      'total_tokens': instance.totalTokens,
    };
