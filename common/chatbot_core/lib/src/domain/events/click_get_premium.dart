import 'package:meezy_core/meezy_core.dart';

final class ClickGetPremium extends ButtonNextEvent {
  const ClickGetPremium({
    required this.location,
    super.screenName,
  }) : super(nameElement: 'get_premium_text');

  final String location;

  @override
  void buildProperties(AnalyticsBuilder builder) {
    builder.add(StringAnalyticsProperty('location', location));
    super.buildProperties(builder);
  }
}
