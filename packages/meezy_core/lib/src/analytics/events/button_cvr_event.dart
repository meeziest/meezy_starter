import 'package:meezy_core/src/analytics/analytics.dart';

base class ButtonCvrEvent extends AnalyticsEvent {
  final String nameElement;

  const ButtonCvrEvent({
    required super.screenName,
    required this.nameElement,
  });

  @override
  String get name => 'button_cvr';

  @override
  void buildProperties(AnalyticsBuilder builder) {
    super.buildProperties(builder);
    builder.add(StringAnalyticsProperty('name_element', nameElement));
  }
}
