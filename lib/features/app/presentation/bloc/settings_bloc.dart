import 'dart:async';

import 'package:flutter/material.dart' show Locale;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meezy_starter/core/bloc_base/bloc/base_bloc.dart';

import '../../../../core/locale/data/repository/locale_repository.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/data/repository/theme_repository.dart';

part 'settings_bloc.freezed.dart';

/// A [Bloc] that handles the settings.
final class SettingsBloc extends BaseBloc<SettingsEvent, SettingsState> {
  final LocaleRepository _localeRepo;
  final ThemeRepository _themeRepo;

  SettingsBloc({
    required LocaleRepository localeRepository,
    required ThemeRepository themeRepository,
    required SettingsState initialState,
  })  : _localeRepo = localeRepository,
        _themeRepo = themeRepository,
        super(initialState);

  @override
  Future<void> onEventHandler(SettingsEvent event, Emitter<SettingsState> emit) async => event.map(
        updateTheme: (event) => _updateTheme(event),
        updateLocale: (event) => _updateLocale(event),
      );

  Future<void> _updateTheme(_UpdateThemeSettingsEvent event) async {
    updateState(SettingsState.processing(
      appTheme: state.appTheme,
      locale: state.locale,
    ));

    try {
      await _themeRepo.setTheme(event.appTheme);

      updateState(SettingsState.idle(
        appTheme: event.appTheme,
        locale: state.locale,
      ));
    } on Object catch (e) {
      updateState(SettingsState.error(
        appTheme: state.appTheme,
        locale: state.locale,
        cause: e,
      ));
      rethrow;
    }
  }

  Future<void> _updateLocale(_UpdateLocaleSettingsEvent event) async {
    updateState(SettingsState.processing(
      appTheme: state.appTheme,
      locale: state.locale,
    ));

    try {
      await _localeRepo.setLocale(event.locale);

      updateState(SettingsState.idle(
        appTheme: state.appTheme,
        locale: event.locale,
      ));
    } on Object catch (e) {
      updateState(SettingsState.error(
        appTheme: state.appTheme,
        locale: state.locale,
        cause: e,
      ));
      rethrow;
    }
  }
}

/// States for the [SettingsBloc].
@freezed
sealed class SettingsState with _$SettingsState {
  const SettingsState._();

  const factory SettingsState.idle({Locale? locale, AppTheme? appTheme}) = _IdleSettingsState;
  const factory SettingsState.processing({Locale? locale, AppTheme? appTheme}) = _ProcessingSettingsState;
  const factory SettingsState.error({required Object cause, Locale? locale, AppTheme? appTheme}) =
      _ErrorSettingsState;
}

/// Events for the [SettingsBloc].
@freezed
sealed class SettingsEvent with _$SettingsEvent {
  const SettingsEvent._();

  const factory SettingsEvent.updateTheme({required AppTheme appTheme}) = _UpdateThemeSettingsEvent;
  const factory SettingsEvent.updateLocale({required Locale locale}) = _UpdateLocaleSettingsEvent;
}
