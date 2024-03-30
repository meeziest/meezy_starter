// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingsState {
  /// The current locale.
  Locale? get locale => throw _privateConstructorUsedError;

  /// The current theme mode.
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
    required TResult Function(_IdleSettingsState value) idle,
    required TResult Function(_ProcessingSettingsState value) processing,
    required TResult Function(_ErrorSettingsState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdleSettingsState value)? idle,
    TResult? Function(_ProcessingSettingsState value)? processing,
    TResult? Function(_ErrorSettingsState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleSettingsState value)? idle,
    TResult Function(_ProcessingSettingsState value)? processing,
    TResult Function(_ErrorSettingsState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsStateCopyWith<SettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res, SettingsState>;
  @useResult
  $Res call({Locale? locale, AppTheme? appTheme});
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res, $Val extends SettingsState>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

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
abstract class _$$IdleSettingsStateImplCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$IdleSettingsStateImplCopyWith(_$IdleSettingsStateImpl value,
          $Res Function(_$IdleSettingsStateImpl) then) =
      __$$IdleSettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Locale? locale, AppTheme? appTheme});
}

/// @nodoc
class __$$IdleSettingsStateImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$IdleSettingsStateImpl>
    implements _$$IdleSettingsStateImplCopyWith<$Res> {
  __$$IdleSettingsStateImplCopyWithImpl(_$IdleSettingsStateImpl _value,
      $Res Function(_$IdleSettingsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
    Object? appTheme = freezed,
  }) {
    return _then(_$IdleSettingsStateImpl(
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

class _$IdleSettingsStateImpl extends _IdleSettingsState {
  const _$IdleSettingsStateImpl({this.locale, this.appTheme}) : super._();

  /// The current locale.
  @override
  final Locale? locale;

  /// The current theme mode.
  @override
  final AppTheme? appTheme;

  @override
  String toString() {
    return 'SettingsState.idle(locale: $locale, appTheme: $appTheme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdleSettingsStateImpl &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.appTheme, appTheme) ||
                other.appTheme == appTheme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale, appTheme);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IdleSettingsStateImplCopyWith<_$IdleSettingsStateImpl> get copyWith =>
      __$$IdleSettingsStateImplCopyWithImpl<_$IdleSettingsStateImpl>(
          this, _$identity);

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
    required TResult Function(_IdleSettingsState value) idle,
    required TResult Function(_ProcessingSettingsState value) processing,
    required TResult Function(_ErrorSettingsState value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdleSettingsState value)? idle,
    TResult? Function(_ProcessingSettingsState value)? processing,
    TResult? Function(_ErrorSettingsState value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleSettingsState value)? idle,
    TResult Function(_ProcessingSettingsState value)? processing,
    TResult Function(_ErrorSettingsState value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _IdleSettingsState extends SettingsState {
  const factory _IdleSettingsState(
      {final Locale? locale,
      final AppTheme? appTheme}) = _$IdleSettingsStateImpl;
  const _IdleSettingsState._() : super._();

  @override

  /// The current locale.
  Locale? get locale;
  @override

  /// The current theme mode.
  AppTheme? get appTheme;
  @override
  @JsonKey(ignore: true)
  _$$IdleSettingsStateImplCopyWith<_$IdleSettingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProcessingSettingsStateImplCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$ProcessingSettingsStateImplCopyWith(
          _$ProcessingSettingsStateImpl value,
          $Res Function(_$ProcessingSettingsStateImpl) then) =
      __$$ProcessingSettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Locale? locale, AppTheme? appTheme});
}

/// @nodoc
class __$$ProcessingSettingsStateImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$ProcessingSettingsStateImpl>
    implements _$$ProcessingSettingsStateImplCopyWith<$Res> {
  __$$ProcessingSettingsStateImplCopyWithImpl(
      _$ProcessingSettingsStateImpl _value,
      $Res Function(_$ProcessingSettingsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
    Object? appTheme = freezed,
  }) {
    return _then(_$ProcessingSettingsStateImpl(
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

class _$ProcessingSettingsStateImpl extends _ProcessingSettingsState {
  const _$ProcessingSettingsStateImpl({this.locale, this.appTheme}) : super._();

  /// The current locale.
  @override
  final Locale? locale;

  /// The current theme mode.
  @override
  final AppTheme? appTheme;

  @override
  String toString() {
    return 'SettingsState.processing(locale: $locale, appTheme: $appTheme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessingSettingsStateImpl &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.appTheme, appTheme) ||
                other.appTheme == appTheme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale, appTheme);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessingSettingsStateImplCopyWith<_$ProcessingSettingsStateImpl>
      get copyWith => __$$ProcessingSettingsStateImplCopyWithImpl<
          _$ProcessingSettingsStateImpl>(this, _$identity);

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
    required TResult Function(_IdleSettingsState value) idle,
    required TResult Function(_ProcessingSettingsState value) processing,
    required TResult Function(_ErrorSettingsState value) error,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdleSettingsState value)? idle,
    TResult? Function(_ProcessingSettingsState value)? processing,
    TResult? Function(_ErrorSettingsState value)? error,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleSettingsState value)? idle,
    TResult Function(_ProcessingSettingsState value)? processing,
    TResult Function(_ErrorSettingsState value)? error,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class _ProcessingSettingsState extends SettingsState {
  const factory _ProcessingSettingsState(
      {final Locale? locale,
      final AppTheme? appTheme}) = _$ProcessingSettingsStateImpl;
  const _ProcessingSettingsState._() : super._();

  @override

  /// The current locale.
  Locale? get locale;
  @override

  /// The current theme mode.
  AppTheme? get appTheme;
  @override
  @JsonKey(ignore: true)
  _$$ProcessingSettingsStateImplCopyWith<_$ProcessingSettingsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorSettingsStateImplCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$ErrorSettingsStateImplCopyWith(_$ErrorSettingsStateImpl value,
          $Res Function(_$ErrorSettingsStateImpl) then) =
      __$$ErrorSettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object cause, Locale? locale, AppTheme? appTheme});
}

/// @nodoc
class __$$ErrorSettingsStateImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$ErrorSettingsStateImpl>
    implements _$$ErrorSettingsStateImplCopyWith<$Res> {
  __$$ErrorSettingsStateImplCopyWithImpl(_$ErrorSettingsStateImpl _value,
      $Res Function(_$ErrorSettingsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cause = null,
    Object? locale = freezed,
    Object? appTheme = freezed,
  }) {
    return _then(_$ErrorSettingsStateImpl(
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

class _$ErrorSettingsStateImpl extends _ErrorSettingsState {
  const _$ErrorSettingsStateImpl(
      {required this.cause, this.locale, this.appTheme})
      : super._();

  /// The error message.
  @override
  final Object cause;

  /// The current locale.
  @override
  final Locale? locale;

  /// The current theme mode.
  @override
  final AppTheme? appTheme;

  @override
  String toString() {
    return 'SettingsState.error(cause: $cause, locale: $locale, appTheme: $appTheme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorSettingsStateImpl &&
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
  _$$ErrorSettingsStateImplCopyWith<_$ErrorSettingsStateImpl> get copyWith =>
      __$$ErrorSettingsStateImplCopyWithImpl<_$ErrorSettingsStateImpl>(
          this, _$identity);

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
    required TResult Function(_IdleSettingsState value) idle,
    required TResult Function(_ProcessingSettingsState value) processing,
    required TResult Function(_ErrorSettingsState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IdleSettingsState value)? idle,
    TResult? Function(_ProcessingSettingsState value)? processing,
    TResult? Function(_ErrorSettingsState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleSettingsState value)? idle,
    TResult Function(_ProcessingSettingsState value)? processing,
    TResult Function(_ErrorSettingsState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorSettingsState extends SettingsState {
  const factory _ErrorSettingsState(
      {required final Object cause,
      final Locale? locale,
      final AppTheme? appTheme}) = _$ErrorSettingsStateImpl;
  const _ErrorSettingsState._() : super._();

  /// The error message.
  Object get cause;
  @override

  /// The current locale.
  Locale? get locale;
  @override

  /// The current theme mode.
  AppTheme? get appTheme;
  @override
  @JsonKey(ignore: true)
  _$$ErrorSettingsStateImplCopyWith<_$ErrorSettingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SettingsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppTheme appTheme) updateTheme,
    required TResult Function(Locale locale) updateLocale,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppTheme appTheme)? updateTheme,
    TResult? Function(Locale locale)? updateLocale,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppTheme appTheme)? updateTheme,
    TResult Function(Locale locale)? updateLocale,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateThemeSettingsEvent value) updateTheme,
    required TResult Function(_UpdateLocaleSettingsEvent value) updateLocale,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateThemeSettingsEvent value)? updateTheme,
    TResult? Function(_UpdateLocaleSettingsEvent value)? updateLocale,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateThemeSettingsEvent value)? updateTheme,
    TResult Function(_UpdateLocaleSettingsEvent value)? updateLocale,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsEventCopyWith<$Res> {
  factory $SettingsEventCopyWith(
          SettingsEvent value, $Res Function(SettingsEvent) then) =
      _$SettingsEventCopyWithImpl<$Res, SettingsEvent>;
}

/// @nodoc
class _$SettingsEventCopyWithImpl<$Res, $Val extends SettingsEvent>
    implements $SettingsEventCopyWith<$Res> {
  _$SettingsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UpdateThemeSettingsEventImplCopyWith<$Res> {
  factory _$$UpdateThemeSettingsEventImplCopyWith(
          _$UpdateThemeSettingsEventImpl value,
          $Res Function(_$UpdateThemeSettingsEventImpl) then) =
      __$$UpdateThemeSettingsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppTheme appTheme});
}

/// @nodoc
class __$$UpdateThemeSettingsEventImplCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res, _$UpdateThemeSettingsEventImpl>
    implements _$$UpdateThemeSettingsEventImplCopyWith<$Res> {
  __$$UpdateThemeSettingsEventImplCopyWithImpl(
      _$UpdateThemeSettingsEventImpl _value,
      $Res Function(_$UpdateThemeSettingsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appTheme = null,
  }) {
    return _then(_$UpdateThemeSettingsEventImpl(
      appTheme: null == appTheme
          ? _value.appTheme
          : appTheme // ignore: cast_nullable_to_non_nullable
              as AppTheme,
    ));
  }
}

/// @nodoc

class _$UpdateThemeSettingsEventImpl extends _UpdateThemeSettingsEvent {
  const _$UpdateThemeSettingsEventImpl({required this.appTheme}) : super._();

  /// The new theme mode.
  @override
  final AppTheme appTheme;

  @override
  String toString() {
    return 'SettingsEvent.updateTheme(appTheme: $appTheme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateThemeSettingsEventImpl &&
            (identical(other.appTheme, appTheme) ||
                other.appTheme == appTheme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appTheme);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateThemeSettingsEventImplCopyWith<_$UpdateThemeSettingsEventImpl>
      get copyWith => __$$UpdateThemeSettingsEventImplCopyWithImpl<
          _$UpdateThemeSettingsEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppTheme appTheme) updateTheme,
    required TResult Function(Locale locale) updateLocale,
  }) {
    return updateTheme(appTheme);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppTheme appTheme)? updateTheme,
    TResult? Function(Locale locale)? updateLocale,
  }) {
    return updateTheme?.call(appTheme);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppTheme appTheme)? updateTheme,
    TResult Function(Locale locale)? updateLocale,
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
    required TResult Function(_UpdateThemeSettingsEvent value) updateTheme,
    required TResult Function(_UpdateLocaleSettingsEvent value) updateLocale,
  }) {
    return updateTheme(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateThemeSettingsEvent value)? updateTheme,
    TResult? Function(_UpdateLocaleSettingsEvent value)? updateLocale,
  }) {
    return updateTheme?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateThemeSettingsEvent value)? updateTheme,
    TResult Function(_UpdateLocaleSettingsEvent value)? updateLocale,
    required TResult orElse(),
  }) {
    if (updateTheme != null) {
      return updateTheme(this);
    }
    return orElse();
  }
}

abstract class _UpdateThemeSettingsEvent extends SettingsEvent {
  const factory _UpdateThemeSettingsEvent({required final AppTheme appTheme}) =
      _$UpdateThemeSettingsEventImpl;
  const _UpdateThemeSettingsEvent._() : super._();

  /// The new theme mode.
  AppTheme get appTheme;
  @JsonKey(ignore: true)
  _$$UpdateThemeSettingsEventImplCopyWith<_$UpdateThemeSettingsEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateLocaleSettingsEventImplCopyWith<$Res> {
  factory _$$UpdateLocaleSettingsEventImplCopyWith(
          _$UpdateLocaleSettingsEventImpl value,
          $Res Function(_$UpdateLocaleSettingsEventImpl) then) =
      __$$UpdateLocaleSettingsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Locale locale});
}

/// @nodoc
class __$$UpdateLocaleSettingsEventImplCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res, _$UpdateLocaleSettingsEventImpl>
    implements _$$UpdateLocaleSettingsEventImplCopyWith<$Res> {
  __$$UpdateLocaleSettingsEventImplCopyWithImpl(
      _$UpdateLocaleSettingsEventImpl _value,
      $Res Function(_$UpdateLocaleSettingsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$UpdateLocaleSettingsEventImpl(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _$UpdateLocaleSettingsEventImpl extends _UpdateLocaleSettingsEvent {
  const _$UpdateLocaleSettingsEventImpl({required this.locale}) : super._();

  /// The new locale.
  @override
  final Locale locale;

  @override
  String toString() {
    return 'SettingsEvent.updateLocale(locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateLocaleSettingsEventImpl &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateLocaleSettingsEventImplCopyWith<_$UpdateLocaleSettingsEventImpl>
      get copyWith => __$$UpdateLocaleSettingsEventImplCopyWithImpl<
          _$UpdateLocaleSettingsEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppTheme appTheme) updateTheme,
    required TResult Function(Locale locale) updateLocale,
  }) {
    return updateLocale(locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppTheme appTheme)? updateTheme,
    TResult? Function(Locale locale)? updateLocale,
  }) {
    return updateLocale?.call(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppTheme appTheme)? updateTheme,
    TResult Function(Locale locale)? updateLocale,
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
    required TResult Function(_UpdateThemeSettingsEvent value) updateTheme,
    required TResult Function(_UpdateLocaleSettingsEvent value) updateLocale,
  }) {
    return updateLocale(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateThemeSettingsEvent value)? updateTheme,
    TResult? Function(_UpdateLocaleSettingsEvent value)? updateLocale,
  }) {
    return updateLocale?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateThemeSettingsEvent value)? updateTheme,
    TResult Function(_UpdateLocaleSettingsEvent value)? updateLocale,
    required TResult orElse(),
  }) {
    if (updateLocale != null) {
      return updateLocale(this);
    }
    return orElse();
  }
}

abstract class _UpdateLocaleSettingsEvent extends SettingsEvent {
  const factory _UpdateLocaleSettingsEvent({required final Locale locale}) =
      _$UpdateLocaleSettingsEventImpl;
  const _UpdateLocaleSettingsEvent._() : super._();

  /// The new locale.
  Locale get locale;
  @JsonKey(ignore: true)
  _$$UpdateLocaleSettingsEventImplCopyWith<_$UpdateLocaleSettingsEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}
