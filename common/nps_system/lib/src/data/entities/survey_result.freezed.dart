// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'survey_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NPSResult _$NPSResultFromJson(Map<String, dynamic> json) {
  return _NPSResult.fromJson(json);
}

/// @nodoc
mixin _$NPSResult {
  String get questionID => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  String get feedback => throw _privateConstructorUsedError;

  /// Serializes this NPSResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NPSResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NPSResultCopyWith<NPSResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NPSResultCopyWith<$Res> {
  factory $NPSResultCopyWith(NPSResult value, $Res Function(NPSResult) then) =
      _$NPSResultCopyWithImpl<$Res, NPSResult>;
  @useResult
  $Res call({String questionID, int rating, String feedback});
}

/// @nodoc
class _$NPSResultCopyWithImpl<$Res, $Val extends NPSResult>
    implements $NPSResultCopyWith<$Res> {
  _$NPSResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NPSResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionID = null,
    Object? rating = null,
    Object? feedback = null,
  }) {
    return _then(_value.copyWith(
      questionID: null == questionID
          ? _value.questionID
          : questionID // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      feedback: null == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NPSResultImplCopyWith<$Res>
    implements $NPSResultCopyWith<$Res> {
  factory _$$NPSResultImplCopyWith(
          _$NPSResultImpl value, $Res Function(_$NPSResultImpl) then) =
      __$$NPSResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String questionID, int rating, String feedback});
}

/// @nodoc
class __$$NPSResultImplCopyWithImpl<$Res>
    extends _$NPSResultCopyWithImpl<$Res, _$NPSResultImpl>
    implements _$$NPSResultImplCopyWith<$Res> {
  __$$NPSResultImplCopyWithImpl(
      _$NPSResultImpl _value, $Res Function(_$NPSResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of NPSResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionID = null,
    Object? rating = null,
    Object? feedback = null,
  }) {
    return _then(_$NPSResultImpl(
      questionID: null == questionID
          ? _value.questionID
          : questionID // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      feedback: null == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NPSResultImpl implements _NPSResult {
  const _$NPSResultImpl(
      {required this.questionID, required this.rating, required this.feedback});

  factory _$NPSResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$NPSResultImplFromJson(json);

  @override
  final String questionID;
  @override
  final int rating;
  @override
  final String feedback;

  @override
  String toString() {
    return 'NPSResult(questionID: $questionID, rating: $rating, feedback: $feedback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NPSResultImpl &&
            (identical(other.questionID, questionID) ||
                other.questionID == questionID) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, questionID, rating, feedback);

  /// Create a copy of NPSResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NPSResultImplCopyWith<_$NPSResultImpl> get copyWith =>
      __$$NPSResultImplCopyWithImpl<_$NPSResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NPSResultImplToJson(
      this,
    );
  }
}

abstract class _NPSResult implements NPSResult {
  const factory _NPSResult(
      {required final String questionID,
      required final int rating,
      required final String feedback}) = _$NPSResultImpl;

  factory _NPSResult.fromJson(Map<String, dynamic> json) =
      _$NPSResultImpl.fromJson;

  @override
  String get questionID;
  @override
  int get rating;
  @override
  String get feedback;

  /// Create a copy of NPSResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NPSResultImplCopyWith<_$NPSResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
