// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SessionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) startSession,
    required TResult Function(String email, String password) register,
    required TResult Function() endSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? startSession,
    TResult? Function(String email, String password)? register,
    TResult? Function()? endSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? startSession,
    TResult Function(String email, String password)? register,
    TResult Function()? endSession,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartSession value) startSession,
    required TResult Function(_Register value) register,
    required TResult Function(_EndSession value) endSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartSession value)? startSession,
    TResult? Function(_Register value)? register,
    TResult? Function(_EndSession value)? endSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartSession value)? startSession,
    TResult Function(_Register value)? register,
    TResult Function(_EndSession value)? endSession,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionEventCopyWith<$Res> {
  factory $SessionEventCopyWith(
          SessionEvent value, $Res Function(SessionEvent) then) =
      _$SessionEventCopyWithImpl<$Res, SessionEvent>;
}

/// @nodoc
class _$SessionEventCopyWithImpl<$Res, $Val extends SessionEvent>
    implements $SessionEventCopyWith<$Res> {
  _$SessionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartSessionImplCopyWith<$Res> {
  factory _$$StartSessionImplCopyWith(
          _$StartSessionImpl value, $Res Function(_$StartSessionImpl) then) =
      __$$StartSessionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$StartSessionImplCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res, _$StartSessionImpl>
    implements _$$StartSessionImplCopyWith<$Res> {
  __$$StartSessionImplCopyWithImpl(
      _$StartSessionImpl _value, $Res Function(_$StartSessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$StartSessionImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StartSessionImpl extends _StartSession {
  const _$StartSessionImpl({required this.email, required this.password})
      : super._();

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SessionEvent.startSession(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartSessionImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartSessionImplCopyWith<_$StartSessionImpl> get copyWith =>
      __$$StartSessionImplCopyWithImpl<_$StartSessionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) startSession,
    required TResult Function(String email, String password) register,
    required TResult Function() endSession,
  }) {
    return startSession(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? startSession,
    TResult? Function(String email, String password)? register,
    TResult? Function()? endSession,
  }) {
    return startSession?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? startSession,
    TResult Function(String email, String password)? register,
    TResult Function()? endSession,
    required TResult orElse(),
  }) {
    if (startSession != null) {
      return startSession(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartSession value) startSession,
    required TResult Function(_Register value) register,
    required TResult Function(_EndSession value) endSession,
  }) {
    return startSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartSession value)? startSession,
    TResult? Function(_Register value)? register,
    TResult? Function(_EndSession value)? endSession,
  }) {
    return startSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartSession value)? startSession,
    TResult Function(_Register value)? register,
    TResult Function(_EndSession value)? endSession,
    required TResult orElse(),
  }) {
    if (startSession != null) {
      return startSession(this);
    }
    return orElse();
  }
}

abstract class _StartSession extends SessionEvent {
  const factory _StartSession(
      {required final String email,
      required final String password}) = _$StartSessionImpl;
  const _StartSession._() : super._();

  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$$StartSessionImplCopyWith<_$StartSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterImplCopyWith<$Res> {
  factory _$$RegisterImplCopyWith(
          _$RegisterImpl value, $Res Function(_$RegisterImpl) then) =
      __$$RegisterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$RegisterImplCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res, _$RegisterImpl>
    implements _$$RegisterImplCopyWith<$Res> {
  __$$RegisterImplCopyWithImpl(
      _$RegisterImpl _value, $Res Function(_$RegisterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$RegisterImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterImpl extends _Register {
  const _$RegisterImpl({required this.email, required this.password})
      : super._();

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SessionEvent.register(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterImplCopyWith<_$RegisterImpl> get copyWith =>
      __$$RegisterImplCopyWithImpl<_$RegisterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) startSession,
    required TResult Function(String email, String password) register,
    required TResult Function() endSession,
  }) {
    return register(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? startSession,
    TResult? Function(String email, String password)? register,
    TResult? Function()? endSession,
  }) {
    return register?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? startSession,
    TResult Function(String email, String password)? register,
    TResult Function()? endSession,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartSession value) startSession,
    required TResult Function(_Register value) register,
    required TResult Function(_EndSession value) endSession,
  }) {
    return register(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartSession value)? startSession,
    TResult? Function(_Register value)? register,
    TResult? Function(_EndSession value)? endSession,
  }) {
    return register?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartSession value)? startSession,
    TResult Function(_Register value)? register,
    TResult Function(_EndSession value)? endSession,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(this);
    }
    return orElse();
  }
}

abstract class _Register extends SessionEvent {
  const factory _Register(
      {required final String email,
      required final String password}) = _$RegisterImpl;
  const _Register._() : super._();

  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$$RegisterImplCopyWith<_$RegisterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EndSessionImplCopyWith<$Res> {
  factory _$$EndSessionImplCopyWith(
          _$EndSessionImpl value, $Res Function(_$EndSessionImpl) then) =
      __$$EndSessionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EndSessionImplCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res, _$EndSessionImpl>
    implements _$$EndSessionImplCopyWith<$Res> {
  __$$EndSessionImplCopyWithImpl(
      _$EndSessionImpl _value, $Res Function(_$EndSessionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EndSessionImpl extends _EndSession {
  const _$EndSessionImpl() : super._();

  @override
  String toString() {
    return 'SessionEvent.endSession()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EndSessionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) startSession,
    required TResult Function(String email, String password) register,
    required TResult Function() endSession,
  }) {
    return endSession();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? startSession,
    TResult? Function(String email, String password)? register,
    TResult? Function()? endSession,
  }) {
    return endSession?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? startSession,
    TResult Function(String email, String password)? register,
    TResult Function()? endSession,
    required TResult orElse(),
  }) {
    if (endSession != null) {
      return endSession();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartSession value) startSession,
    required TResult Function(_Register value) register,
    required TResult Function(_EndSession value) endSession,
  }) {
    return endSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartSession value)? startSession,
    TResult? Function(_Register value)? register,
    TResult? Function(_EndSession value)? endSession,
  }) {
    return endSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartSession value)? startSession,
    TResult Function(_Register value)? register,
    TResult Function(_EndSession value)? endSession,
    required TResult orElse(),
  }) {
    if (endSession != null) {
      return endSession(this);
    }
    return orElse();
  }
}

abstract class _EndSession extends SessionEvent {
  const factory _EndSession() = _$EndSessionImpl;
  const _EndSession._() : super._();
}

/// @nodoc
mixin _$SessionState {
  SessionStatus get status => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SessionStatus status) idle,
    required TResult Function(SessionStatus status) processing,
    required TResult Function(SessionStatus status, Failure error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SessionStatus status)? idle,
    TResult? Function(SessionStatus status)? processing,
    TResult? Function(SessionStatus status, Failure error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SessionStatus status)? idle,
    TResult Function(SessionStatus status)? processing,
    TResult Function(SessionStatus status, Failure error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SessionStateIdle value) idle,
    required TResult Function(_SessionStateProcessing value) processing,
    required TResult Function(_SessionStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SessionStateIdle value)? idle,
    TResult? Function(_SessionStateProcessing value)? processing,
    TResult? Function(_SessionStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SessionStateIdle value)? idle,
    TResult Function(_SessionStateProcessing value)? processing,
    TResult Function(_SessionStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SessionStateCopyWith<SessionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionStateCopyWith<$Res> {
  factory $SessionStateCopyWith(
          SessionState value, $Res Function(SessionState) then) =
      _$SessionStateCopyWithImpl<$Res, SessionState>;
  @useResult
  $Res call({SessionStatus status});
}

/// @nodoc
class _$SessionStateCopyWithImpl<$Res, $Val extends SessionState>
    implements $SessionStateCopyWith<$Res> {
  _$SessionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SessionStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionStateIdleImplCopyWith<$Res>
    implements $SessionStateCopyWith<$Res> {
  factory _$$SessionStateIdleImplCopyWith(_$SessionStateIdleImpl value,
          $Res Function(_$SessionStateIdleImpl) then) =
      __$$SessionStateIdleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SessionStatus status});
}

/// @nodoc
class __$$SessionStateIdleImplCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res, _$SessionStateIdleImpl>
    implements _$$SessionStateIdleImplCopyWith<$Res> {
  __$$SessionStateIdleImplCopyWithImpl(_$SessionStateIdleImpl _value,
      $Res Function(_$SessionStateIdleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$SessionStateIdleImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SessionStatus,
    ));
  }
}

/// @nodoc

class _$SessionStateIdleImpl extends _SessionStateIdle {
  const _$SessionStateIdleImpl({required this.status}) : super._();

  @override
  final SessionStatus status;

  @override
  String toString() {
    return 'SessionState.idle(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionStateIdleImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionStateIdleImplCopyWith<_$SessionStateIdleImpl> get copyWith =>
      __$$SessionStateIdleImplCopyWithImpl<_$SessionStateIdleImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SessionStatus status) idle,
    required TResult Function(SessionStatus status) processing,
    required TResult Function(SessionStatus status, Failure error) error,
  }) {
    return idle(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SessionStatus status)? idle,
    TResult? Function(SessionStatus status)? processing,
    TResult? Function(SessionStatus status, Failure error)? error,
  }) {
    return idle?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SessionStatus status)? idle,
    TResult Function(SessionStatus status)? processing,
    TResult Function(SessionStatus status, Failure error)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SessionStateIdle value) idle,
    required TResult Function(_SessionStateProcessing value) processing,
    required TResult Function(_SessionStateError value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SessionStateIdle value)? idle,
    TResult? Function(_SessionStateProcessing value)? processing,
    TResult? Function(_SessionStateError value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SessionStateIdle value)? idle,
    TResult Function(_SessionStateProcessing value)? processing,
    TResult Function(_SessionStateError value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _SessionStateIdle extends SessionState {
  const factory _SessionStateIdle({required final SessionStatus status}) =
      _$SessionStateIdleImpl;
  const _SessionStateIdle._() : super._();

  @override
  SessionStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$SessionStateIdleImplCopyWith<_$SessionStateIdleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SessionStateProcessingImplCopyWith<$Res>
    implements $SessionStateCopyWith<$Res> {
  factory _$$SessionStateProcessingImplCopyWith(
          _$SessionStateProcessingImpl value,
          $Res Function(_$SessionStateProcessingImpl) then) =
      __$$SessionStateProcessingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SessionStatus status});
}

/// @nodoc
class __$$SessionStateProcessingImplCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res, _$SessionStateProcessingImpl>
    implements _$$SessionStateProcessingImplCopyWith<$Res> {
  __$$SessionStateProcessingImplCopyWithImpl(
      _$SessionStateProcessingImpl _value,
      $Res Function(_$SessionStateProcessingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$SessionStateProcessingImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SessionStatus,
    ));
  }
}

/// @nodoc

class _$SessionStateProcessingImpl extends _SessionStateProcessing {
  const _$SessionStateProcessingImpl({required this.status}) : super._();

  @override
  final SessionStatus status;

  @override
  String toString() {
    return 'SessionState.processing(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionStateProcessingImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionStateProcessingImplCopyWith<_$SessionStateProcessingImpl>
      get copyWith => __$$SessionStateProcessingImplCopyWithImpl<
          _$SessionStateProcessingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SessionStatus status) idle,
    required TResult Function(SessionStatus status) processing,
    required TResult Function(SessionStatus status, Failure error) error,
  }) {
    return processing(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SessionStatus status)? idle,
    TResult? Function(SessionStatus status)? processing,
    TResult? Function(SessionStatus status, Failure error)? error,
  }) {
    return processing?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SessionStatus status)? idle,
    TResult Function(SessionStatus status)? processing,
    TResult Function(SessionStatus status, Failure error)? error,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SessionStateIdle value) idle,
    required TResult Function(_SessionStateProcessing value) processing,
    required TResult Function(_SessionStateError value) error,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SessionStateIdle value)? idle,
    TResult? Function(_SessionStateProcessing value)? processing,
    TResult? Function(_SessionStateError value)? error,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SessionStateIdle value)? idle,
    TResult Function(_SessionStateProcessing value)? processing,
    TResult Function(_SessionStateError value)? error,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class _SessionStateProcessing extends SessionState {
  const factory _SessionStateProcessing({required final SessionStatus status}) =
      _$SessionStateProcessingImpl;
  const _SessionStateProcessing._() : super._();

  @override
  SessionStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$SessionStateProcessingImplCopyWith<_$SessionStateProcessingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SessionStateErrorImplCopyWith<$Res>
    implements $SessionStateCopyWith<$Res> {
  factory _$$SessionStateErrorImplCopyWith(_$SessionStateErrorImpl value,
          $Res Function(_$SessionStateErrorImpl) then) =
      __$$SessionStateErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SessionStatus status, Failure error});
}

/// @nodoc
class __$$SessionStateErrorImplCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res, _$SessionStateErrorImpl>
    implements _$$SessionStateErrorImplCopyWith<$Res> {
  __$$SessionStateErrorImplCopyWithImpl(_$SessionStateErrorImpl _value,
      $Res Function(_$SessionStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = null,
  }) {
    return _then(_$SessionStateErrorImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SessionStatus,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$SessionStateErrorImpl extends _SessionStateError {
  const _$SessionStateErrorImpl({required this.status, required this.error})
      : super._();

  @override
  final SessionStatus status;
  @override
  final Failure error;

  @override
  String toString() {
    return 'SessionState.error(status: $status, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionStateErrorImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionStateErrorImplCopyWith<_$SessionStateErrorImpl> get copyWith =>
      __$$SessionStateErrorImplCopyWithImpl<_$SessionStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SessionStatus status) idle,
    required TResult Function(SessionStatus status) processing,
    required TResult Function(SessionStatus status, Failure error) error,
  }) {
    return error(status, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SessionStatus status)? idle,
    TResult? Function(SessionStatus status)? processing,
    TResult? Function(SessionStatus status, Failure error)? error,
  }) {
    return error?.call(status, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SessionStatus status)? idle,
    TResult Function(SessionStatus status)? processing,
    TResult Function(SessionStatus status, Failure error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(status, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SessionStateIdle value) idle,
    required TResult Function(_SessionStateProcessing value) processing,
    required TResult Function(_SessionStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SessionStateIdle value)? idle,
    TResult? Function(_SessionStateProcessing value)? processing,
    TResult? Function(_SessionStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SessionStateIdle value)? idle,
    TResult Function(_SessionStateProcessing value)? processing,
    TResult Function(_SessionStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _SessionStateError extends SessionState {
  const factory _SessionStateError(
      {required final SessionStatus status,
      required final Failure error}) = _$SessionStateErrorImpl;
  const _SessionStateError._() : super._();

  @override
  SessionStatus get status;
  Failure get error;
  @override
  @JsonKey(ignore: true)
  _$$SessionStateErrorImplCopyWith<_$SessionStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
