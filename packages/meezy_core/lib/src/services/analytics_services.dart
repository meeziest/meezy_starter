import 'package:flutter/material.dart';

import 'package:meezy_core/src/analytics/analytics.dart';

class AnalyticsServiceProvider extends InheritedWidget {
  final AnalyticsReporter reporter;

  const AnalyticsServiceProvider({
    required this.reporter,
    required super.child,
    super.key,
  });

  @override
  bool updateShouldNotify(covariant AnalyticsServiceProvider oldWidget) => false;

  static AnalyticsReporter of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AnalyticsServiceProvider>()!.reporter;
}

extension AnalyticsServiceX on BuildContext {
  AnalyticsReporter get analytics => AnalyticsServiceProvider.of(this);
}
