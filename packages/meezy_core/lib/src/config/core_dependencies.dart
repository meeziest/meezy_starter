import 'package:meezy_core/src/data/theme/repository/theme_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/dto/token.dart';
import '../auth/token_local.dart';
import '../client/rest_client_base.dart';
import '../data/locale/repository/locale_repository.dart';
import '../tracker/error_tracker.dart';

/// Dependencies container
base class CoreDependencies {
  const CoreDependencies({
    required this.sharedPreferences,
    required this.errorTrackingManager,
    required this.authClient,
    required this.tokenStorage,
    required this.client,
    required this.themeRepository,
    required this.localeRepository,
  });

  /// [SharedPreferences] instance, used to store Key-Value pairs.
  final SharedPreferences sharedPreferences;

  /// [ErrorTrackingManager] instance, used to report errors.
  final ErrorTrackingManager errorTrackingManager;

  /// [RestClient] instance, used to handle auth apis.
  final RestClient authClient;

  /// [RestClient] instance, used to handle apis.
  final RestClient client;

  /// [SharedPreferences] instance, used to store Key-Value pairs.
  final TokenStorage<Token> tokenStorage;

  final ThemeRepository themeRepository;

  final LocaleRepository localeRepository;
}

typedef ComboDependencies<T> = ({CoreDependencies core, T app});

/// Result of initialization
final class InitializationResult<T> {
  /// {@macro initialization_result}
  const InitializationResult({
    required this.dependencies,
    required this.msSpent,
  });

  /// The dependencies
  final ComboDependencies<T> dependencies;

  /// The number of milliseconds spent
  final int msSpent;

  @override
  String toString() => '$InitializationResult('
      'dependencies: $dependencies, '
      'msSpent: $msSpent'
      ')';
}
