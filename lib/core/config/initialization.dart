import 'package:meezy_starter/core/config/core_dependencies.dart';
import 'package:meezy_starter/core/theme/data/data_source/theme_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/app/presentation/bloc/settings_bloc.dart';
import '../locale/data/data_source/locale_local_data_source.dart';
import '../locale/data/repository/locale_repository.dart';
import '../logger/logger.dart';
import '../theme/data/repository/theme_repository.dart';
import '../tracker/error_tracker.dart';
import 'enviroment.dart';

/// A class which is responsible for processing initialization steps.
final class InitializationProcessor {
  const InitializationProcessor(this.config);

  /// Application configuration
  final Config config;

  Future<CoreDependencies> _initDependencies() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final errorTrackingManager = await _initErrorTrackingManager();
    final settingsBloc = await _initSettingsBloc(sharedPreferences);

    return CoreDependencies(
      sharedPreferences: sharedPreferences,
      settingsBloc: settingsBloc,
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

  Future<SettingsBloc> _initSettingsBloc(SharedPreferences prefs) async {
    final localeRepository = LocaleRepositoryImpl(LocaleDataSourceSP(prefs));

    final themeRepository = ThemeRepositoryImpl(ThemeDataSourceSP(prefs));

    final localeFuture = localeRepository.loadLocale();
    final theme = await themeRepository.loadTheme();
    final locale = await localeFuture;

    final initialState = SettingsState.idle(appTheme: theme, locale: locale);

    final settingsBloc = SettingsBloc(
      localeRepository: localeRepository,
      themeRepository: themeRepository,
      initialState: initialState,
    );
    return settingsBloc;
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
      dependencies: dependencies,
      msSpent: stopwatch.elapsedMilliseconds,
    );
    return result;
  }
}
