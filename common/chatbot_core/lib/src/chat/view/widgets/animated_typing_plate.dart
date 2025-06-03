// Flutter imports:
import 'package:chatbot_core/src/chat/util.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:meezy_ui/meezy_ui.dart';

class AnimatedTypingPlate extends StatefulWidget {
  const AnimatedTypingPlate({super.key});

  @override
  State<AnimatedTypingPlate> createState() => _AnimatedTypingPlateState();
}

class _AnimatedTypingPlateState extends State<AnimatedTypingPlate> with SingleTickerProviderStateMixin {
  static const int dots = 3;

  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: const Duration(milliseconds: 300) * dots, vsync: this);
    animation = Tween<double>(begin: 0, end: dots * 100 - 1).animate(controller);

    controller.repeat();
  }

  @override
  void dispose() {
    // Анимацию стопе.
    controller.dispose();

    super.dispose();
  }

  Widget _buildDots(BuildContext context) {
    return SizedBox(
      width: 20.r,
      child: Row(
        children: List.generate(
          dots,
          (index) => AnimatedBuilder(
            animation: animation,
            builder: (context, _) {
              // Индекс текущей анимированной точки.
              final int currentIndex = animation.value ~/ 100;
              final double progress = index == currentIndex ? (animation.value - currentIndex * 100) / 100 : 1.0;

              return Padding(
                padding: EdgeInsets.only(right: 1.w, top: 9.h),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 2.r + 1.r * progress,
                  width: 2.r + 1.r * progress,
                  decoration: BoxDecoration(
                    color: AppColorScheme.gradientStart.withOpacity(0.2 + 0.5 * progress),
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Печатает'),
        SizedBox(width: 1.5.w),
        _buildDots(context),
      ],
    );
  }
}
