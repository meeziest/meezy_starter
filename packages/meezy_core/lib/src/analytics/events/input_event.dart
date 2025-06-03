// Analytics event when user clicked

import 'package:meezy_core/src/analytics/analytics.dart';

base class InputEvent extends AnalyticsEvent {
  final String nameElement;
  final String message ; 
  const InputEvent({
    required super.screenName,
    required this.nameElement ,
    required this.message , 
  });

  @override
  String get name => 'input';

  @override
  void buildProperties(AnalyticsBuilder builder) {
    super.buildProperties(builder);
    builder.add(StringAnalyticsProperty('name_element', nameElement));
    builder.add(StringAnalyticsProperty('message', message));
  }
}
