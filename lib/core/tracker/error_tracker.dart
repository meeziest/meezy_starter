import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:meezy_starter/core/logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// A class which is responsible for enabling error tracking.
abstract interface class ErrorTrackingManager {
  /// Enables error tracking.
  ///
  /// This method should be called when the user has opted in to error tracking.
  Future<void> enableReporting();

  /// Disables error tracking.
  ///
  /// This method should be called when the user has opted out of error tracking
  Future<void> disableReporting();
}

/// A class that is responsible for managing Sentry error tracking.
abstract base class ErrorTrackingManagerBase implements ErrorTrackingManager {
  ErrorTrackingManagerBase(this._logger);

  final Logger _logger;
  StreamSubscription<LogMessage>? _subscription;

  /// Catch only warnings and errors
  Stream<LogMessage> get _reportLogs => _logger.logs.where(_isWarningOrError);

  static bool _isWarningOrError(LogMessage log) =>
      log.logLevel.compareTo(LoggerLevel.warning) >= 0;

  @mustCallSuper
  @mustBeOverridden
  @override
  Future<void> disableReporting() async {
    await _subscription?.cancel();
    _subscription = null;
  }

  @mustCallSuper
  @mustBeOverridden
  @override
  Future<void> enableReporting() async {
    _subscription ??= _reportLogs.listen((log) async {
      if (_shouldReport(log.error)) {
        await _report(log);
      }
    });
  }

  /// Returns `true` if the error should be reported.
  @pragma('vm:prefer-inline')
  bool _shouldReport(Object? error) => true;

  /// Handles the log message.
  ///
  /// This method is called when a log message is received.
  Future<void> _report(LogMessage log);
}

/// A class that is responsible for managing Sentry error tracking.
final class SentryTrackingManager extends ErrorTrackingManagerBase {
  SentryTrackingManager(
    super._logger, {
    required this.sentryDsn,
    required this.environment,
  });

  /// The Sentry DSN.
  final String sentryDsn;

  /// The Sentry environment.
  final String environment;

  @override
  Future<void> _report(LogMessage log) async {
    final error = log.error;
    final stackTrace = log.stackTrace;

    if (error == null && stackTrace == null) {
      await Sentry.captureMessage(log.message.toString());
      return;
    }

    await Sentry.captureException(error ?? log.message, stackTrace: stackTrace);
  }

  @override
  Future<void> enableReporting() async {
    await SentryFlutter.init((options) {
      options.dsn = sentryDsn;

      // Set the sample rate to 20% of events.
      options.tracesSampleRate = 0.20;
      options.debug = kDebugMode;
      options.environment = environment;
    });
    await super.enableReporting();
  }

  @override
  Future<void> disableReporting() async {
    await Sentry.close();
    await super.disableReporting();
  }
}
