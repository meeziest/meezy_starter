import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

typedef TextBuilder = Widget Function(BuildContext context, String text);

/// A widget that animates text to appear character by character
/// similar to a typewriter animation.
class TypingText extends StatefulWidget {
  const TypingText({
    super.key,
    required this.text,
    this.animationDuration = const Duration(milliseconds: 1000),
    this.animate = true,
    this.textStyle,
    this.tickInterval = 2,
    this.isHyper = false,
  });

  final String text;
  final bool isHyper;
  final Duration animationDuration;
  final bool animate;
  final int tickInterval;
  final TextStyle? textStyle;

  @override
  State<TypingText> createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText> with SingleTickerProviderStateMixin {
  late List<String> finalText = widget.text.split('');

  late final Random _random = Random();
  late final Ticker _ticker;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_onTick);
    if (widget.animate) _ticker.start();
  }

  @override
  void didUpdateWidget(covariant TypingText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.animate && widget.animate) {
      _ticker.start();
    }
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  int _currentCharIndex = 0;
  String _randChar = '';
  void _onTick(Duration elapsed) {
    final t = (elapsed.inMilliseconds / widget.animationDuration.inMilliseconds).clamp(0, 1);
    if (elapsed.inMilliseconds % widget.tickInterval != 0) return;

    setState(() {
      _currentCharIndex = ((widget.text.length) * t).floor();
      _randChar = String.fromCharCode(_random.nextInt(26) + 65);
      if (t == 1) _ticker.stop();
    });
  }

  @override
  Widget build(BuildContext context) => RichText(
        text: TextSpan(
          style: widget.textStyle,
          children: [
            TextSpan(text: finalText.getRange(0, _currentCharIndex).join()),
            if (_currentCharIndex < finalText.length - 1) ...[
              if (widget.isHyper) TextSpan(text: _randChar),
              const TextSpan(text: '|'),
            ],
          ],
        ),
      );
}
