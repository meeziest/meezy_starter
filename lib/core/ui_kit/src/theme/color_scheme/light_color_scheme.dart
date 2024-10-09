part of 'app_color_scheme.dart';

/// Light Theme
final class AppColorSchemeLight extends AppColorScheme {
  const AppColorSchemeLight()
      : super(
          primary: const Color(0xFFFFFFFF),
          primaryBackground: const Color(0xFF212529),
          onPrimary: const Color(0xFF000000),
          primaryContainer: const Color(0xFF000000),
          onPrimaryContainer: const Color(0xFFFFFFFF),
          secondary: const Color(0xFF495057),
          onSecondary: const Color(0xFFFFFFFF),
          surface: Colors.white,
          error: const Color(0xFFD32F2F),
          errorContainer: const Color(0xFFFA5252),
          onSurface: Colors.black,
          onError: Colors.white,
          brightness: Brightness.light,
          shadow: const Color(0xFFD0EBFF),
          outline: const Color(0xFF000000),
          outlineVariant: const Color(0xFF74C0FC),
        );
}
