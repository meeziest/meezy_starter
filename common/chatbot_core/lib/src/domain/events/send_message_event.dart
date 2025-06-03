import 'package:meezy_core/meezy_core.dart';

final class SendMessageEvent extends AnalyticsEvent {
  const SendMessageEvent({
    super.screenName,
  });

  @override
  String get name => 'message_send';

  @override
  void buildProperties(AnalyticsBuilder builder) {
    builder.add(StringAnalyticsProperty('name_element', 'input'));
    super.buildProperties(builder);
  }
}
