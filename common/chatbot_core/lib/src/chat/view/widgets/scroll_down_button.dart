import 'package:chatbot_core/src/chat/util.dart';
import 'package:flutter/material.dart';
import 'package:meezy_ui/meezy_ui.dart';

class ScrollDownButton extends StatelessWidget {
  const ScrollDownButton({super.key});

  static final double size = 40.r;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColorScheme.gradientStart.withOpacity(0.15),
            offset: const Offset(0, 3),
            blurRadius: 6.r,
          ),
        ],
      ),
      child: const Center(child: Icon(Icons.add)),
    );
  }
}
