import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart' show ThemeMode;

import '../../../../meezy_core.dart';

abstract interface class ThemeDataSource {
  Future<void> setTheme(ThemeMode theme);

  ThemeMode? loadThemeFromCache();
}

/// {@macro theme_datasource}
final class ThemeDataSourceSP extends PreferencesDao implements ThemeDataSource {
  /// {@macro theme_datasource}
  ThemeDataSourceSP(super._sharedPreferences);

  PreferencesEntry<String> get _themeMode => stringEntry('theme.mode');

  @override
  Future<void> setTheme(ThemeMode theme) async {
    await _themeMode.setIfNullRemove(_themeModeCodec.encode(theme));

    return;
  }

  @override
  ThemeMode? loadThemeFromCache() {
    final type = _themeMode.read();

    if (type == null) return null;

    return _themeModeCodec.decode(type);
  }
}

const _themeModeCodec = _ThemeModeCodec();

final class _ThemeModeCodec extends Codec<ThemeMode, String> {
  const _ThemeModeCodec();

  @override
  Converter<String, ThemeMode> get decoder => const _ThemeModeDecoder();

  @override
  Converter<ThemeMode, String> get encoder => const _ThemeModeEncoder();
}

final class _ThemeModeDecoder extends Converter<String, ThemeMode> {
  const _ThemeModeDecoder();

  @override
  ThemeMode convert(String input) {
    switch (input) {
      case 'ThemeMode.dark':
        return ThemeMode.dark;
      case 'ThemeMode.light':
        return ThemeMode.light;
      case 'ThemeMode.system':
        return ThemeMode.system;
      default:
        throw ArgumentError.value(
          input,
          'input',
          'Cannot convert $input to ThemeMode',
        );
    }
  }
}

final class _ThemeModeEncoder extends Converter<ThemeMode, String> {
  const _ThemeModeEncoder();

  @override
  String convert(ThemeMode input) {
    switch (input) {
      case ThemeMode.dark:
        return 'ThemeMode.dark';
      case ThemeMode.light:
        return 'ThemeMode.light';
      case ThemeMode.system:
        return 'ThemeMode.system';
    }
  }
}
