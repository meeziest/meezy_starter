// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nps_system_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NpsSystemState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(QuestionEntity question) loaded,
    required TResult Function() resultSend,
    required TResult Function(StoreTarget target) showStoreRating,
    required TResult Function(ExceptionData exception) exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(QuestionEntity question)? loaded,
    TResult? Function()? resultSend,
    TResult? Function(StoreTarget target)? showStoreRating,
    TResult? Function(ExceptionData exception)? exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(QuestionEntity question)? loaded,
    TResult Function()? resultSend,
    TResult Function(StoreTarget target)? showStoreRating,
    TResult Function(ExceptionData exception)? exception,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ResultSaved value) resultSend,
    required TResult Function(_ShowStoreRating value) showStoreRating,
    required TResult Function(_Exception value) exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ResultSaved value)? resultSend,
    TResult? Function(_ShowStoreRating value)? showStoreRating,
    TResult? Function(_Exception value)? exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ResultSaved value)? resultSend,
    TResult Function(_ShowStoreRating value)? showStoreRating,
    TResult Function(_Exception value)? exception,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NpsSystemStateCopyWith<$Res> {
  factory $NpsSystemStateCopyWith(
          NpsSystemState value, $Res Function(NpsSystemState) then) =
      _$NpsSystemStateCopyWithImpl<$Res, NpsSystemState>;
}

/// @nodoc
class _$NpsSystemStateCopyWithImpl<$Res, $Val extends NpsSystemState>
    implements $NpsSystemStateCopyWith<$Res> {
  _$NpsSystemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NpsSystemState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$IdleImplCopyWith<$Res> {
  factory _$$IdleImplCopyWith(
          _$IdleImpl value, $Res Function(_$IdleImpl) then) =
      __$$IdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IdleImplCopyWithImpl<$Res>
    extends _$NpsSystemStateCopyWithImpl<$Res, _$IdleImpl>
    implements _$$IdleImplCopyWith<$Res> {
  __$$IdleImplCopyWithImpl(_$IdleImpl _value, $Res Function(_$IdleImpl) _then)
      : super(_value, _then);

  /// Create a copy of NpsSystemState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$IdleImpl implements _Idle {
  const _$IdleImpl();

  @override
  String toString() {
    return 'NpsSystemState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(QuestionEntity question) loaded,
    required TResult Function() resultSend,
    required TResult Function(StoreTarget target) showStoreRating,
    required TResult Function(ExceptionData exception) exception,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(QuestionEntity question)? loaded,
    TResult? Function()? resultSend,
    TResult? Function(StoreTarget target)? showStoreRating,
    TResult? Function(ExceptionData exception)? exception,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(QuestionEntity question)? loaded,
    TResult Function()? resultSend,
    TResult Function(StoreTarget target)? showStoreRating,
    TResult Function(ExceptionData exception)? exception,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ResultSaved value) resultSend,
    required TResult Function(_ShowStoreRating value) showStoreRating,
    required TResult Function(_Exception value) exception,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ResultSaved value)? resultSend,
    TResult? Function(_ShowStoreRating value)? showStoreRating,
    TResult? Function(_Exception value)? exception,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ResultSaved value)? resultSend,
    TResult Function(_ShowStoreRating value)? showStoreRating,
    TResult Function(_Exception value)? exception,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _Idle implements NpsSystemState {
  const factory _Idle() = _$IdleImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$NpsSystemStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of NpsSystemState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'NpsSystemState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(QuestionEntity question) loaded,
    required TResult Function() resultSend,
    required TResult Function(StoreTarget target) showStoreRating,
    required TResult Function(ExceptionData exception) exception,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(QuestionEntity question)? loaded,
    TResult? Function()? resultSend,
    TResult? Function(StoreTarget target)? showStoreRating,
    TResult? Function(ExceptionData exception)? exception,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(QuestionEntity question)? loaded,
    TResult Function()? resultSend,
    TResult Function(StoreTarget target)? showStoreRating,
    TResult Function(ExceptionData exception)? exception,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ResultSaved value) resultSend,
    required TResult Function(_ShowStoreRating value) showStoreRating,
    required TResult Function(_Exception value) exception,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ResultSaved value)? resultSend,
    TResult? Function(_ShowStoreRating value)? showStoreRating,
    TResult? Function(_Exception value)? exception,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ResultSaved value)? resultSend,
    TResult Function(_ShowStoreRating value)? showStoreRating,
    TResult Function(_Exception value)? exception,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements NpsSystemState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({QuestionEntity question});

  $QuestionEntityCopyWith<$Res> get question;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$NpsSystemStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of NpsSystemState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
  }) {
    return _then(_$LoadedImpl(
      null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as QuestionEntity,
    ));
  }

  /// Create a copy of NpsSystemState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuestionEntityCopyWith<$Res> get question {
    return $QuestionEntityCopyWith<$Res>(_value.question, (value) {
      return _then(_value.copyWith(question: value));
    });
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(this.question);

  @override
  final QuestionEntity question;

  @override
  String toString() {
    return 'NpsSystemState.loaded(question: $question)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.question, question) ||
                other.question == question));
  }

  @override
  int get hashCode => Object.hash(runtimeType, question);

  /// Create a copy of NpsSystemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(QuestionEntity question) loaded,
    required TResult Function() resultSend,
    required TResult Function(StoreTarget target) showStoreRating,
    required TResult Function(ExceptionData exception) exception,
  }) {
    return loaded(question);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(QuestionEntity question)? loaded,
    TResult? Function()? resultSend,
    TResult? Function(StoreTarget target)? showStoreRating,
    TResult? Function(ExceptionData exception)? exception,
  }) {
    return loaded?.call(question);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(QuestionEntity question)? loaded,
    TResult Function()? resultSend,
    TResult Function(StoreTarget target)? showStoreRating,
    TResult Function(ExceptionData exception)? exception,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(question);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ResultSaved value) resultSend,
    required TResult Function(_ShowStoreRating value) showStoreRating,
    required TResult Function(_Exception value) exception,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ResultSaved value)? resultSend,
    TResult? Function(_ShowStoreRating value)? showStoreRating,
    TResult? Function(_Exception value)? exception,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ResultSaved value)? resultSend,
    TResult Function(_ShowStoreRating value)? showStoreRating,
    TResult Function(_Exception value)? exception,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements NpsSystemState {
  const factory _Loaded(final QuestionEntity question) = _$LoadedImpl;

  QuestionEntity get question;

  /// Create a copy of NpsSystemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResultSavedImplCopyWith<$Res> {
  factory _$$ResultSavedImplCopyWith(
          _$ResultSavedImpl value, $Res Function(_$ResultSavedImpl) then) =
      __$$ResultSavedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResultSavedImplCopyWithImpl<$Res>
    extends _$NpsSystemStateCopyWithImpl<$Res, _$ResultSavedImpl>
    implements _$$ResultSavedImplCopyWith<$Res> {
  __$$ResultSavedImplCopyWithImpl(
      _$ResultSavedImpl _value, $Res Function(_$ResultSavedImpl) _then)
      : super(_value, _then);

  /// Create a copy of NpsSystemState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResultSavedImpl implements _ResultSaved {
  const _$ResultSavedImpl();

  @override
  String toString() {
    return 'NpsSystemState.resultSend()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResultSavedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(QuestionEntity question) loaded,
    required TResult Function() resultSend,
    required TResult Function(StoreTarget target) showStoreRating,
    required TResult Function(ExceptionData exception) exception,
  }) {
    return resultSend();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(QuestionEntity question)? loaded,
    TResult? Function()? resultSend,
    TResult? Function(StoreTarget target)? showStoreRating,
    TResult? Function(ExceptionData exception)? exception,
  }) {
    return resultSend?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(QuestionEntity question)? loaded,
    TResult Function()? resultSend,
    TResult Function(StoreTarget target)? showStoreRating,
    TResult Function(ExceptionData exception)? exception,
    required TResult orElse(),
  }) {
    if (resultSend != null) {
      return resultSend();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ResultSaved value) resultSend,
    required TResult Function(_ShowStoreRating value) showStoreRating,
    required TResult Function(_Exception value) exception,
  }) {
    return resultSend(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ResultSaved value)? resultSend,
    TResult? Function(_ShowStoreRating value)? showStoreRating,
    TResult? Function(_Exception value)? exception,
  }) {
    return resultSend?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ResultSaved value)? resultSend,
    TResult Function(_ShowStoreRating value)? showStoreRating,
    TResult Function(_Exception value)? exception,
    required TResult orElse(),
  }) {
    if (resultSend != null) {
      return resultSend(this);
    }
    return orElse();
  }
}

abstract class _ResultSaved implements NpsSystemState {
  const factory _ResultSaved() = _$ResultSavedImpl;
}

/// @nodoc
abstract class _$$ShowStoreRatingImplCopyWith<$Res> {
  factory _$$ShowStoreRatingImplCopyWith(_$ShowStoreRatingImpl value,
          $Res Function(_$ShowStoreRatingImpl) then) =
      __$$ShowStoreRatingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StoreTarget target});
}

/// @nodoc
class __$$ShowStoreRatingImplCopyWithImpl<$Res>
    extends _$NpsSystemStateCopyWithImpl<$Res, _$ShowStoreRatingImpl>
    implements _$$ShowStoreRatingImplCopyWith<$Res> {
  __$$ShowStoreRatingImplCopyWithImpl(
      _$ShowStoreRatingImpl _value, $Res Function(_$ShowStoreRatingImpl) _then)
      : super(_value, _then);

  /// Create a copy of NpsSystemState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? target = null,
  }) {
    return _then(_$ShowStoreRatingImpl(
      null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as StoreTarget,
    ));
  }
}

/// @nodoc

class _$ShowStoreRatingImpl implements _ShowStoreRating {
  const _$ShowStoreRatingImpl(this.target);

  @override
  final StoreTarget target;

  @override
  String toString() {
    return 'NpsSystemState.showStoreRating(target: $target)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowStoreRatingImpl &&
            (identical(other.target, target) || other.target == target));
  }

  @override
  int get hashCode => Object.hash(runtimeType, target);

  /// Create a copy of NpsSystemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowStoreRatingImplCopyWith<_$ShowStoreRatingImpl> get copyWith =>
      __$$ShowStoreRatingImplCopyWithImpl<_$ShowStoreRatingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(QuestionEntity question) loaded,
    required TResult Function() resultSend,
    required TResult Function(StoreTarget target) showStoreRating,
    required TResult Function(ExceptionData exception) exception,
  }) {
    return showStoreRating(target);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(QuestionEntity question)? loaded,
    TResult? Function()? resultSend,
    TResult? Function(StoreTarget target)? showStoreRating,
    TResult? Function(ExceptionData exception)? exception,
  }) {
    return showStoreRating?.call(target);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(QuestionEntity question)? loaded,
    TResult Function()? resultSend,
    TResult Function(StoreTarget target)? showStoreRating,
    TResult Function(ExceptionData exception)? exception,
    required TResult orElse(),
  }) {
    if (showStoreRating != null) {
      return showStoreRating(target);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ResultSaved value) resultSend,
    required TResult Function(_ShowStoreRating value) showStoreRating,
    required TResult Function(_Exception value) exception,
  }) {
    return showStoreRating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ResultSaved value)? resultSend,
    TResult? Function(_ShowStoreRating value)? showStoreRating,
    TResult? Function(_Exception value)? exception,
  }) {
    return showStoreRating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ResultSaved value)? resultSend,
    TResult Function(_ShowStoreRating value)? showStoreRating,
    TResult Function(_Exception value)? exception,
    required TResult orElse(),
  }) {
    if (showStoreRating != null) {
      return showStoreRating(this);
    }
    return orElse();
  }
}

abstract class _ShowStoreRating implements NpsSystemState {
  const factory _ShowStoreRating(final StoreTarget target) =
      _$ShowStoreRatingImpl;

  StoreTarget get target;

  /// Create a copy of NpsSystemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShowStoreRatingImplCopyWith<_$ShowStoreRatingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExceptionImplCopyWith<$Res> {
  factory _$$ExceptionImplCopyWith(
          _$ExceptionImpl value, $Res Function(_$ExceptionImpl) then) =
      __$$ExceptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ExceptionData exception});

  $ExceptionDataCopyWith<$Res> get exception;
}

/// @nodoc
class __$$ExceptionImplCopyWithImpl<$Res>
    extends _$NpsSystemStateCopyWithImpl<$Res, _$ExceptionImpl>
    implements _$$ExceptionImplCopyWith<$Res> {
  __$$ExceptionImplCopyWithImpl(
      _$ExceptionImpl _value, $Res Function(_$ExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of NpsSystemState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$ExceptionImpl(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as ExceptionData,
    ));
  }

  /// Create a copy of NpsSystemState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExceptionDataCopyWith<$Res> get exception {
    return $ExceptionDataCopyWith<$Res>(_value.exception, (value) {
      return _then(_value.copyWith(exception: value));
    });
  }
}

/// @nodoc

class _$ExceptionImpl implements _Exception {
  const _$ExceptionImpl(this.exception);

  @override
  final ExceptionData exception;

  @override
  String toString() {
    return 'NpsSystemState.exception(exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExceptionImpl &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  /// Create a copy of NpsSystemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExceptionImplCopyWith<_$ExceptionImpl> get copyWith =>
      __$$ExceptionImplCopyWithImpl<_$ExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(QuestionEntity question) loaded,
    required TResult Function() resultSend,
    required TResult Function(StoreTarget target) showStoreRating,
    required TResult Function(ExceptionData exception) exception,
  }) {
    return exception(this.exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(QuestionEntity question)? loaded,
    TResult? Function()? resultSend,
    TResult? Function(StoreTarget target)? showStoreRating,
    TResult? Function(ExceptionData exception)? exception,
  }) {
    return exception?.call(this.exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function(QuestionEntity question)? loaded,
    TResult Function()? resultSend,
    TResult Function(StoreTarget target)? showStoreRating,
    TResult Function(ExceptionData exception)? exception,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(this.exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ResultSaved value) resultSend,
    required TResult Function(_ShowStoreRating value) showStoreRating,
    required TResult Function(_Exception value) exception,
  }) {
    return exception(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ResultSaved value)? resultSend,
    TResult? Function(_ShowStoreRating value)? showStoreRating,
    TResult? Function(_Exception value)? exception,
  }) {
    return exception?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ResultSaved value)? resultSend,
    TResult Function(_ShowStoreRating value)? showStoreRating,
    TResult Function(_Exception value)? exception,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(this);
    }
    return orElse();
  }
}

abstract class _Exception implements NpsSystemState {
  const factory _Exception(final ExceptionData exception) = _$ExceptionImpl;

  ExceptionData get exception;

  /// Create a copy of NpsSystemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExceptionImplCopyWith<_$ExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
