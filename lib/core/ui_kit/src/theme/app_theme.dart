import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
final class AppTheme with Diagnosticable {
  final ThemeMode mode;

  /// The seed color to generate the [ColorScheme] from.
  final Color? seed;

  AppTheme({
    required this.mode,
    this.seed,
  })  : darkTheme = ThemeData(
          colorSchemeSeed: seed ?? const Color(0xFF4E3CF1),
          brightness: Brightness.dark,
          buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: seed ?? const Color(0xFF4E3CF1),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: const Color(0xFF4F4E4E),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFE3E3E3), width: 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          progressIndicatorTheme: const ProgressIndicatorThemeData(color: Color(0xFF4E3CF1)),
          scaffoldBackgroundColor: const Color(0xff181818),
          dialogBackgroundColor: Colors.white,
          useMaterial3: true,
        ),
        lightTheme = ThemeData(
          colorSchemeSeed: seed ?? const Color(0xFF4E3CF1),
          scaffoldBackgroundColor: const Color(0xff181818),
          progressIndicatorTheme: const ProgressIndicatorThemeData(color: Color(0xFF4E3CF1)),
          brightness: Brightness.light,
          buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: seed ?? const Color(0xFF4E3CF1),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: const Color(0xFF4F4E4E),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFE3E3E3), width: 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          dialogBackgroundColor: Colors.white,
          useMaterial3: true,
        );

  /// Light mode [AppTheme].
  static final light = AppTheme(mode: ThemeMode.light);

  /// Dark mode [AppTheme].
  static final dark = AppTheme(mode: ThemeMode.dark);

  /// System mode [AppTheme].
  static final system = AppTheme(mode: ThemeMode.system);

  /// All the light [AppTheme]s.
  static final values = [
    ...List.generate(
      Colors.primaries.length,
      (index) => AppTheme(
        seed: Colors.primaries[index],
        mode: ThemeMode.system,
      ),
    ),
  ];

  /// The dark [ThemeData] for this [AppTheme].
  final ThemeData darkTheme;

  /// The light [ThemeData] for this [AppTheme].
  final ThemeData lightTheme;

  /// The [ThemeData] for this [AppTheme].
  /// This is computed based on the [mode].
  ///
  /// Could be useful for theme showcase.
  ThemeData computeTheme(BuildContext context) {
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
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('seed', seed));
    properties.add(EnumProperty<ThemeMode>('type', mode));
    properties.add(DiagnosticsProperty<ThemeData>('lightTheme', lightTheme));
    properties.add(DiagnosticsProperty<ThemeData>('darkTheme', darkTheme));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppTheme && runtimeType == other.runtimeType && seed == other.seed && mode == other.mode;

  @override
  int get hashCode => mode.hashCode ^ seed.hashCode;
}
