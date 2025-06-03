import 'package:meezy_core/src/analytics/analytics.dart';

enum AnalyticsScreenName {
  splashScreen('splash_screen'),
  onboardingScreen('onboarding'),
  paywallScreen('paywall'),
  paymentSuccess('payment_success'),
  mainScreen('main_screen'),
  historyScreen('history'),
  attachments('attachments'),
  removeLimitsPopUp('remove_limits_popup'),
  removeLimitsMainScreen('remove_limits_main_screen'),
  bannerMainScreen('banner_main_screen');

  final String screenName;

  const AnalyticsScreenName(this.screenName);
}

final class AnalyticsRawEvent extends AnalyticsEvent {
  final String _name;

  AnalyticsRawEvent({required String name, super.screenName}) : _name = name;

  @override
  String get name => _name;
}

abstract base class AnalyticsEvent {
  final AnalyticsScreenName? screenName;

  const AnalyticsEvent({this.screenName});

  static AnalyticsEvent? fromJson({
    required Map<String, dynamic> event,
    AnalyticsScreenName? screenName,
  }) {
    final hasName = event.containsKey('name') || event.containsKey('event_name');

    if (!hasName) return null;

    return AnalyticsRawEvent(
      name: (event['event_name'] as String? ?? event['name'] as String?)!,
      screenName: screenName,
    );
  }

  String get name;

  /// Builds the properties for this event.
  void buildProperties(AnalyticsBuilder builder) {
    if (screenName?.screenName.isNotEmpty ?? false) {
      builder.add(StringAnalyticsProperty('screen_name', screenName!.screenName));
    }
  }
}
