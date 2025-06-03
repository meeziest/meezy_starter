import 'package:meezy_core/src/analytics/analytics.dart';

abstract class AnalyticsRouteConfig {
  const AnalyticsRouteConfig();

  void onRouteChanged(
    AnalyticsScreenName analyticsRoute,
  ) {}
}
