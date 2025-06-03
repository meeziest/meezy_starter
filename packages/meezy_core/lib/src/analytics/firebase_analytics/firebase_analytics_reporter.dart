part of '../analytics_reporter.dart';

final class FirebaseAnalyticsReporter extends AnalyticsReporter {
  final FirebaseAnalytics analytics;

  FirebaseAnalyticsReporter(this.analytics, {super.interceptors});

  @override
  Future<void> _reportEvent(
    String name,
    Map<String, Object>? properties,
  ) async {
    await analytics.logEvent(
      name: name,
      parameters: properties,
    );
  }

  @override
  Future<void> clearDefaultEventParameters() =>
      analytics.setDefaultEventParameters(
        null,
      );

  @override
  Future<void> _setCurrentScreen(
    String screenName,
    Map<String, Object?>? properties,
  ) async {
    await analytics.logScreenView(
      screenName: screenName,
      parameters: (properties?.entries.where((it) => it.value != null).toList()
              as List<MapEntry<String, Object>>?)
          ?.let(Map.fromEntries),
    );
  }

  @override
  Future<void> setDefaultEventParameters(Map<String, Object?>? params) =>
      analytics.setDefaultEventParameters(
        params,
      );

  @override
  Future<void> setUserProperty({
    required String name,
    required String? value,
  }) =>
      analytics.setUserProperty(name: name, value: value);
}
