// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppState {
  Locale? get locale;
  ThemeMode? get themeMode;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppStateCopyWith<AppState> get copyWith =>
      _$AppStateCopyWithImpl<AppState>(this as AppState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppState &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale, themeMode);

  @override
  String toString() {
    return 'AppState(locale: $locale, themeMode: $themeMode)';
  }
}

/// @nodoc
abstract mixin class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) _then) =
      _$AppStateCopyWithImpl;
  @useResult
  $Res call({Locale? locale, ThemeMode? themeMode});
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._self, this._then);

  final AppState _self;
  final $Res Function(AppState) _then;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
    Object? themeMode = freezed,
  }) {
    return _then(_self.copyWith(
      locale: freezed == locale
          ? _self.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
      themeMode: freezed == themeMode
          ? _self.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode?,
    ));
  }
}

/// @nodoc

class _IdleAppState extends AppState {
  const _IdleAppState({this.locale, this.themeMode}) : super._();

  @override
  final Locale? locale;
  @override
  final ThemeMode? themeMode;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IdleAppStateCopyWith<_IdleAppState> get copyWith =>
      __$IdleAppStateCopyWithImpl<_IdleAppState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IdleAppState &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale, themeMode);

  @override
  String toString() {
    return 'AppState.idle(locale: $locale, themeMode: $themeMode)';
  }
}

/// @nodoc
abstract mixin class _$IdleAppStateCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$IdleAppStateCopyWith(
          _IdleAppState value, $Res Function(_IdleAppState) _then) =
      __$IdleAppStateCopyWithImpl;
  @override
  @useResult
  $Res call({Locale? locale, ThemeMode? themeMode});
}

/// @nodoc
class __$IdleAppStateCopyWithImpl<$Res>
    implements _$IdleAppStateCopyWith<$Res> {
  __$IdleAppStateCopyWithImpl(this._self, this._then);

  final _IdleAppState _self;
  final $Res Function(_IdleAppState) _then;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? locale = freezed,
    Object? themeMode = freezed,
  }) {
    return _then(_IdleAppState(
      locale: freezed == locale
          ? _self.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
      themeMode: freezed == themeMode
          ? _self.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode?,
    ));
  }
}

/// @nodoc

class _ProcessingAppState extends AppState {
  const _ProcessingAppState({this.locale, this.themeMode}) : super._();

  @override
  final Locale? locale;
  @override
  final ThemeMode? themeMode;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProcessingAppStateCopyWith<_ProcessingAppState> get copyWith =>
      __$ProcessingAppStateCopyWithImpl<_ProcessingAppState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProcessingAppState &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale, themeMode);

  @override
  String toString() {
    return 'AppState.processing(locale: $locale, themeMode: $themeMode)';
  }
}

/// @nodoc
abstract mixin class _$ProcessingAppStateCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$ProcessingAppStateCopyWith(
          _ProcessingAppState value, $Res Function(_ProcessingAppState) _then) =
      __$ProcessingAppStateCopyWithImpl;
  @override
  @useResult
  $Res call({Locale? locale, ThemeMode? themeMode});
}

/// @nodoc
class __$ProcessingAppStateCopyWithImpl<$Res>
    implements _$ProcessingAppStateCopyWith<$Res> {
  __$ProcessingAppStateCopyWithImpl(this._self, this._then);

  final _ProcessingAppState _self;
  final $Res Function(_ProcessingAppState) _then;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? locale = freezed,
    Object? themeMode = freezed,
  }) {
    return _then(_ProcessingAppState(
      locale: freezed == locale
          ? _self.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
      themeMode: freezed == themeMode
          ? _self.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode?,
    ));
  }
}

/// @nodoc

class _ErrorAppState extends AppState {
  const _ErrorAppState({required this.cause, this.locale, this.themeMode})
      : super._();

  final Object cause;
  @override
  final Locale? locale;
  @override
  final ThemeMode? themeMode;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorAppStateCopyWith<_ErrorAppState> get copyWith =>
      __$ErrorAppStateCopyWithImpl<_ErrorAppState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ErrorAppState &&
            const DeepCollectionEquality().equals(other.cause, cause) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(cause), locale, themeMode);

  @override
  String toString() {
    return 'AppState.error(cause: $cause, locale: $locale, themeMode: $themeMode)';
  }
}

/// @nodoc
abstract mixin class _$ErrorAppStateCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$ErrorAppStateCopyWith(
          _ErrorAppState value, $Res Function(_ErrorAppState) _then) =
      __$ErrorAppStateCopyWithImpl;
  @override
  @useResult
  $Res call({Object cause, Locale? locale, ThemeMode? themeMode});
}

/// @nodoc
class __$ErrorAppStateCopyWithImpl<$Res>
    implements _$ErrorAppStateCopyWith<$Res> {
  __$ErrorAppStateCopyWithImpl(this._self, this._then);

  final _ErrorAppState _self;
  final $Res Function(_ErrorAppState) _then;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cause = null,
    Object? locale = freezed,
    Object? themeMode = freezed,
  }) {
    return _then(_ErrorAppState(
      cause: null == cause ? _self.cause : cause,
      locale: freezed == locale
          ? _self.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
      themeMode: freezed == themeMode
          ? _self.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode?,
    ));
  }
}

/// @nodoc
mixin _$AppEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AppEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AppEvent()';
  }
}

/// @nodoc
class $AppEventCopyWith<$Res> {
  $AppEventCopyWith(AppEvent _, $Res Function(AppEvent) __);
}

/// @nodoc

class _UpdateThemeAppEvent extends AppEvent {
  const _UpdateThemeAppEvent({required this.appTheme}) : super._();

  final ThemeMode appTheme;

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateThemeAppEventCopyWith<_UpdateThemeAppEvent> get copyWith =>
      __$UpdateThemeAppEventCopyWithImpl<_UpdateThemeAppEvent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateThemeAppEvent &&
            (identical(other.appTheme, appTheme) ||
                other.appTheme == appTheme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appTheme);

  @override
  String toString() {
    return 'AppEvent.updateTheme(appTheme: $appTheme)';
  }
}

/// @nodoc
abstract mixin class _$UpdateThemeAppEventCopyWith<$Res>
    implements $AppEventCopyWith<$Res> {
  factory _$UpdateThemeAppEventCopyWith(_UpdateThemeAppEvent value,
          $Res Function(_UpdateThemeAppEvent) _then) =
      __$UpdateThemeAppEventCopyWithImpl;
  @useResult
  $Res call({ThemeMode appTheme});
}

/// @nodoc
class __$UpdateThemeAppEventCopyWithImpl<$Res>
    implements _$UpdateThemeAppEventCopyWith<$Res> {
  __$UpdateThemeAppEventCopyWithImpl(this._self, this._then);

  final _UpdateThemeAppEvent _self;
  final $Res Function(_UpdateThemeAppEvent) _then;

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? appTheme = null,
  }) {
    return _then(_UpdateThemeAppEvent(
      appTheme: null == appTheme
          ? _self.appTheme
          : appTheme // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ));
  }
}

/// @nodoc

class _UpdateLocaleAppEvent extends AppEvent {
  const _UpdateLocaleAppEvent({required this.locale}) : super._();

  final Locale locale;

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateLocaleAppEventCopyWith<_UpdateLocaleAppEvent> get copyWith =>
      __$UpdateLocaleAppEventCopyWithImpl<_UpdateLocaleAppEvent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateLocaleAppEvent &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @override
  String toString() {
    return 'AppEvent.updateLocale(locale: $locale)';
  }
}

/// @nodoc
abstract mixin class _$UpdateLocaleAppEventCopyWith<$Res>
    implements $AppEventCopyWith<$Res> {
  factory _$UpdateLocaleAppEventCopyWith(_UpdateLocaleAppEvent value,
          $Res Function(_UpdateLocaleAppEvent) _then) =
      __$UpdateLocaleAppEventCopyWithImpl;
  @useResult
  $Res call({Locale locale});
}

/// @nodoc
class __$UpdateLocaleAppEventCopyWithImpl<$Res>
    implements _$UpdateLocaleAppEventCopyWith<$Res> {
  __$UpdateLocaleAppEventCopyWithImpl(this._self, this._then);

  final _UpdateLocaleAppEvent _self;
  final $Res Function(_UpdateLocaleAppEvent) _then;

  /// Create a copy of AppEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? locale = null,
  }) {
    return _then(_UpdateLocaleAppEvent(
      locale: null == locale
          ? _self.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _SetSeenWelcome extends AppEvent {
  const _SetSeenWelcome() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SetSeenWelcome);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AppEvent.setSeenWelcome()';
  }
}

/// @nodoc
class _$SetSeenWelcomeCopyWith<$Res> implements $AppEventCopyWith<$Res> {
  _$SetSeenWelcomeCopyWith(
      _SetSeenWelcome _, $Res Function(_SetSeenWelcome) __);
}

/// @nodoc
class __$SetSeenWelcomeCopyWithImpl<$Res>
    implements _$SetSeenWelcomeCopyWith<$Res> {
  __$SetSeenWelcomeCopyWithImpl(this._self, this._then);

  final _SetSeenWelcome _self;
  final $Res Function(_SetSeenWelcome) _then;
}

// dart format on
