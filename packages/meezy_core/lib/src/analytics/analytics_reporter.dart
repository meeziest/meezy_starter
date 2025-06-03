import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:meezy_core/src/analytics/analytics.dart';
import 'package:meezy_core/src/helpers/generic_helpers.dart';
import 'package:flutter/foundation.dart';

import 'package:meezy_core/src/analytics/analytics_config.dart';

part 'firebase_analytics/firebase_analytics_reporter.dart';

abstract class AnalyticsReporter {
  /// Creates a new analytics reporter.
  AnalyticsReporter({List<AnalyticsInterceptor> interceptors = const []}) : _interceptors = interceptors;
  AnalyticsScreenName? _currentScreen;

  AnalyticsScreenName? get currentScreen => _currentScreen;

  /// The interceptors that will be called before an event is reported.
  final List<AnalyticsInterceptor> _interceptors;

  /// Reports an event to the analytics service.
  @nonVirtual
  Future<void> reportEvent(AnalyticsEvent event) async {
    final builder = AnalyticsBuilder();

    event.buildProperties(builder);

    for (final param in AnalyticsConfig.defaultParams.entries) {
      builder.add(StringAnalyticsProperty(param.key, param.value));
    }

    await _reportEvent(event.name, builder.toMap());

    for (final interceptor in _interceptors) {
      await interceptor.afterReport(
        event.name,
        builder.properties.map((it) => MapEntry(it.name, it.value.toString())).let(Map.fromEntries),
      );
    }
  }

  /// Reports an raw event to the analytics service.
  @nonVirtual
  Future<void> reportRawEvent({
    required Map<String, dynamic> event,
    AnalyticsScreenName? screenName,
  }) async {
    final builder = AnalyticsBuilder();

    final analyticsEvent = AnalyticsEvent.fromJson(
      event: event,
      screenName: screenName,
    );

    if (analyticsEvent == null) {
      throw Exception("Can't parse AnalyticsEvent");
    }

    for (final param in event.entries) {
      builder.add(StringAnalyticsProperty(param.key, param.value.toString()));
    }

    for (final param in AnalyticsConfig.defaultParams.entries) {
      builder.add(StringAnalyticsProperty(param.key, param.value));
    }

    await _reportEvent(analyticsEvent.name, builder.toMap());

    for (final interceptor in _interceptors) {
      await interceptor.afterReport(analyticsEvent.name, builder.toMap() ?? {});
    }
  }

  Future<void> setCurrentScreen(AnalyticsScreenName route) async {
    final builder = AnalyticsBuilder();
    final event = ScreenViewEvent(screenName: route);
    event.buildProperties(builder);

    for (final param in AnalyticsConfig.defaultParams.entries) {
      builder.add(StringAnalyticsProperty(param.key, param.value));
    }

    await _setCurrentScreen(route.screenName, builder.toMap());

    for (final interceptor in _interceptors) {
      await interceptor.afterReport(event.name, builder.toMap() ?? {});
    }
    _currentScreen = route;
  }

  Future<void> setDefaultEventParameters(
    Map<String, Object?>? params,
  );

  /// User Properties для А/B тестинга и фильтраций на дешборде аналитики
  /// [name] - наименования поле для фильтраций, [value] - property
  /// Пример {name:'cuid', value:'123'}
  Future<void> setUserProperty({required String name, required String? value});

  Future<void> clearDefaultEventParameters();

  /// Reports an event to the analytics service.
  ///
  /// This method should be implemented by the analytics service.
  Future<void> _reportEvent(String name, Map<String, Object>? properties);

  Future<void> _setCurrentScreen(
    String screenName,
    Map<String, Object?>? properties,
  );
}
