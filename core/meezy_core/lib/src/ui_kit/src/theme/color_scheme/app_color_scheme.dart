import 'package:flutter/material.dart';

part 'dark_color_scheme.dart';
part 'light_color_scheme.dart';

class AppColorScheme extends ColorScheme {
  final Color primaryBackground;
  final Color? secondaryBackground;
  final Color? tertiaryBackground;

  static const Color gradientStart = Color(0xFFEEAB00);
  static const Color gradientEnd = Color(0xFF5E77FF);

  Color get transparent => Colors.transparent;
  static const LinearGradient gradient = LinearGradient(
    colors: [gradientStart, gradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  const AppColorScheme({
    required super.primary,
    required super.secondary,
    required super.surface,
    required super.error,
    required super.onPrimary,
    required super.onSecondary,
    required super.onSurface,
    required super.onError,
    required super.brightness,
    required super.shadow,
    required super.outline,
    required this.primaryBackground,
    this.secondaryBackground,
    this.tertiaryBackground,
    super.tertiary,
    super.onPrimaryContainer,
    super.onSecondaryContainer,
    super.onTertiary,
    super.onTertiaryContainer,
    super.errorContainer,
    super.onErrorContainer,
    super.surfaceDim,
    super.surfaceBright,
    super.surfaceContainerLowest,
    super.surfaceContainerLow,
    super.surfaceContainer,
    super.surfaceContainerHigh,
    super.surfaceContainerHighest,
    super.onSurfaceVariant,
    super.outlineVariant,
    super.scrim,
    super.inverseSurface,
    super.onInverseSurface,
    super.inversePrimary,
    super.surfaceTint,
    super.surfaceVariant,
    super.primaryContainer,
    super.secondaryContainer,
    super.tertiaryContainer,
  }) : super(
          /// Primary fixed colors for both dark and light theme
          primaryFixed: const Color(0xFF4D31FB),
          primaryFixedDim: const Color(0xFF51CF66),
          onPrimaryFixed: const Color(0xFFFFFFFF),
          onPrimaryFixedVariant: const Color(0xFF000000),

          /// Secondary fixed colors for both dark and light theme
          secondaryFixed: const Color(0xFFF5F6F7),
          secondaryFixedDim: const Color(0xFFE7F5FF),
          onSecondaryFixed: const Color(0xFF000000),
          onSecondaryFixedVariant: const Color(0xFF339AF0),

          /// Tertiary fixed colors for both dark and light theme
          tertiaryFixed: const Color(0xFFE7F5FF),
          tertiaryFixedDim: const Color(0xFFF5F6F7),
          onTertiaryFixed: const Color(0xFF000000),
          onTertiaryFixedVariant: const Color(0xFF339AF0),
        ); //
}

/// App ColorScheme quick access config
extension AppColorSchemeGetter on ThemeData {
  AppColorSchemeExtension get appColorSchemeExt =>
      extension<AppColorSchemeExtension>() ??
      AppColorSchemeExtension(
        const AppColorSchemeLight(),
      );

  AppColorScheme get appColorScheme => appColorSchemeExt.appColorScheme;
}

class AppColorSchemeExtension extends ThemeExtension<AppColorSchemeExtension> {
  final AppColorScheme appColorScheme;

  AppColorSchemeExtension(this.appColorScheme);

  @override
  ThemeExtension<AppColorSchemeExtension> copyWith({
    AppColorScheme? appColorScheme,
  }) {
    return AppColorSchemeExtension(appColorScheme ?? this.appColorScheme);
  }

  @override
  ThemeExtension<AppColorSchemeExtension> lerp(
    covariant ThemeExtension<AppColorSchemeExtension>? other,
    double t,
  ) {
    if (other is! AppColorSchemeExtension) return this;

    return AppColorSchemeExtension(const AppColorSchemeLight());
  }
}
