// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuestionEntity _$QuestionEntityFromJson(Map<String, dynamic> json) {
  return _QuestionEntity.fromJson(json);
}

/// @nodoc
mixin _$QuestionEntity {
  String get questionID => throw _privateConstructorUsedError;
  String get questionText => throw _privateConstructorUsedError;
  int get maxRating => throw _privateConstructorUsedError;

  /// Serializes this QuestionEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuestionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionEntityCopyWith<QuestionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionEntityCopyWith<$Res> {
  factory $QuestionEntityCopyWith(
          QuestionEntity value, $Res Function(QuestionEntity) then) =
      _$QuestionEntityCopyWithImpl<$Res, QuestionEntity>;
  @useResult
  $Res call({String questionID, String questionText, int maxRating});
}

/// @nodoc
class _$QuestionEntityCopyWithImpl<$Res, $Val extends QuestionEntity>
    implements $QuestionEntityCopyWith<$Res> {
  _$QuestionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuestionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionID = null,
    Object? questionText = null,
    Object? maxRating = null,
  }) {
    return _then(_value.copyWith(
      questionID: null == questionID
          ? _value.questionID
          : questionID // ignore: cast_nullable_to_non_nullable
              as String,
      questionText: null == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String,
      maxRating: null == maxRating
          ? _value.maxRating
          : maxRating // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionEntityImplCopyWith<$Res>
    implements $QuestionEntityCopyWith<$Res> {
  factory _$$QuestionEntityImplCopyWith(_$QuestionEntityImpl value,
          $Res Function(_$QuestionEntityImpl) then) =
      __$$QuestionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String questionID, String questionText, int maxRating});
}

/// @nodoc
class __$$QuestionEntityImplCopyWithImpl<$Res>
    extends _$QuestionEntityCopyWithImpl<$Res, _$QuestionEntityImpl>
    implements _$$QuestionEntityImplCopyWith<$Res> {
  __$$QuestionEntityImplCopyWithImpl(
      _$QuestionEntityImpl _value, $Res Function(_$QuestionEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuestionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionID = null,
    Object? questionText = null,
    Object? maxRating = null,
  }) {
    return _then(_$QuestionEntityImpl(
      questionID: null == questionID
          ? _value.questionID
          : questionID // ignore: cast_nullable_to_non_nullable
              as String,
      questionText: null == questionText
          ? _value.questionText
          : questionText // ignore: cast_nullable_to_non_nullable
              as String,
      maxRating: null == maxRating
          ? _value.maxRating
          : maxRating // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionEntityImpl implements _QuestionEntity {
  const _$QuestionEntityImpl(
      {required this.questionID,
      required this.questionText,
      required this.maxRating});

  factory _$QuestionEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionEntityImplFromJson(json);

  @override
  final String questionID;
  @override
  final String questionText;
  @override
  final int maxRating;

  @override
  String toString() {
    return 'QuestionEntity(questionID: $questionID, questionText: $questionText, maxRating: $maxRating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionEntityImpl &&
            (identical(other.questionID, questionID) ||
                other.questionID == questionID) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            (identical(other.maxRating, maxRating) ||
                other.maxRating == maxRating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, questionID, questionText, maxRating);

  /// Create a copy of QuestionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionEntityImplCopyWith<_$QuestionEntityImpl> get copyWith =>
      __$$QuestionEntityImplCopyWithImpl<_$QuestionEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionEntityImplToJson(
      this,
    );
  }
}

abstract class _QuestionEntity implements QuestionEntity {
  const factory _QuestionEntity(
      {required final String questionID,
      required final String questionText,
      required final int maxRating}) = _$QuestionEntityImpl;

  factory _QuestionEntity.fromJson(Map<String, dynamic> json) =
      _$QuestionEntityImpl.fromJson;

  @override
  String get questionID;
  @override
  String get questionText;
  @override
  int get maxRating;

  /// Create a copy of QuestionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionEntityImplCopyWith<_$QuestionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
