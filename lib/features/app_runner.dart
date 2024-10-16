import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meezy_starter/core/logger/logger.dart';

import '../core/bloc_base/observers/app_bloc_observer.dart';
import '../core/config/enviroment.dart';
import '../core/config/initialization.dart';
import 'app/meezy_app.dart';
import 'app/view/screens/failed_screen.dart';

/// A class which is responsible for initialization and running the app.
final class AppRunner {
  const AppRunner();

  /// Start the initialization and in case of success run application
  Future<void> initializeAndRun() async {
    final binding = WidgetsFlutterBinding.ensureInitialized();

    // Preserve splash screen
    binding.deferFirstFrame();

    // Override logging
    FlutterError.onError = logger.logFlutterError;
    WidgetsBinding.instance.platformDispatcher.onError = logger.logPlatformDispatcherError;

    // Setup bloc observer and transformer
    Bloc.observer = const AppBlocObserver();
    Bloc.transformer = bloc_concurrency.sequential();
    const config = Config();
    const initializationProcessor = InitializationProcessor(config);

    Future<void> initializeAndRun() async {
      try {
        final result = await initializationProcessor.initialize();
        runApp(MeezyApp(result: result));
      } catch (e, stackTrace) {
        logger.error('Initialization failed', error: e, stackTrace: stackTrace);
        runApp(
          InitializationFailedApp(
            error: e,
            stackTrace: stackTrace,
            retryInitialization: initializeAndRun,
          ),
        );
      } finally {
        binding.allowFirstFrame();
      }
    }

    await initializeAndRun();
  }
}
