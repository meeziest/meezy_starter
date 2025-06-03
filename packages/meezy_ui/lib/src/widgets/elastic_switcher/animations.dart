import 'package:flutter/cupertino.dart';

class StretchTweenAnimationBuilder extends TweenAnimationBuilder<double> {
  StretchTweenAnimationBuilder({
    super.key,
    required double stretchFactor,
    super.duration = const Duration(milliseconds: 700),
    required super.builder,
  }) : super(
          tween: Tween<double>(begin: 1.0, end: stretchFactor),
          curve: Curves.elasticOut,
        );
}

class TranslateTweenAnimationBuilder extends TweenAnimationBuilder<double> {
  TranslateTweenAnimationBuilder({
    super.key,
    required double stretchDistance,
    super.duration = const Duration(milliseconds: 700),
    required super.builder,
  }) : super(
          tween: Tween<double>(begin: 0.0, end: stretchDistance),
          curve: Curves.elasticOut,
        );
}
