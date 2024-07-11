import 'dart:async';

import 'package:flutter/material.dart' show Locale;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/bloc_base/bloc/base_bloc.dart';
import '../../../core/ui_kit/src/theme/app_theme.dart';
import '../data/locale/repository/locale_repository.dart';
import '../data/theme/repository/theme_repository.dart';

part 'app_bloc.freezed.dart';

const welcome_state_key = 'welcome_state';

/// A [Bloc] that handles the settings.
final class AppBloc extends BaseBloc<AppEvent, AppState> {
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
  Future<void> onEventHandler(AppEvent event, Emitter<AppState> emit) async => event.map(
        updateTheme: _updateTheme,
        updateLocale: _updateLocale,
        setSeenWelcome: _setSeenWelcome,
      );

  Future<void> _setSeenWelcome(_SetSeenWelcome event) async {
    updateState(AppState.processing(
      appTheme: state.appTheme,
      locale: state.locale,
    ));
  }

  Future<void> _updateTheme(_UpdateThemeAppEvent event) async {
    updateState(AppState.processing(
      appTheme: state.appTheme,
      locale: state.locale,
    ));

    try {
      await _themeRepo.setTheme(event.appTheme);

      updateState(AppState.idle(
        appTheme: event.appTheme,
        locale: state.locale,
      ));
    } on Object catch (e) {
      updateState(AppState.error(
        appTheme: state.appTheme,
        locale: state.locale,
        cause: e,
      ));
      rethrow;
    }
  }

  Future<void> _updateLocale(_UpdateLocaleAppEvent event) async {
    updateState(AppState.processing(
      appTheme: state.appTheme,
      locale: state.locale,
    ));

    try {
      await _localeRepo.setLocale(event.locale);

      updateState(AppState.idle(
        appTheme: state.appTheme,
        locale: event.locale,
      ));
    } on Object catch (e) {
      updateState(AppState.error(
        appTheme: state.appTheme,
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

  const factory AppState.idle({Locale? locale, AppTheme? appTheme}) = _IdleAppState;
  const factory AppState.processing({Locale? locale, AppTheme? appTheme}) = _ProcessingAppState;
  const factory AppState.error({required Object cause, Locale? locale, AppTheme? appTheme}) = _ErrorAppState;
}

/// Events for the [AppBloc].
@freezed
sealed class AppEvent with _$AppEvent {
  const AppEvent._();

  const factory AppEvent.updateTheme({required AppTheme appTheme}) = _UpdateThemeAppEvent;
  const factory AppEvent.updateLocale({required Locale locale}) = _UpdateLocaleAppEvent;
  const factory AppEvent.setSeenWelcome() = _SetSeenWelcome;
}
