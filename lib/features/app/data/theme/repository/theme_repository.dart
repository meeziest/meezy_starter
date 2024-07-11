import 'dart:async';

import '../../../../../core/ui_kit/src/theme/app_theme.dart';
import '../data_source/theme_local_data_source.dart';

abstract interface class ThemeRepository {
  /// Set theme
  Future<void> setTheme(AppTheme theme);

  /// Observe current theme changes
  AppTheme? loadTheme();
}

/// {@macro theme_repository}
final class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeDataSource _dataSource;

  /// {@macro theme_repository}
  const ThemeRepositoryImpl(this._dataSource);

  @override
  Future<void> setTheme(AppTheme theme) => _dataSource.setTheme(theme);

  @override
  AppTheme? loadTheme() => _dataSource.loadThemeFromCache();
}
