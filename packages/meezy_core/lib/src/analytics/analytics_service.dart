import 'package:meezy_core/src/analytics/analytics.dart';

/// Available analytics reporters.
///
/// You can use [Reporter.values] to get all available values.
enum Reporter {
  /// Firebase analytics reporter.
  firebase,

  /// AppsFlyer analytics reporter.
  appsFlyer,
}

/// Interface for interacting with different analytics reporters.
///
/// All supported reporters should be placed to [Reporter] enum and be handled in [reportEvent].
abstract interface class IAnalyticsService {
  /// Sets the default event parameters for all events.
  Future<void> setDefaultEventParameters(Map<String, Object?>? params);

  /// Clears the default event parameters.
  Future<void> clearDefaultEventParameters();

  /// Gets the current screen name.
  AnalyticsScreenName? get currentScreen;

  /// Sets the current screen name.
  Future<void> setCurrentScreen(AnalyticsScreenName route);

  /// Reports an event.
  Future<void> reportEvent(
    AnalyticsEvent event, {
    required List<Reporter> reporters,
  });

  Future<void> reportRawEvent(
    Map<String, dynamic> event, {
    required AnalyticsScreenName screenName,
    required List<Reporter> reporters,
  });
}

class CompositeAnalyticsService implements IAnalyticsService {
  final FirebaseAnalyticsReporter _firebaseAnalyticsReporter;

  late final List<AnalyticsReporter> _reporters;

  CompositeAnalyticsService({
    required FirebaseAnalyticsReporter firebaseAnalyticsReporter,
  })  : _firebaseAnalyticsReporter = firebaseAnalyticsReporter,
        _reporters = [
          firebaseAnalyticsReporter,
        ];

  @override
  Future<void> clearDefaultEventParameters() async {
    for (final reporter in _reporters) {
      await reporter.clearDefaultEventParameters();
    }
  }

  /// Use [FirebaseAnalyticsReporter] as actual [AnalyticsScreenName] provider.
  @override
  AnalyticsScreenName? get currentScreen => _firebaseAnalyticsReporter.currentScreen;

  @override
  Future<void> reportEvent(
    AnalyticsEvent event, {
    required List<Reporter> reporters,
  }) async {
    await _firebaseAnalyticsReporter.reportEvent(event);
  }

  @override
  Future<void> setCurrentScreen(AnalyticsScreenName route) async {
    for (final reporter in _reporters) {
      await reporter.setCurrentScreen(route);
    }
  }

  @override
  Future<void> setDefaultEventParameters(Map<String, Object?>? params) async {
    for (final reporter in _reporters) {
      await reporter.setDefaultEventParameters(params);
    }
  }

  @override
  Future<void> reportRawEvent(
    Map<String, dynamic> event, {
    required List<Reporter> reporters,
    AnalyticsScreenName? screenName,
  }) async {
    await _firebaseAnalyticsReporter.reportRawEvent(
      event: event,
      screenName: screenName,
    );
  }
}
