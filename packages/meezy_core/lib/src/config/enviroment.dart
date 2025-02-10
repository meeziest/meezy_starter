import 'package:flutter/foundation.dart';

/// Application configuration
class Config {
  /// Creates a new [Config] instance.
  const Config();

  /// The current environment.
  Environment get environment {
    var environment = const String.fromEnvironment('ENVIRONMENT');

    if (environment.isNotEmpty) {
      return Environment.from(environment);
    }

    environment = const String.fromEnvironment('FLUTTER_APP_FLAVOR');

    return Environment.from(environment);
  }

  /// The Sentry DSN.
  String get sentryDsn => const String.fromEnvironment('SENTRY_DSN');

  /// Whether Sentry is enabled.
  bool get enableSentry => sentryDsn.isNotEmpty;
}

/// The environment.
enum Environment {
  /// Development environment.
  dev._('DEV'),

  /// Production environment.
  prod._('PROD');

  /// The environment value.
  final String value;

  const Environment._(this.value);

  /// Returns the environment from the given [value].
  static Environment from(String? value) => switch (value) {
        'DEV' => Environment.dev,
        'PROD' => Environment.prod,
        _ => kReleaseMode ? Environment.prod : Environment.dev,
      };
}
