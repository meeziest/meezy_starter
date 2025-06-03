// A Navigator observer that notifies RouteAwares of changes to state of their Route
import 'package:meezy_core/src/analytics/analytics.dart';
import 'package:flutter/material.dart';

import 'analytics_route_config.dart';
import 'analytics_route_default_config.dart';

class AnalyticsRouteObserver {
  AnalyticsRouteObserver._();

  static final observer = RouteObserver<PageRoute<dynamic>>();
  static AnalyticsRouteConfig config = const AnalyticsRouteDefaultConfig();
}

mixin RouteAwareAnalytics<T extends StatefulWidget> on State<T> implements RouteAware {
  AnalyticsScreenName? get analyticsRoute;

  bool isTabBarScreen = false;

  @override
  void didChangeDependencies() {
    final modalRoute = ModalRoute.of(context);
    if (modalRoute != null && modalRoute is PageRoute) {
      AnalyticsRouteObserver.observer.subscribe(this, ModalRoute.of(context)! as PageRoute);
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    AnalyticsRouteObserver.observer.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPop() {}

  @override
  void didPopNext() {
    // Called when the top route has been popped off,
    // and the current route shows up.
    if (analyticsRoute != null) {
      AnalyticsRouteObserver.config.onRouteChanged(analyticsRoute!);
    }
  }

  @override
  void didPush() {
    // Called when the current route has been pushed.
    if (!isTabBarScreen && analyticsRoute != null) {
      AnalyticsRouteObserver.config.onRouteChanged(analyticsRoute!);
    }
  }

  @override
  void didPushNext() {}
}
