// Analytics event when user clicked
import 'package:meezy_core/src/analytics/analytics.dart';

base class ButtonNextEvent extends AnalyticsEvent {
  final String nameElement;

  const ButtonNextEvent({
    super.screenName,
    this.nameElement = 'button_without_name',
  });

  @override
  String get name => 'button_next';

  @override
  void buildProperties(AnalyticsBuilder builder) {
    super.buildProperties(builder);
    builder.add(StringAnalyticsProperty('name_element', nameElement));
  }
}
