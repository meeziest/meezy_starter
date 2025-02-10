import 'package:flutter/material.dart';

import '../animations/animations.dart';

class DrawerNavTransition extends StatefulWidget {
  const DrawerNavTransition(
      {required this.animation, required this.backgroundColor, required this.child, super.key});

  final Animation<double> animation;
  final Color backgroundColor;
  final Widget child;

  @override
  State<DrawerNavTransition> createState() => _BottomBarTransition();
}

class _BottomBarTransition extends State<DrawerNavTransition> {
  late final Animation<Offset> offsetAnimation = Tween<Offset>(
    begin: const Offset(-1, 0),
    end: Offset.zero,
  ).animate(OffsetAnimation(parent: widget.animation));

  late final Animation<double> widthAnimation = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(SizeAnimation(parent: widget.animation));

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: DecoratedBox(
        decoration: BoxDecoration(color: widget.backgroundColor),
        child: Align(
          alignment: Alignment.topLeft,
          widthFactor: widthAnimation.value,
          child: FractionalTranslation(
            translation: offsetAnimation.value,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
