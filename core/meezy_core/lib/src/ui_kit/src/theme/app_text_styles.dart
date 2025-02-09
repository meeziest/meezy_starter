import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_scheme/app_color_scheme.dart';

class AppTextTheme extends TextTheme {
  /// add custom fields for custom text styles
  /// final TextStyle? customTextStyle;

  AppTextTheme(AppColorScheme appColorScheme)
      : super(
          displayLarge: GoogleFonts.inter(
            fontSize: 34.0,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.none,
            color: appColorScheme.onPrimaryContainer,
          ),
          displayMedium: GoogleFonts.inter(
            fontSize: 28.0,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.none,
            color: appColorScheme.onPrimaryContainer,
          ),
          displaySmall: GoogleFonts.inter(
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.none,
            color: appColorScheme.onPrimaryContainer,
          ),
          headlineLarge: GoogleFonts.inter(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.none,
            color: appColorScheme.onPrimaryContainer,
          ),
          headlineMedium: GoogleFonts.inter(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.none,
            color: appColorScheme.onPrimaryContainer,
          ),
          headlineSmall: GoogleFonts.inter(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.none,
            color: appColorScheme.onPrimaryContainer,
          ),
          titleLarge: GoogleFonts.inter(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.none,
            color: appColorScheme.onPrimaryContainer,
          ),
          titleMedium: GoogleFonts.inter(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.none,
            color: appColorScheme.onPrimaryContainer,
          ),
          titleSmall: GoogleFonts.inter(
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.none,
            color: appColorScheme.onPrimaryContainer,
          ),
          bodyLarge: GoogleFonts.inter(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.none,
            color: appColorScheme.onPrimaryContainer,
          ),
          bodyMedium: GoogleFonts.inter(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.none,
            color: appColorScheme.onPrimaryContainer,
          ),
          bodySmall: GoogleFonts.inter(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.none,
            color: appColorScheme.onPrimaryContainer,
          ),
          labelLarge: GoogleFonts.inter(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.none,
            color: appColorScheme.onPrimaryContainer,
          ),
          labelMedium: GoogleFonts.inter(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.none,
            color: appColorScheme.onPrimaryContainer,
          ),
          labelSmall: GoogleFonts.inter(
            fontSize: 10.0,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.none,
            color: appColorScheme.onPrimaryContainer,
          ),
        );
}

/// App TextStyles quick access config
extension AppTextStylesGetter on ThemeData {
  AppTextStylesExtension get appTextStyles =>
      extension<AppTextStylesExtension>() ??
      AppTextStylesExtension(
        AppTextTheme(const AppColorSchemeLight()),
      );
}

class AppTextStylesExtension extends ThemeExtension<AppTextStylesExtension> {
  final AppTextTheme appTextTheme;

  AppTextStylesExtension(this.appTextTheme);

  @override
  ThemeExtension<AppTextStylesExtension> copyWith({
    AppTextTheme? appTextTheme,
  }) {
    return AppTextStylesExtension(appTextTheme ?? this.appTextTheme);
  }

  @override
  ThemeExtension<AppTextStylesExtension> lerp(
    covariant ThemeExtension<AppTextStylesExtension>? other,
    double t,
  ) {
    if (other is! AppTextStylesExtension) return this;

    return AppTextStylesExtension(AppTextTheme(const AppColorSchemeLight()));
  }
}
