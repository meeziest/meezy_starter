// Analytics event when user opened the product view.

import 'package:meezy_core/src/analytics/analytics.dart';

base class ViewElementEvent extends AnalyticsEvent {
  final String nameElement;

  const ViewElementEvent({
    required this.nameElement,
    super.screenName,
  });

  @override
  String get name => 'view_element';

  @override
  void buildProperties(AnalyticsBuilder builder) {
    super.buildProperties(builder);
    builder.add(StringAnalyticsProperty('name_element', nameElement));
  }
}
