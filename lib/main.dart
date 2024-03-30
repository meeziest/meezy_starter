import 'dart:async';

import 'core/logger/logger.dart';
import 'features/app_runner.dart';

void main() {
  runCallback() => const AppRunner().initializeAndRun();
  logger.runLogging(
    () => runZonedGuarded(runCallback, logger.logZoneError),
    const LogOptions(),
  );
}
