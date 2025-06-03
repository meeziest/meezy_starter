import 'package:flutter/material.dart';

import 'app_text_styles.dart';
import 'app_theme_data.dart';
import 'color_scheme/app_color_scheme.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  AppColorScheme get colorScheme => theme.appColorSchemeExt.appColorScheme;

  AppTextTheme get textStyles => theme.appTextStyles.appTextTheme;
}

class AppTheme {
  final ThemeMode mode;

  final ThemeData darkTheme;
  final ThemeData lightTheme;

  AppTheme({
    ThemeMode? mode = ThemeMode.system,
    ThemeData? darkTheme,
    ThemeData? lightTheme,
  })  : darkTheme = darkTheme ??
            AppThemeData.darkTheme(
              const AppColorSchemeDark(),
            ),
        lightTheme = lightTheme ??
            AppThemeData.lightTheme(
              const AppColorSchemeLight(),
            ),
        mode = mode ?? ThemeMode.system;

  static final light = AppTheme(mode: ThemeMode.light);
  static final dark = AppTheme(mode: ThemeMode.dark);
  static final system = AppTheme(mode: ThemeMode.system);

  ThemeData getTheme(BuildContext context) {
    switch (mode) {
      case ThemeMode.light:
        return lightTheme;
      case ThemeMode.dark:
        return darkTheme;
      case ThemeMode.system:
        return MediaQuery.platformBrightnessOf(context) == Brightness.dark ? darkTheme : lightTheme;
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is AppTheme && runtimeType == other.runtimeType && mode == other.mode;

  @override
  int get hashCode => mode.hashCode;
}
