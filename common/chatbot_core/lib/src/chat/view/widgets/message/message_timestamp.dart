import 'package:chatbot_core/src/chat/util.dart';
import 'package:chatbot_core/src/chat/view/widgets/defined_height_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
// Package imports:
import 'package:meezy_core/meezy_core.dart';
import 'package:meezy_ui/meezy_ui.dart';

class MessageTimestamp extends DefinedHeightStatelessWidget {
  const MessageTimestamp({
    super.key,
    required this.timestamp,
  });

  /// Default height.
  static final double defaultHeight = 32.h;

  /// Дата публикации сообщения.
  final DateTime timestamp;

  String time(BuildContext context) {
    final DateTime now = DateTime.now();
    final int differenceInDays = now.difference(timestamp).inDays;
    final DateTime yesterday = now.subtract(const Duration(days: 1));

    // Часы:минуты публикации сообщения.
    final String hourMinute = DateFormat('HH:mm').format(timestamp);

    if (now.isAtSameDayAs(timestamp)) {
      return 'Сегодня $hourMinute';
    } else if (timestamp.isAtSameDayAs(yesterday)) {
      return 'Вчера $hourMinute';
    } else if (timestamp.weekday <= now.weekday && differenceInDays < now.weekday) {
      return '${upperFirstLetter(DateFormat('EEEEE').format(timestamp))} $hourMinute';
    } else {
      return '${DateFormat(DateFormat.ABBR_MONTH_DAY).format(timestamp)} $hourMinute';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: defaultHeight,
      child: Center(
        child: Text(
          time(context),
        ),
      ),
    );
  }

  @override
  double get height => defaultHeight;
}
