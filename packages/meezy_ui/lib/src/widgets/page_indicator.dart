import 'package:flutter/material.dart';
import 'package:meezy_ui/meezy_ui.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderIndicator extends StatelessWidget {
  const SliderIndicator({
    required this.activeIndex,
    required this.length,
    super.key,
    this.padding = const EdgeInsets.symmetric(vertical: 4),
    this.color,
    this.activeColor,
  });

  final int activeIndex;
  final int length;
  final EdgeInsets padding;
  final Color? color;
  final Color? activeColor;

  @override
  Widget build(BuildContext context) {
    if (length == 1) return const SizedBox();
    final colorScheme = context.colorScheme;

    return Padding(
      padding: padding,
      child: AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: length,
        effect: ScrollingDotsEffect(
          activeDotScale: 1,
          activeDotColor: color ?? colorScheme.tertiary,
          dotColor: activeColor ?? colorScheme.onSurface,
          maxVisibleDots: 7,
          dotHeight: 10,
          dotWidth: 17,
        ),
      ),
    );
  }
}
