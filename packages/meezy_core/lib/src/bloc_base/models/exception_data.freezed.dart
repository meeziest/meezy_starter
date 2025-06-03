// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exception_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExceptionData {
  String? get title;
  String? get message;
  Object? get detailed;

  /// Create a copy of ExceptionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExceptionDataCopyWith<ExceptionData> get copyWith =>
      _$ExceptionDataCopyWithImpl<ExceptionData>(
          this as ExceptionData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExceptionData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.detailed, detailed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, message,
      const DeepCollectionEquality().hash(detailed));

  @override
  String toString() {
    return 'ExceptionData(title: $title, message: $message, detailed: $detailed)';
  }
}

/// @nodoc
abstract mixin class $ExceptionDataCopyWith<$Res> {
  factory $ExceptionDataCopyWith(
          ExceptionData value, $Res Function(ExceptionData) _then) =
      _$ExceptionDataCopyWithImpl;
  @useResult
  $Res call({String? title, String? message, Object? detailed});
}

/// @nodoc
class _$ExceptionDataCopyWithImpl<$Res>
    implements $ExceptionDataCopyWith<$Res> {
  _$ExceptionDataCopyWithImpl(this._self, this._then);

  final ExceptionData _self;
  final $Res Function(ExceptionData) _then;

  /// Create a copy of ExceptionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? message = freezed,
    Object? detailed = freezed,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      detailed: freezed == detailed ? _self.detailed : detailed,
    ));
  }
}

/// @nodoc

class $Warning extends ExceptionData {
  const $Warning({this.title = null, this.message = null, this.detailed = null})
      : super._();

  @override
  @JsonKey()
  final String? title;
  @override
  @JsonKey()
  final String? message;
  @override
  @JsonKey()
  final Object? detailed;

  /// Create a copy of ExceptionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $$WarningCopyWith<$Warning> get copyWith =>
      _$$WarningCopyWithImpl<$Warning>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is $Warning &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.detailed, detailed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, message,
      const DeepCollectionEquality().hash(detailed));

  @override
  String toString() {
    return 'ExceptionData.warning(title: $title, message: $message, detailed: $detailed)';
  }
}

/// @nodoc
abstract mixin class $$WarningCopyWith<$Res>
    implements $ExceptionDataCopyWith<$Res> {
  factory $$WarningCopyWith($Warning value, $Res Function($Warning) _then) =
      _$$WarningCopyWithImpl;
  @override
  @useResult
  $Res call({String? title, String? message, Object? detailed});
}

/// @nodoc
class _$$WarningCopyWithImpl<$Res> implements $$WarningCopyWith<$Res> {
  _$$WarningCopyWithImpl(this._self, this._then);

  final $Warning _self;
  final $Res Function($Warning) _then;

  /// Create a copy of ExceptionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? message = freezed,
    Object? detailed = freezed,
  }) {
    return _then($Warning(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      detailed: freezed == detailed ? _self.detailed : detailed,
    ));
  }
}

/// @nodoc

class $Info extends ExceptionData {
  const $Info({this.title = null, this.message = null, this.detailed = null})
      : super._();

  @override
  @JsonKey()
  final String? title;
  @override
  @JsonKey()
  final String? message;
  @override
  @JsonKey()
  final Object? detailed;

  /// Create a copy of ExceptionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $$InfoCopyWith<$Info> get copyWith =>
      _$$InfoCopyWithImpl<$Info>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is $Info &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.detailed, detailed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, message,
      const DeepCollectionEquality().hash(detailed));

  @override
  String toString() {
    return 'ExceptionData.info(title: $title, message: $message, detailed: $detailed)';
  }
}

/// @nodoc
abstract mixin class $$InfoCopyWith<$Res>
    implements $ExceptionDataCopyWith<$Res> {
  factory $$InfoCopyWith($Info value, $Res Function($Info) _then) =
      _$$InfoCopyWithImpl;
  @override
  @useResult
  $Res call({String? title, String? message, Object? detailed});
}

/// @nodoc
class _$$InfoCopyWithImpl<$Res> implements $$InfoCopyWith<$Res> {
  _$$InfoCopyWithImpl(this._self, this._then);

  final $Info _self;
  final $Res Function($Info) _then;

  /// Create a copy of ExceptionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? message = freezed,
    Object? detailed = freezed,
  }) {
    return _then($Info(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      detailed: freezed == detailed ? _self.detailed : detailed,
    ));
  }
}

/// @nodoc

class $Error extends ExceptionData {
  const $Error({this.title = null, this.message = null, this.detailed = null})
      : super._();

  @override
  @JsonKey()
  final String? title;
  @override
  @JsonKey()
  final String? message;
  @override
  @JsonKey()
  final Object? detailed;

  /// Create a copy of ExceptionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $$ErrorCopyWith<$Error> get copyWith =>
      _$$ErrorCopyWithImpl<$Error>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is $Error &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.detailed, detailed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, message,
      const DeepCollectionEquality().hash(detailed));

  @override
  String toString() {
    return 'ExceptionData.error(title: $title, message: $message, detailed: $detailed)';
  }
}

/// @nodoc
abstract mixin class $$ErrorCopyWith<$Res>
    implements $ExceptionDataCopyWith<$Res> {
  factory $$ErrorCopyWith($Error value, $Res Function($Error) _then) =
      _$$ErrorCopyWithImpl;
  @override
  @useResult
  $Res call({String? title, String? message, Object? detailed});
}

/// @nodoc
class _$$ErrorCopyWithImpl<$Res> implements $$ErrorCopyWith<$Res> {
  _$$ErrorCopyWithImpl(this._self, this._then);

  final $Error _self;
  final $Res Function($Error) _then;

  /// Create a copy of ExceptionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? message = freezed,
    Object? detailed = freezed,
  }) {
    return _then($Error(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      detailed: freezed == detailed ? _self.detailed : detailed,
    ));
  }
}

// dart format on
