// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppState {
  Locale? get locale => throw _privateConstructorUsedError;
  AppTheme? get appTheme => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Locale? locale, AppTheme? appTheme) idle,
    required TResult Function(Locale? locale, AppTheme? appTheme) processing,
    required TResult Function(Object cause, Locale? locale, AppTheme? appTheme)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Locale? locale, AppTheme? appTheme)? idle,
    TResult? Function(Locale? locale, AppTheme? appTheme)? processing,
    TResult? Function(Object cause, Locale? locale, AppTheme? appTheme)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Locale? locale, AppTheme? appTheme)? idle,
    TResult Function(Locale? locale, AppTheme? appTheme)? processing,
    TResult Function(Object cause, Locale? locale, AppTheme? appTheme)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdleAppState value) idle,
    required TResult Function(_ProcessingAppState value) processing,
    required TResult Function(_ErrorAppState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdleAppState value)? idle,
    TResult? Function(_ProcessingAppState value)? processing,
    TResult? Function(_ErrorAppState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleAppState value)? idle,
    TResult Function(_ProcessingAppState value)? processing,
    TResult Function(_ErrorAppState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call({Locale? locale, AppTheme? appTheme});
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
    Object? appTheme = freezed,
  }) {
    return _then(_value.copyWith(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
      appTheme: freezed == appTheme
          ? _value.appTheme
          : appTheme // ignore: cast_nullable_to_non_nullable
              as AppTheme?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IdleAppStateImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$IdleAppStateImplCopyWith(
          _$IdleAppStateImpl value, $Res Function(_$IdleAppStateImpl) then) =
      __$$IdleAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Locale? locale, AppTheme? appTheme});
}

/// @nodoc
class __$$IdleAppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$IdleAppStateImpl>
    implements _$$IdleAppStateImplCopyWith<$Res> {
  __$$IdleAppStateImplCopyWithImpl(
      _$IdleAppStateImpl _value, $Res Function(_$IdleAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
    Object? appTheme = freezed,
  }) {
    return _then(_$IdleAppStateImpl(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
      appTheme: freezed == appTheme
          ? _value.appTheme
          : appTheme // ignore: cast_nullable_to_non_nullable
              as AppTheme?,
    ));
  }
}

/// @nodoc

class _$IdleAppStateImpl extends _IdleAppState {
  const _$IdleAppStateImpl({this.locale, this.appTheme}) : super._();

  @override
  final Locale? locale;
  @override
  final AppTheme? appTheme;

  @override
  String toString() {
    return 'AppState.idle(locale: $locale, appTheme: $appTheme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdleAppStateImpl &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.appTheme, appTheme) ||
                other.appTheme == appTheme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale, appTheme);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdleAppStateImplCopyWith<_$IdleAppStateImpl> get copyWith =>
      __$$IdleAppStateImplCopyWithImpl<_$IdleAppStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Locale? locale, AppTheme? appTheme) idle,
    required TResult Function(Locale? locale, AppTheme? appTheme) processing,
    required TResult Function(Object cause, Locale? locale, AppTheme? appTheme)
        error,
  }) {
    return idle(locale, appTheme);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Locale? locale, AppTheme? appTheme)? idle,
    TResult? Function(Locale? locale, AppTheme? appTheme)? processing,
    TResult? Function(Object cause, Locale? locale, AppTheme? appTheme)? error,
  }) {
    return idle?.call(locale, appTheme);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Locale? locale, AppTheme? appTheme)? idle,
    TResult Function(Locale? locale, AppTheme? appTheme)? processing,
    TResult Function(Object cause, Locale? locale, AppTheme? appTheme)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(locale, appTheme);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdleAppState value) idle,
    required TResult Function(_ProcessingAppState value) processing,
    required TResult Function(_ErrorAppState value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdleAppState value)? idle,
    TResult? Function(_ProcessingAppState value)? processing,
    TResult? Function(_ErrorAppState value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleAppState value)? idle,
    TResult Function(_ProcessingAppState value)? processing,
    TResult Function(_ErrorAppState value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _IdleAppState extends AppState {
  const factory _IdleAppState(
      {final Locale? locale, final AppTheme? appTheme}) = _$IdleAppStateImpl;
  const _IdleAppState._() : super._();

  @override
  Locale? get locale;
  @override
  AppTheme? get appTheme;
  @override
  @JsonKey(ignore: true)
  _$$IdleAppStateImplCopyWith<_$IdleAppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProcessingAppStateImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$ProcessingAppStateImplCopyWith(_$ProcessingAppStateImpl value,
          $Res Function(_$ProcessingAppStateImpl) then) =
      __$$ProcessingAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Locale? locale, AppTheme? appTheme});
}

/// @nodoc
class __$$ProcessingAppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$ProcessingAppStateImpl>
    implements _$$ProcessingAppStateImplCopyWith<$Res> {
  __$$ProcessingAppStateImplCopyWithImpl(_$ProcessingAppStateImpl _value,
      $Res Function(_$ProcessingAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
    Object? appTheme = freezed,
  }) {
    return _then(_$ProcessingAppStateImpl(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
      appTheme: freezed == appTheme
          ? _value.appTheme
          : appTheme // ignore: cast_nullable_to_non_nullable
              as AppTheme?,
    ));
  }
}

/// @nodoc

class _$ProcessingAppStateImpl extends _ProcessingAppState {
  const _$ProcessingAppStateImpl({this.locale, this.appTheme}) : super._();

  @override
  final Locale? locale;
  @override
  final AppTheme? appTheme;

  @override
  String toString() {
    return 'AppState.processing(locale: $locale, appTheme: $appTheme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessingAppStateImpl &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.appTheme, appTheme) ||
                other.appTheme == appTheme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale, appTheme);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessingAppStateImplCopyWith<_$ProcessingAppStateImpl> get copyWith =>
      __$$ProcessingAppStateImplCopyWithImpl<_$ProcessingAppStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Locale? locale, AppTheme? appTheme) idle,
    required TResult Function(Locale? locale, AppTheme? appTheme) processing,
    required TResult Function(Object cause, Locale? locale, AppTheme? appTheme)
        error,
  }) {
    return processing(locale, appTheme);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Locale? locale, AppTheme? appTheme)? idle,
    TResult? Function(Locale? locale, AppTheme? appTheme)? processing,
    TResult? Function(Object cause, Locale? locale, AppTheme? appTheme)? error,
  }) {
    return processing?.call(locale, appTheme);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Locale? locale, AppTheme? appTheme)? idle,
    TResult Function(Locale? locale, AppTheme? appTheme)? processing,
    TResult Function(Object cause, Locale? locale, AppTheme? appTheme)? error,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(locale, appTheme);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdleAppState value) idle,
    required TResult Function(_ProcessingAppState value) processing,
    required TResult Function(_ErrorAppState value) error,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdleAppState value)? idle,
    TResult? Function(_ProcessingAppState value)? processing,
    TResult? Function(_ErrorAppState value)? error,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleAppState value)? idle,
    TResult Function(_ProcessingAppState value)? processing,
    TResult Function(_ErrorAppState value)? error,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class _ProcessingAppState extends AppState {
  const factory _ProcessingAppState(
      {final Locale? locale,
      final AppTheme? appTheme}) = _$ProcessingAppStateImpl;
  const _ProcessingAppState._() : super._();

  @override
  Locale? get locale;
  @override
  AppTheme? get appTheme;
  @override
  @JsonKey(ignore: true)
  _$$ProcessingAppStateImplCopyWith<_$ProcessingAppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorAppStateImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$ErrorAppStateImplCopyWith(
          _$ErrorAppStateImpl value, $Res Function(_$ErrorAppStateImpl) then) =
      __$$ErrorAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object cause, Locale? locale, AppTheme? appTheme});
}

/// @nodoc
class __$$ErrorAppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$ErrorAppStateImpl>
    implements _$$ErrorAppStateImplCopyWith<$Res> {
  __$$ErrorAppStateImplCopyWithImpl(
      _$ErrorAppStateImpl _value, $Res Function(_$ErrorAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cause = null,
    Object? locale = freezed,
    Object? appTheme = freezed,
  }) {
    return _then(_$ErrorAppStateImpl(
      cause: null == cause ? _value.cause : cause,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
      appTheme: freezed == appTheme
          ? _value.appTheme
          : appTheme // ignore: cast_nullable_to_non_nullable
              as AppTheme?,
    ));
  }
}

/// @nodoc

class _$ErrorAppStateImpl extends _ErrorAppState {
  const _$ErrorAppStateImpl({required this.cause, this.locale, this.appTheme})
      : super._();

  @override
  final Object cause;
  @override
  final Locale? locale;
  @override
  final AppTheme? appTheme;

  @override
  String toString() {
    return 'AppState.error(cause: $cause, locale: $locale, appTheme: $appTheme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorAppStateImpl &&
            const DeepCollectionEquality().equals(other.cause, cause) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.appTheme, appTheme) ||
                other.appTheme == appTheme));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(cause), locale, appTheme);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorAppStateImplCopyWith<_$ErrorAppStateImpl> get copyWith =>
      __$$ErrorAppStateImplCopyWithImpl<_$ErrorAppStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Locale? locale, AppTheme? appTheme) idle,
    required TResult Function(Locale? locale, AppTheme? appTheme) processing,
    required TResult Function(Object cause, Locale? locale, AppTheme? appTheme)
        error,
  }) {
    return error(cause, locale, appTheme);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Locale? locale, AppTheme? appTheme)? idle,
    TResult? Function(Locale? locale, AppTheme? appTheme)? processing,
    TResult? Function(Object cause, Locale? locale, AppTheme? appTheme)? error,
  }) {
    return error?.call(cause, locale, appTheme);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Locale? locale, AppTheme? appTheme)? idle,
    TResult Function(Locale? locale, AppTheme? appTheme)? processing,
    TResult Function(Object cause, Locale? locale, AppTheme? appTheme)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(cause, locale, appTheme);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdleAppState value) idle,
    required TResult Function(_ProcessingAppState value) processing,
    required TResult Function(_ErrorAppState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdleAppState value)? idle,
    TResult? Function(_ProcessingAppState value)? processing,
    TResult? Function(_ErrorAppState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleAppState value)? idle,
    TResult Function(_ProcessingAppState value)? processing,
    TResult Function(_ErrorAppState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorAppState extends AppState {
  const factory _ErrorAppState(
      {required final Object cause,
      final Locale? locale,
      final AppTheme? appTheme}) = _$ErrorAppStateImpl;
  const _ErrorAppState._() : super._();

  Object get cause;
  @override
  Locale? get locale;
  @override
  AppTheme? get appTheme;
  @override
  @JsonKey(ignore: true)
  _$$ErrorAppStateImplCopyWith<_$ErrorAppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppTheme appTheme) updateTheme,
    required TResult Function(Locale locale) updateLocale,
    required TResult Function() setSeenWelcome,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppTheme appTheme)? updateTheme,
    TResult? Function(Locale locale)? updateLocale,
    TResult? Function()? setSeenWelcome,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppTheme appTheme)? updateTheme,
    TResult Function(Locale locale)? updateLocale,
    TResult Function()? setSeenWelcome,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateThemeAppEvent value) updateTheme,
    required TResult Function(_UpdateLocaleAppEvent value) updateLocale,
    required TResult Function(_SetSeenWelcome value) setSeenWelcome,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateThemeAppEvent value)? updateTheme,
    TResult? Function(_UpdateLocaleAppEvent value)? updateLocale,
    TResult? Function(_SetSeenWelcome value)? setSeenWelcome,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateThemeAppEvent value)? updateTheme,
    TResult Function(_UpdateLocaleAppEvent value)? updateLocale,
    TResult Function(_SetSeenWelcome value)? setSeenWelcome,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEventCopyWith<$Res> {
  factory $AppEventCopyWith(AppEvent value, $Res Function(AppEvent) then) =
      _$AppEventCopyWithImpl<$Res, AppEvent>;
}

/// @nodoc
class _$AppEventCopyWithImpl<$Res, $Val extends AppEvent>
    implements $AppEventCopyWith<$Res> {
  _$AppEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UpdateThemeAppEventImplCopyWith<$Res> {
  factory _$$UpdateThemeAppEventImplCopyWith(_$UpdateThemeAppEventImpl value,
          $Res Function(_$UpdateThemeAppEventImpl) then) =
      __$$UpdateThemeAppEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppTheme appTheme});
}

/// @nodoc
class __$$UpdateThemeAppEventImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$UpdateThemeAppEventImpl>
    implements _$$UpdateThemeAppEventImplCopyWith<$Res> {
  __$$UpdateThemeAppEventImplCopyWithImpl(_$UpdateThemeAppEventImpl _value,
      $Res Function(_$UpdateThemeAppEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appTheme = null,
  }) {
    return _then(_$UpdateThemeAppEventImpl(
      appTheme: null == appTheme
          ? _value.appTheme
          : appTheme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
    ));
  }
}

/// @nodoc

class _$UpdateThemeAppEventImpl extends _UpdateThemeAppEvent {
  const _$UpdateThemeAppEventImpl({required this.appTheme}) : super._();

  @override
  final AppTheme appTheme;

  @override
  String toString() {
    return 'AppEvent.updateTheme(appTheme: $appTheme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateThemeAppEventImpl &&
            (identical(other.appTheme, appTheme) ||
                other.appTheme == appTheme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appTheme);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateThemeAppEventImplCopyWith<_$UpdateThemeAppEventImpl> get copyWith =>
      __$$UpdateThemeAppEventImplCopyWithImpl<_$UpdateThemeAppEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppTheme appTheme) updateTheme,
    required TResult Function(Locale locale) updateLocale,
    required TResult Function() setSeenWelcome,
  }) {
    return updateTheme(appTheme);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppTheme appTheme)? updateTheme,
    TResult? Function(Locale locale)? updateLocale,
    TResult? Function()? setSeenWelcome,
  }) {
    return updateTheme?.call(appTheme);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppTheme appTheme)? updateTheme,
    TResult Function(Locale locale)? updateLocale,
    TResult Function()? setSeenWelcome,
    required TResult orElse(),
  }) {
    if (updateTheme != null) {
      return updateTheme(appTheme);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateThemeAppEvent value) updateTheme,
    required TResult Function(_UpdateLocaleAppEvent value) updateLocale,
    required TResult Function(_SetSeenWelcome value) setSeenWelcome,
  }) {
    return updateTheme(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateThemeAppEvent value)? updateTheme,
    TResult? Function(_UpdateLocaleAppEvent value)? updateLocale,
    TResult? Function(_SetSeenWelcome value)? setSeenWelcome,
  }) {
    return updateTheme?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateThemeAppEvent value)? updateTheme,
    TResult Function(_UpdateLocaleAppEvent value)? updateLocale,
    TResult Function(_SetSeenWelcome value)? setSeenWelcome,
    required TResult orElse(),
  }) {
    if (updateTheme != null) {
      return updateTheme(this);
    }
    return orElse();
  }
}

abstract class _UpdateThemeAppEvent extends AppEvent {
  const factory _UpdateThemeAppEvent({required final AppTheme appTheme}) =
      _$UpdateThemeAppEventImpl;
  const _UpdateThemeAppEvent._() : super._();

  AppTheme get appTheme;
  @JsonKey(ignore: true)
  _$$UpdateThemeAppEventImplCopyWith<_$UpdateThemeAppEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateLocaleAppEventImplCopyWith<$Res> {
  factory _$$UpdateLocaleAppEventImplCopyWith(_$UpdateLocaleAppEventImpl value,
          $Res Function(_$UpdateLocaleAppEventImpl) then) =
      __$$UpdateLocaleAppEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Locale locale});
}

/// @nodoc
class __$$UpdateLocaleAppEventImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$UpdateLocaleAppEventImpl>
    implements _$$UpdateLocaleAppEventImplCopyWith<$Res> {
  __$$UpdateLocaleAppEventImplCopyWithImpl(_$UpdateLocaleAppEventImpl _value,
      $Res Function(_$UpdateLocaleAppEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$UpdateLocaleAppEventImpl(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _$UpdateLocaleAppEventImpl extends _UpdateLocaleAppEvent {
  const _$UpdateLocaleAppEventImpl({required this.locale}) : super._();

  @override
  final Locale locale;

  @override
  String toString() {
    return 'AppEvent.updateLocale(locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateLocaleAppEventImpl &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateLocaleAppEventImplCopyWith<_$UpdateLocaleAppEventImpl>
      get copyWith =>
          __$$UpdateLocaleAppEventImplCopyWithImpl<_$UpdateLocaleAppEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppTheme appTheme) updateTheme,
    required TResult Function(Locale locale) updateLocale,
    required TResult Function() setSeenWelcome,
  }) {
    return updateLocale(locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppTheme appTheme)? updateTheme,
    TResult? Function(Locale locale)? updateLocale,
    TResult? Function()? setSeenWelcome,
  }) {
    return updateLocale?.call(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppTheme appTheme)? updateTheme,
    TResult Function(Locale locale)? updateLocale,
    TResult Function()? setSeenWelcome,
    required TResult orElse(),
  }) {
    if (updateLocale != null) {
      return updateLocale(locale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateThemeAppEvent value) updateTheme,
    required TResult Function(_UpdateLocaleAppEvent value) updateLocale,
    required TResult Function(_SetSeenWelcome value) setSeenWelcome,
  }) {
    return updateLocale(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateThemeAppEvent value)? updateTheme,
    TResult? Function(_UpdateLocaleAppEvent value)? updateLocale,
    TResult? Function(_SetSeenWelcome value)? setSeenWelcome,
  }) {
    return updateLocale?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateThemeAppEvent value)? updateTheme,
    TResult Function(_UpdateLocaleAppEvent value)? updateLocale,
    TResult Function(_SetSeenWelcome value)? setSeenWelcome,
    required TResult orElse(),
  }) {
    if (updateLocale != null) {
      return updateLocale(this);
    }
    return orElse();
  }
}

abstract class _UpdateLocaleAppEvent extends AppEvent {
  const factory _UpdateLocaleAppEvent({required final Locale locale}) =
      _$UpdateLocaleAppEventImpl;
  const _UpdateLocaleAppEvent._() : super._();

  Locale get locale;
  @JsonKey(ignore: true)
  _$$UpdateLocaleAppEventImplCopyWith<_$UpdateLocaleAppEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetSeenWelcomeImplCopyWith<$Res> {
  factory _$$SetSeenWelcomeImplCopyWith(_$SetSeenWelcomeImpl value,
          $Res Function(_$SetSeenWelcomeImpl) then) =
      __$$SetSeenWelcomeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SetSeenWelcomeImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$SetSeenWelcomeImpl>
    implements _$$SetSeenWelcomeImplCopyWith<$Res> {
  __$$SetSeenWelcomeImplCopyWithImpl(
      _$SetSeenWelcomeImpl _value, $Res Function(_$SetSeenWelcomeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SetSeenWelcomeImpl extends _SetSeenWelcome {
  const _$SetSeenWelcomeImpl() : super._();

  @override
  String toString() {
    return 'AppEvent.setSeenWelcome()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SetSeenWelcomeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppTheme appTheme) updateTheme,
    required TResult Function(Locale locale) updateLocale,
    required TResult Function() setSeenWelcome,
  }) {
    return setSeenWelcome();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppTheme appTheme)? updateTheme,
    TResult? Function(Locale locale)? updateLocale,
    TResult? Function()? setSeenWelcome,
  }) {
    return setSeenWelcome?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppTheme appTheme)? updateTheme,
    TResult Function(Locale locale)? updateLocale,
    TResult Function()? setSeenWelcome,
    required TResult orElse(),
  }) {
    if (setSeenWelcome != null) {
      return setSeenWelcome();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateThemeAppEvent value) updateTheme,
    required TResult Function(_UpdateLocaleAppEvent value) updateLocale,
    required TResult Function(_SetSeenWelcome value) setSeenWelcome,
  }) {
    return setSeenWelcome(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateThemeAppEvent value)? updateTheme,
    TResult? Function(_UpdateLocaleAppEvent value)? updateLocale,
    TResult? Function(_SetSeenWelcome value)? setSeenWelcome,
  }) {
    return setSeenWelcome?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateThemeAppEvent value)? updateTheme,
    TResult Function(_UpdateLocaleAppEvent value)? updateLocale,
    TResult Function(_SetSeenWelcome value)? setSeenWelcome,
    required TResult orElse(),
  }) {
    if (setSeenWelcome != null) {
      return setSeenWelcome(this);
    }
    return orElse();
  }
}

abstract class _SetSeenWelcome extends AppEvent {
  const factory _SetSeenWelcome() = _$SetSeenWelcomeImpl;
  const _SetSeenWelcome._() : super._();
}
