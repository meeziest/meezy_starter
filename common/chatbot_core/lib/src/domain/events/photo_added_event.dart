import 'package:meezy_core/meezy_core.dart';

final class PhotoAddedEvent extends AnalyticsEvent {
  final String type;

  const PhotoAddedEvent({
    required this.type,
    super.screenName,
  });

  @override
  String get name => 'photo_added';

  @override
  void buildProperties(AnalyticsBuilder builder) {
    builder.add(StringAnalyticsProperty('type', type));
    super.buildProperties(builder);
  }
}
