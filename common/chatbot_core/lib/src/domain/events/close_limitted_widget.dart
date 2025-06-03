import 'package:meezy_core/meezy_core.dart';

final class CloseLimitedWidget extends AnalyticsEvent {
  final String nameElement;

  const CloseLimitedWidget({
    required this.nameElement,
    super.screenName,
  });

  @override
  String get name => 'close';

  @override
  void buildProperties(AnalyticsBuilder builder) {
    builder.add(StringAnalyticsProperty('name_element', nameElement));
    super.buildProperties(builder);
  }
}
