import 'package:flutter/material.dart';

extension UIBuildContextExtension on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);

  Size get sizeOf => MediaQuery.sizeOf(this);

  EdgeInsets get paddingOf => MediaQuery.paddingOf(this);

  double get width => sizeOf.width;

  double get height => sizeOf.height;

  double get percentWidth => width / 100;

  double get percentHeight => height / 100;

  double get _safeAreaHorizontal => mq.padding.left + mq.padding.right;

  double get _safeAreaVertical => mq.padding.top + mq.padding.bottom;

  double get safeAreaBottom => mq.padding.bottom;

  double get safeAreaTop => mq.padding.top;

  double get safePercentWidth => (width - _safeAreaHorizontal) / 100;

  double get safePercentHeight => (height - _safeAreaVertical) / 100;

  Orientation get orientation => mq.orientation;
}

Size getTextWidgetSize(
  String text,
  TextStyle style, {
  double minWidth = 0,
  double maxWidth = double.infinity,
}) {
  final textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    textDirection: TextDirection.ltr,
  )..layout(minWidth: minWidth, maxWidth: maxWidth);
  return textPainter.size;
}

String upperFirstLetter(String text) {
  if (text.isEmpty) return '';

  final List<String> letters = text.toLowerCase().split('');
  letters[0] = letters[0].toUpperCase();

  return letters.join();
}
