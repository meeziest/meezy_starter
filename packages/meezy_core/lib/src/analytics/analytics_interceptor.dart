import 'dart:async';

import 'package:meezy_core/src/helpers/generic_helpers.dart';

import 'package:meezy_core/meezy_core.dart';
import 'package:meezy_core/src/analytics/analytics.dart';

import '../helpers/json_utils.dart';

abstract base class AnalyticsInterceptor {
  const AnalyticsInterceptor();

  /// Intercepts an event before it is reported to the analytics service
  FutureOr<void> afterReport(
    String eventName,
    Map<String, dynamic> event,
  ) {}
}

final class LoggingAnalyticsInterceptor extends AnalyticsInterceptor {
  const LoggingAnalyticsInterceptor({
    required this.reporter,
  });

  static const _tag = 'Analytics';

  final Reporter reporter;

  @override
  FutureOr<void> afterReport(
    String eventName,
    Map<String, dynamic> event,
  ) {
    final formattedProperties = Map.fromEntries(
      event.entries.map((it) => MapEntry('"${it.key}"', '"${it.value}"')),
    ).toString().let(JsonUtil.prettyJson);

    logger.debug(
      [
        '${reporter.name} analytics event:',
        'name: $eventName',
        'properties: $formattedProperties',
      ].join('\n'),
    );
  }
}
