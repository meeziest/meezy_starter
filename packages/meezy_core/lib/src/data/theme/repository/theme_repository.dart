import 'dart:async';

import 'package:flutter/material.dart';

import '../data_source/theme_local_data_source.dart';

abstract interface class ThemeRepository {
  /// Set theme
  Future<void> setTheme(ThemeMode theme);

  /// Observe current theme changes
  ThemeMode? loadTheme();
}

/// {@macro theme_repository}
final class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeDataSource _dataSource;

  /// {@macro theme_repository}
  const ThemeRepositoryImpl(this._dataSource);

  @override
  Future<void> setTheme(ThemeMode theme) => _dataSource.setTheme(theme);

  @override
  ThemeMode? loadTheme() => _dataSource.loadThemeFromCache();
}
