import 'package:shared_preferences/shared_preferences.dart';

import '../auth/token_local.dart';
import '../client/rest_client_factory.dart';
import '../logger/logger.dart';
import '../tracker/error_tracker.dart';
import 'core_dependencies.dart';
import 'enviroment.dart';

const baseUrl = 'http://45.32.8.88:8085/v1/';

/// A class which is responsible for processing initialization steps.
final class InitializationProcessor {
  const InitializationProcessor(this.config);

  /// Application configuration
  final Config config;

  Future<CoreDependencies> _initDependencies() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final errorTrackingManager = await _initErrorTrackingManager();
    final tokenStorage = TokenStorageSP(sharedPreferences: sharedPreferences);

    final regularClient = await RestClientFactory.create(
      settings: RestClientFactorySettings(baseUrl, RestClientType.regular),
      tokenStorage: tokenStorage,
    );

    final authClient = await RestClientFactory.create(
      settings: RestClientFactorySettings(baseUrl, RestClientType.auth),
      tokenStorage: tokenStorage,
    );

    return CoreDependencies(
      client: regularClient,
      authClient: authClient,
      tokenStorage: tokenStorage,
      sharedPreferences: sharedPreferences,
      errorTrackingManager: errorTrackingManager,
    );
  }

  Future<ErrorTrackingManager> _initErrorTrackingManager() async {
    final errorTrackingManager = SentryTrackingManager(
      logger,
      sentryDsn: config.sentryDsn,
      environment: config.environment.value,
    );

    if (config.enableSentry) {
      await errorTrackingManager.enableReporting();
    }

    return errorTrackingManager;
  }

  /// Initializes dependencies and returns the result of the initialization.
  ///
  /// This method may contain additional steps that need initialization
  /// before the application starts
  /// (for example, caching or enabling tracking manager)
  Future<InitializationResult> initialize() async {
    final stopwatch = Stopwatch()..start();

    logger.info('Initializing dependencies...');
    final dependencies = await _initDependencies();
    logger.info('Dependencies initialized');

    stopwatch.stop();
    final result = InitializationResult(
      coreDependencies: dependencies,
      msSpent: stopwatch.elapsedMilliseconds,
    );
    return result;
  }
}
