// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_limits_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MessageLimitsDto _$MessageLimitsDtoFromJson(Map<String, dynamic> json) {
  return _MessageDto.fromJson(json);
}

/// @nodoc
mixin _$MessageLimitsDto {
  @JsonKey(name: 'remaining_messages')
  int get remainingMessages => throw _privateConstructorUsedError;
  @JsonKey(name: 'renew_time')
  DateTime? get renewTime => throw _privateConstructorUsedError;

  /// Serializes this MessageLimitsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageLimitsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageLimitsDtoCopyWith<MessageLimitsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageLimitsDtoCopyWith<$Res> {
  factory $MessageLimitsDtoCopyWith(
          MessageLimitsDto value, $Res Function(MessageLimitsDto) then) =
      _$MessageLimitsDtoCopyWithImpl<$Res, MessageLimitsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'remaining_messages') int remainingMessages,
      @JsonKey(name: 'renew_time') DateTime? renewTime});
}

/// @nodoc
class _$MessageLimitsDtoCopyWithImpl<$Res, $Val extends MessageLimitsDto>
    implements $MessageLimitsDtoCopyWith<$Res> {
  _$MessageLimitsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageLimitsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remainingMessages = null,
    Object? renewTime = freezed,
  }) {
    return _then(_value.copyWith(
      remainingMessages: null == remainingMessages
          ? _value.remainingMessages
          : remainingMessages // ignore: cast_nullable_to_non_nullable
              as int,
      renewTime: freezed == renewTime
          ? _value.renewTime
          : renewTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageDtoImplCopyWith<$Res>
    implements $MessageLimitsDtoCopyWith<$Res> {
  factory _$$MessageDtoImplCopyWith(
          _$MessageDtoImpl value, $Res Function(_$MessageDtoImpl) then) =
      __$$MessageDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'remaining_messages') int remainingMessages,
      @JsonKey(name: 'renew_time') DateTime? renewTime});
}

/// @nodoc
class __$$MessageDtoImplCopyWithImpl<$Res>
    extends _$MessageLimitsDtoCopyWithImpl<$Res, _$MessageDtoImpl>
    implements _$$MessageDtoImplCopyWith<$Res> {
  __$$MessageDtoImplCopyWithImpl(
      _$MessageDtoImpl _value, $Res Function(_$MessageDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageLimitsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remainingMessages = null,
    Object? renewTime = freezed,
  }) {
    return _then(_$MessageDtoImpl(
      remainingMessages: null == remainingMessages
          ? _value.remainingMessages
          : remainingMessages // ignore: cast_nullable_to_non_nullable
              as int,
      renewTime: freezed == renewTime
          ? _value.renewTime
          : renewTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageDtoImpl implements _MessageDto {
  const _$MessageDtoImpl(
      {@JsonKey(name: 'remaining_messages') required this.remainingMessages,
      @JsonKey(name: 'renew_time') this.renewTime});

  factory _$MessageDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageDtoImplFromJson(json);

  @override
  @JsonKey(name: 'remaining_messages')
  final int remainingMessages;
  @override
  @JsonKey(name: 'renew_time')
  final DateTime? renewTime;

  @override
  String toString() {
    return 'MessageLimitsDto(remainingMessages: $remainingMessages, renewTime: $renewTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageDtoImpl &&
            (identical(other.remainingMessages, remainingMessages) ||
                other.remainingMessages == remainingMessages) &&
            (identical(other.renewTime, renewTime) ||
                other.renewTime == renewTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, remainingMessages, renewTime);

  /// Create a copy of MessageLimitsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageDtoImplCopyWith<_$MessageDtoImpl> get copyWith =>
      __$$MessageDtoImplCopyWithImpl<_$MessageDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageDtoImplToJson(
      this,
    );
  }
}

abstract class _MessageDto implements MessageLimitsDto {
  const factory _MessageDto(
          {@JsonKey(name: 'remaining_messages')
          required final int remainingMessages,
          @JsonKey(name: 'renew_time') final DateTime? renewTime}) =
      _$MessageDtoImpl;

  factory _MessageDto.fromJson(Map<String, dynamic> json) =
      _$MessageDtoImpl.fromJson;

  @override
  @JsonKey(name: 'remaining_messages')
  int get remainingMessages;
  @override
  @JsonKey(name: 'renew_time')
  DateTime? get renewTime;

  /// Create a copy of MessageLimitsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageDtoImplCopyWith<_$MessageDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
