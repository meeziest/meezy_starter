// Analytics event when user closes
import 'package:meezy_core/src/analytics/analytics.dart';

base class ScreenViewEvent extends AnalyticsEvent {
  const ScreenViewEvent({required super.screenName});

  @override
  String get name => 'screen_view';
}
