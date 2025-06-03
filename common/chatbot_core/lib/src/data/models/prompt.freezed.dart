// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prompt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Prompt _$PromptFromJson(Map<String, dynamic> json) {
  return _Prompt.fromJson(json);
}

/// @nodoc
mixin _$Prompt {
  String get model => throw _privateConstructorUsedError;
  List<ChatMessage> get messages => throw _privateConstructorUsedError;
  double get temperature => throw _privateConstructorUsedError;
  int get maxTokens => throw _privateConstructorUsedError;
  int? get seed => throw _privateConstructorUsedError;
  double? get topP => throw _privateConstructorUsedError;
  double? get topK => throw _privateConstructorUsedError;
  double? get presencePenalty => throw _privateConstructorUsedError;
  double? get frequencyPenalty => throw _privateConstructorUsedError;
  double? get repetitionPenalty => throw _privateConstructorUsedError;
  int? get topLogprobs => throw _privateConstructorUsedError;
  double? get minP => throw _privateConstructorUsedError;
  double? get topA => throw _privateConstructorUsedError;
  List<String>? get transforms => throw _privateConstructorUsedError;
  List<String>? get models => throw _privateConstructorUsedError;
  Reasoning? get reasoning => throw _privateConstructorUsedError;

  /// Serializes this Prompt to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Prompt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromptCopyWith<Prompt> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromptCopyWith<$Res> {
  factory $PromptCopyWith(Prompt value, $Res Function(Prompt) then) =
      _$PromptCopyWithImpl<$Res, Prompt>;
  @useResult
  $Res call(
      {String model,
      List<ChatMessage> messages,
      double temperature,
      int maxTokens,
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
      Reasoning? reasoning});

  $ReasoningCopyWith<$Res>? get reasoning;
}

/// @nodoc
class _$PromptCopyWithImpl<$Res, $Val extends Prompt>
    implements $PromptCopyWith<$Res> {
  _$PromptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Prompt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? messages = null,
    Object? temperature = null,
    Object? maxTokens = null,
    Object? seed = freezed,
    Object? topP = freezed,
    Object? topK = freezed,
    Object? presencePenalty = freezed,
    Object? frequencyPenalty = freezed,
    Object? repetitionPenalty = freezed,
    Object? topLogprobs = freezed,
    Object? minP = freezed,
    Object? topA = freezed,
    Object? transforms = freezed,
    Object? models = freezed,
    Object? reasoning = freezed,
  }) {
    return _then(_value.copyWith(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      maxTokens: null == maxTokens
          ? _value.maxTokens
          : maxTokens // ignore: cast_nullable_to_non_nullable
              as int,
      seed: freezed == seed
          ? _value.seed
          : seed // ignore: cast_nullable_to_non_nullable
              as int?,
      topP: freezed == topP
          ? _value.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double?,
      topK: freezed == topK
          ? _value.topK
          : topK // ignore: cast_nullable_to_non_nullable
              as double?,
      presencePenalty: freezed == presencePenalty
          ? _value.presencePenalty
          : presencePenalty // ignore: cast_nullable_to_non_nullable
              as double?,
      frequencyPenalty: freezed == frequencyPenalty
          ? _value.frequencyPenalty
          : frequencyPenalty // ignore: cast_nullable_to_non_nullable
              as double?,
      repetitionPenalty: freezed == repetitionPenalty
          ? _value.repetitionPenalty
          : repetitionPenalty // ignore: cast_nullable_to_non_nullable
              as double?,
      topLogprobs: freezed == topLogprobs
          ? _value.topLogprobs
          : topLogprobs // ignore: cast_nullable_to_non_nullable
              as int?,
      minP: freezed == minP
          ? _value.minP
          : minP // ignore: cast_nullable_to_non_nullable
              as double?,
      topA: freezed == topA
          ? _value.topA
          : topA // ignore: cast_nullable_to_non_nullable
              as double?,
      transforms: freezed == transforms
          ? _value.transforms
          : transforms // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      models: freezed == models
          ? _value.models
          : models // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      reasoning: freezed == reasoning
          ? _value.reasoning
          : reasoning // ignore: cast_nullable_to_non_nullable
              as Reasoning?,
    ) as $Val);
  }

  /// Create a copy of Prompt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReasoningCopyWith<$Res>? get reasoning {
    if (_value.reasoning == null) {
      return null;
    }

    return $ReasoningCopyWith<$Res>(_value.reasoning!, (value) {
      return _then(_value.copyWith(reasoning: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PromptImplCopyWith<$Res> implements $PromptCopyWith<$Res> {
  factory _$$PromptImplCopyWith(
          _$PromptImpl value, $Res Function(_$PromptImpl) then) =
      __$$PromptImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String model,
      List<ChatMessage> messages,
      double temperature,
      int maxTokens,
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
      Reasoning? reasoning});

  @override
  $ReasoningCopyWith<$Res>? get reasoning;
}

/// @nodoc
class __$$PromptImplCopyWithImpl<$Res>
    extends _$PromptCopyWithImpl<$Res, _$PromptImpl>
    implements _$$PromptImplCopyWith<$Res> {
  __$$PromptImplCopyWithImpl(
      _$PromptImpl _value, $Res Function(_$PromptImpl) _then)
      : super(_value, _then);

  /// Create a copy of Prompt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? messages = null,
    Object? temperature = null,
    Object? maxTokens = null,
    Object? seed = freezed,
    Object? topP = freezed,
    Object? topK = freezed,
    Object? presencePenalty = freezed,
    Object? frequencyPenalty = freezed,
    Object? repetitionPenalty = freezed,
    Object? topLogprobs = freezed,
    Object? minP = freezed,
    Object? topA = freezed,
    Object? transforms = freezed,
    Object? models = freezed,
    Object? reasoning = freezed,
  }) {
    return _then(_$PromptImpl(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      maxTokens: null == maxTokens
          ? _value.maxTokens
          : maxTokens // ignore: cast_nullable_to_non_nullable
              as int,
      seed: freezed == seed
          ? _value.seed
          : seed // ignore: cast_nullable_to_non_nullable
              as int?,
      topP: freezed == topP
          ? _value.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double?,
      topK: freezed == topK
          ? _value.topK
          : topK // ignore: cast_nullable_to_non_nullable
              as double?,
      presencePenalty: freezed == presencePenalty
          ? _value.presencePenalty
          : presencePenalty // ignore: cast_nullable_to_non_nullable
              as double?,
      frequencyPenalty: freezed == frequencyPenalty
          ? _value.frequencyPenalty
          : frequencyPenalty // ignore: cast_nullable_to_non_nullable
              as double?,
      repetitionPenalty: freezed == repetitionPenalty
          ? _value.repetitionPenalty
          : repetitionPenalty // ignore: cast_nullable_to_non_nullable
              as double?,
      topLogprobs: freezed == topLogprobs
          ? _value.topLogprobs
          : topLogprobs // ignore: cast_nullable_to_non_nullable
              as int?,
      minP: freezed == minP
          ? _value.minP
          : minP // ignore: cast_nullable_to_non_nullable
              as double?,
      topA: freezed == topA
          ? _value.topA
          : topA // ignore: cast_nullable_to_non_nullable
              as double?,
      transforms: freezed == transforms
          ? _value._transforms
          : transforms // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      models: freezed == models
          ? _value._models
          : models // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      reasoning: freezed == reasoning
          ? _value.reasoning
          : reasoning // ignore: cast_nullable_to_non_nullable
              as Reasoning?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PromptImpl implements _Prompt {
  const _$PromptImpl(
      {required this.model,
      required final List<ChatMessage> messages,
      required this.temperature,
      required this.maxTokens,
      this.seed,
      this.topP,
      this.topK,
      this.presencePenalty,
      this.frequencyPenalty,
      this.repetitionPenalty,
      this.topLogprobs,
      this.minP,
      this.topA,
      final List<String>? transforms,
      final List<String>? models,
      this.reasoning})
      : _messages = messages,
        _transforms = transforms,
        _models = models;

  factory _$PromptImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromptImplFromJson(json);

  @override
  final String model;
  final List<ChatMessage> _messages;
  @override
  List<ChatMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  final double temperature;
  @override
  final int maxTokens;
  @override
  final int? seed;
  @override
  final double? topP;
  @override
  final double? topK;
  @override
  final double? presencePenalty;
  @override
  final double? frequencyPenalty;
  @override
  final double? repetitionPenalty;
  @override
  final int? topLogprobs;
  @override
  final double? minP;
  @override
  final double? topA;
  final List<String>? _transforms;
  @override
  List<String>? get transforms {
    final value = _transforms;
    if (value == null) return null;
    if (_transforms is EqualUnmodifiableListView) return _transforms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _models;
  @override
  List<String>? get models {
    final value = _models;
    if (value == null) return null;
    if (_models is EqualUnmodifiableListView) return _models;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Reasoning? reasoning;

  @override
  String toString() {
    return 'Prompt(model: $model, messages: $messages, temperature: $temperature, maxTokens: $maxTokens, seed: $seed, topP: $topP, topK: $topK, presencePenalty: $presencePenalty, frequencyPenalty: $frequencyPenalty, repetitionPenalty: $repetitionPenalty, topLogprobs: $topLogprobs, minP: $minP, topA: $topA, transforms: $transforms, models: $models, reasoning: $reasoning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromptImpl &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.maxTokens, maxTokens) ||
                other.maxTokens == maxTokens) &&
            (identical(other.seed, seed) || other.seed == seed) &&
            (identical(other.topP, topP) || other.topP == topP) &&
            (identical(other.topK, topK) || other.topK == topK) &&
            (identical(other.presencePenalty, presencePenalty) ||
                other.presencePenalty == presencePenalty) &&
            (identical(other.frequencyPenalty, frequencyPenalty) ||
                other.frequencyPenalty == frequencyPenalty) &&
            (identical(other.repetitionPenalty, repetitionPenalty) ||
                other.repetitionPenalty == repetitionPenalty) &&
            (identical(other.topLogprobs, topLogprobs) ||
                other.topLogprobs == topLogprobs) &&
            (identical(other.minP, minP) || other.minP == minP) &&
            (identical(other.topA, topA) || other.topA == topA) &&
            const DeepCollectionEquality()
                .equals(other._transforms, _transforms) &&
            const DeepCollectionEquality().equals(other._models, _models) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      model,
      const DeepCollectionEquality().hash(_messages),
      temperature,
      maxTokens,
      seed,
      topP,
      topK,
      presencePenalty,
      frequencyPenalty,
      repetitionPenalty,
      topLogprobs,
      minP,
      topA,
      const DeepCollectionEquality().hash(_transforms),
      const DeepCollectionEquality().hash(_models),
      reasoning);

  /// Create a copy of Prompt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PromptImplCopyWith<_$PromptImpl> get copyWith =>
      __$$PromptImplCopyWithImpl<_$PromptImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromptImplToJson(
      this,
    );
  }
}

abstract class _Prompt implements Prompt {
  const factory _Prompt(
      {required final String model,
      required final List<ChatMessage> messages,
      required final double temperature,
      required final int maxTokens,
      final int? seed,
      final double? topP,
      final double? topK,
      final double? presencePenalty,
      final double? frequencyPenalty,
      final double? repetitionPenalty,
      final int? topLogprobs,
      final double? minP,
      final double? topA,
      final List<String>? transforms,
      final List<String>? models,
      final Reasoning? reasoning}) = _$PromptImpl;

  factory _Prompt.fromJson(Map<String, dynamic> json) = _$PromptImpl.fromJson;

  @override
  String get model;
  @override
  List<ChatMessage> get messages;
  @override
  double get temperature;
  @override
  int get maxTokens;
  @override
  int? get seed;
  @override
  double? get topP;
  @override
  double? get topK;
  @override
  double? get presencePenalty;
  @override
  double? get frequencyPenalty;
  @override
  double? get repetitionPenalty;
  @override
  int? get topLogprobs;
  @override
  double? get minP;
  @override
  double? get topA;
  @override
  List<String>? get transforms;
  @override
  List<String>? get models;
  @override
  Reasoning? get reasoning;

  /// Create a copy of Prompt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PromptImplCopyWith<_$PromptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) {
  return _ChatMessage.fromJson(json);
}

/// @nodoc
mixin _$ChatMessage {
  Role get role => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  /// Serializes this ChatMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatMessageCopyWith<ChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageCopyWith<$Res> {
  factory $ChatMessageCopyWith(
          ChatMessage value, $Res Function(ChatMessage) then) =
      _$ChatMessageCopyWithImpl<$Res, ChatMessage>;
  @useResult
  $Res call({Role role, String content});
}

/// @nodoc
class _$ChatMessageCopyWithImpl<$Res, $Val extends ChatMessage>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatMessageImplCopyWith<$Res>
    implements $ChatMessageCopyWith<$Res> {
  factory _$$ChatMessageImplCopyWith(
          _$ChatMessageImpl value, $Res Function(_$ChatMessageImpl) then) =
      __$$ChatMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Role role, String content});
}

/// @nodoc
class __$$ChatMessageImplCopyWithImpl<$Res>
    extends _$ChatMessageCopyWithImpl<$Res, _$ChatMessageImpl>
    implements _$$ChatMessageImplCopyWith<$Res> {
  __$$ChatMessageImplCopyWithImpl(
      _$ChatMessageImpl _value, $Res Function(_$ChatMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = null,
  }) {
    return _then(_$ChatMessageImpl(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMessageImpl implements _ChatMessage {
  const _$ChatMessageImpl({required this.role, required this.content});

  factory _$ChatMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMessageImplFromJson(json);

  @override
  final Role role;
  @override
  final String content;

  @override
  String toString() {
    return 'ChatMessage(role: $role, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageImpl &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, role, content);

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageImplCopyWith<_$ChatMessageImpl> get copyWith =>
      __$$ChatMessageImplCopyWithImpl<_$ChatMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessageImplToJson(
      this,
    );
  }
}

abstract class _ChatMessage implements ChatMessage {
  const factory _ChatMessage(
      {required final Role role,
      required final String content}) = _$ChatMessageImpl;

  factory _ChatMessage.fromJson(Map<String, dynamic> json) =
      _$ChatMessageImpl.fromJson;

  @override
  Role get role;
  @override
  String get content;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatMessageImplCopyWith<_$ChatMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Reasoning _$ReasoningFromJson(Map<String, dynamic> json) {
  return _Reasoning.fromJson(json);
}

/// @nodoc
mixin _$Reasoning {
  Effort get effort => throw _privateConstructorUsedError;
  bool get exclude => throw _privateConstructorUsedError;
  int get maxTokens => throw _privateConstructorUsedError;

  /// Serializes this Reasoning to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Reasoning
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReasoningCopyWith<Reasoning> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReasoningCopyWith<$Res> {
  factory $ReasoningCopyWith(Reasoning value, $Res Function(Reasoning) then) =
      _$ReasoningCopyWithImpl<$Res, Reasoning>;
  @useResult
  $Res call({Effort effort, bool exclude, int maxTokens});
}

/// @nodoc
class _$ReasoningCopyWithImpl<$Res, $Val extends Reasoning>
    implements $ReasoningCopyWith<$Res> {
  _$ReasoningCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Reasoning
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? effort = null,
    Object? exclude = null,
    Object? maxTokens = null,
  }) {
    return _then(_value.copyWith(
      effort: null == effort
          ? _value.effort
          : effort // ignore: cast_nullable_to_non_nullable
              as Effort,
      exclude: null == exclude
          ? _value.exclude
          : exclude // ignore: cast_nullable_to_non_nullable
              as bool,
      maxTokens: null == maxTokens
          ? _value.maxTokens
          : maxTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReasoningImplCopyWith<$Res>
    implements $ReasoningCopyWith<$Res> {
  factory _$$ReasoningImplCopyWith(
          _$ReasoningImpl value, $Res Function(_$ReasoningImpl) then) =
      __$$ReasoningImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Effort effort, bool exclude, int maxTokens});
}

/// @nodoc
class __$$ReasoningImplCopyWithImpl<$Res>
    extends _$ReasoningCopyWithImpl<$Res, _$ReasoningImpl>
    implements _$$ReasoningImplCopyWith<$Res> {
  __$$ReasoningImplCopyWithImpl(
      _$ReasoningImpl _value, $Res Function(_$ReasoningImpl) _then)
      : super(_value, _then);

  /// Create a copy of Reasoning
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? effort = null,
    Object? exclude = null,
    Object? maxTokens = null,
  }) {
    return _then(_$ReasoningImpl(
      effort: null == effort
          ? _value.effort
          : effort // ignore: cast_nullable_to_non_nullable
              as Effort,
      exclude: null == exclude
          ? _value.exclude
          : exclude // ignore: cast_nullable_to_non_nullable
              as bool,
      maxTokens: null == maxTokens
          ? _value.maxTokens
          : maxTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReasoningImpl implements _Reasoning {
  const _$ReasoningImpl(
      {required this.effort, required this.exclude, required this.maxTokens});

  factory _$ReasoningImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReasoningImplFromJson(json);

  @override
  final Effort effort;
  @override
  final bool exclude;
  @override
  final int maxTokens;

  @override
  String toString() {
    return 'Reasoning(effort: $effort, exclude: $exclude, maxTokens: $maxTokens)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReasoningImpl &&
            (identical(other.effort, effort) || other.effort == effort) &&
            (identical(other.exclude, exclude) || other.exclude == exclude) &&
            (identical(other.maxTokens, maxTokens) ||
                other.maxTokens == maxTokens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, effort, exclude, maxTokens);

  /// Create a copy of Reasoning
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReasoningImplCopyWith<_$ReasoningImpl> get copyWith =>
      __$$ReasoningImplCopyWithImpl<_$ReasoningImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReasoningImplToJson(
      this,
    );
  }
}

abstract class _Reasoning implements Reasoning {
  const factory _Reasoning(
      {required final Effort effort,
      required final bool exclude,
      required final int maxTokens}) = _$ReasoningImpl;

  factory _Reasoning.fromJson(Map<String, dynamic> json) =
      _$ReasoningImpl.fromJson;

  @override
  Effort get effort;
  @override
  bool get exclude;
  @override
  int get maxTokens;

  /// Create a copy of Reasoning
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReasoningImplCopyWith<_$ReasoningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
