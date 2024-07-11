import 'package:flutter/material.dart';

import '../animations/animations.dart';

class SectionTransition extends StatefulWidget {
  const SectionTransition({required this.animation, required this.child, super.key});

  final Animation<double> animation;
  final Widget child;

  @override
  State<SectionTransition> createState() => _SectionTransition();
}

class _SectionTransition extends State<SectionTransition> {
  late final Animation<double> widthAnimation = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(SizeAnimation(parent: widget.animation));

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      widthFactor: widthAnimation.value,
      child: widget.child,
    );
  }
}
