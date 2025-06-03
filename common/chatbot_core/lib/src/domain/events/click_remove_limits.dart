import 'package:meezy_core/meezy_core.dart';

final class ClickRemoveLimits extends ButtonNextEvent {
  const ClickRemoveLimits({
    required this.location,
    super.screenName,
  }) : super(nameElement: 'remove_limits');

  final String location;

  @override
  void buildProperties(AnalyticsBuilder builder) {
    builder.add(StringAnalyticsProperty('location', location));
    super.buildProperties(builder);
  }
}
