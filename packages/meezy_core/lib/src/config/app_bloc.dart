import 'dart:async';

import 'package:flutter/material.dart' show Locale, ThemeMode;

import '../../meezy_core.dart';
import '../data/locale/repository/locale_repository.dart';
import '../data/theme/repository/theme_repository.dart';

part 'app_bloc.freezed.dart';

/// A [Bloc] that handles the settings.
final class AppBloc extends MeezyBloc<AppEvent, AppState> {
  final LocaleRepository _localeRepo;
  final ThemeRepository _themeRepo;

  AppBloc({
    required LocaleRepository localeRepository,
    required ThemeRepository themeRepository,
    required AppState initialState,
  })  : _localeRepo = localeRepository,
        _themeRepo = themeRepository,
        super(initialState);

  @override
  Future<void> onEventHandler(AppEvent event, Emitter<AppState> emit) async => switch (event) {
        _UpdateThemeAppEvent() => _updateTheme(event),
        _UpdateLocaleAppEvent() => _updateLocale(event),
        _SetSeenWelcome() => _setSeenWelcome(event),
      };

  Future<void> _setSeenWelcome(_SetSeenWelcome event) async {
    setState(AppState.processing(
      themeMode: state.themeMode,
      locale: state.locale,
    ));
  }

  Future<void> _updateTheme(_UpdateThemeAppEvent event) async {
    setState(AppState.processing(
      themeMode: state.themeMode,
      locale: state.locale,
    ));

    try {
      await _themeRepo.setTheme(event.appTheme);

      setState(AppState.idle(
        themeMode: event.appTheme,
        locale: state.locale,
      ));
    } on Object catch (e) {
      setState(AppState.error(
        themeMode: state.themeMode,
        locale: state.locale,
        cause: e,
      ));
      rethrow;
    }
  }

  Future<void> _updateLocale(_UpdateLocaleAppEvent event) async {
    setState(AppState.processing(
      themeMode: state.themeMode,
      locale: state.locale,
    ));

    try {
      await _localeRepo.setLocale(event.locale);

      setState(AppState.idle(
        themeMode: state.themeMode,
        locale: event.locale,
      ));
    } on Object catch (e) {
      setState(AppState.error(
        themeMode: state.themeMode,
        locale: state.locale,
        cause: e,
      ));
      rethrow;
    }
  }
}

/// States for the [AppBloc].
@freezed
sealed class AppState with _$AppState {
  const AppState._();

  const factory AppState.idle({Locale? locale, ThemeMode? themeMode}) = _IdleAppState;
  const factory AppState.processing({Locale? locale, ThemeMode? themeMode}) = _ProcessingAppState;
  const factory AppState.error({required Object cause, Locale? locale, ThemeMode? themeMode}) = _ErrorAppState;
}

/// Events for the [AppBloc].
@freezed
sealed class AppEvent with _$AppEvent {
  const AppEvent._();

  const factory AppEvent.updateTheme({required ThemeMode appTheme}) = _UpdateThemeAppEvent;
  const factory AppEvent.updateLocale({required Locale locale}) = _UpdateLocaleAppEvent;
  const factory AppEvent.setSeenWelcome() = _SetSeenWelcome;
}
