import 'package:flutter/material.dart';

import '../../../../../chatbot_core.dart';

class TypingMessageWidget extends StatefulWidget {
  final String message;
  final TextStyle? textStyle;
  final Duration duration;
  final VoidCallback? onTypingEnd;
  final ScrollController? scrollController;

  const TypingMessageWidget({
    required this.message,
    super.key,
    this.scrollController,
    this.textStyle,
    this.duration = const Duration(milliseconds: 50),
    this.onTypingEnd,
  });

  @override
  _TypingMessageWidgetState createState() => _TypingMessageWidgetState();
}

class _TypingMessageWidgetState extends State<TypingMessageWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _characterCount;
  bool _showCursor = true;
  bool _isScrollingManually = false;
  bool _isAtBottom = false;

  @override
  void initState() {
    super.initState();

    final scrollController = widget.scrollController;
    final totalDurationMs = (widget.message.length / 3).floor() * widget.duration.inMilliseconds;
    _controller = AnimationController(
      duration: Duration(milliseconds: totalDurationMs),
      vsync: this,
    );

    _characterCount = StepTween(begin: 0, end: widget.message.length).animate(_controller);

    _controller.forward();

    _showCursor = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.dispatchNotification(TypingNotification(
        message: widget.message.substring(0, _characterCount.value),
        durationLeft: Duration(milliseconds: widget.message.length * widget.duration.inMilliseconds),
      ));
    });

    _characterCount.addListener(() async {
      // Прокручиваем вниз после каждого изменения текста

      WidgetsBinding.instance.addPostFrameCallback((_) {
        final durationLeftMs = totalDurationMs - (totalDurationMs * _controller.value).round();
        final clamped = durationLeftMs.clamp(0, totalDurationMs);

        if (mounted) {
          context.dispatchNotification(TypingNotification(
            message: widget.message.substring(0, _characterCount.value),
            durationLeft: Duration(milliseconds: clamped),
          ));
        }

        final canScroll = scrollController != null && scrollController.hasClients;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_isAtBottom && !_isScrollingManually && canScroll) {
            widget.scrollController!.jumpTo(
              widget.scrollController!.position.maxScrollExtent,
            );
          }
        });
      });

      if (_characterCount.value > 0 && _characterCount.value < widget.message.length) {
        // Typing in progress, cursor should be solid
        _showCursor = true;
      } else if (_characterCount.value == widget.message.length) {
        // Typing finished, hide the cursor
        _showCursor = false;
        widget.onTypingEnd?.call();
      }
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    _isScrollingManually = ScrollControlInherited.of(context);
    _isAtBottom = ChatScreenViewModelInherited.of(context).isAtBottom;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final visibleText = widget.message.substring(0, _characterCount.value);
    // Build the text with the cursor
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: visibleText,
            style: widget.textStyle,
          ),
          if (_showCursor)
            const WidgetSpan(
              child: SizedBox(width: 5.0), // Adjust the width as needed
            ),
          // Add cursor if it's visible
          if (_showCursor)
            WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: CircularWhiteIndicator(),
            ),
        ],
      ),
    );
  }
}

final class TypingNotification extends Notification {
  final String message;
  final Duration durationLeft;

  const TypingNotification({
    required this.message,
    this.durationLeft = Duration.zero,
  });

  bool get isTyping => durationLeft.inMilliseconds > Duration.zero.inMilliseconds;
}
