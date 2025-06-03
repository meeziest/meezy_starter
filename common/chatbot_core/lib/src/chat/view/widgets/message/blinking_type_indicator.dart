import 'package:flutter/material.dart';

import 'circular_white_indicator.dart';

class BlinkingTypeIndicator extends StatefulWidget {
  const BlinkingTypeIndicator({super.key});

  @override
  _BlinkingTypeIndicatorrState createState() => _BlinkingTypeIndicatorrState();
}

class _BlinkingTypeIndicatorrState extends State<BlinkingTypeIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    )..repeat(reverse: true);

    _sizeAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: ScaleTransition(
        scale: _sizeAnimation,
        child: CircularWhiteIndicator(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

//  if (messages[index] == '...') {
//                 return Align(
//                     alignment: Alignment.centerLeft,
//                     child:
//                         BlinkingSizeChangingIndicator()); // Typing indicator widget
//               }
//               return ChatMessageBubble(message: messages[index]);
