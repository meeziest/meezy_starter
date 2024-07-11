import 'dart:ui';

import 'package:flutter/material.dart';

import '../animations/animations.dart';

class AnimatedFloatingActionButton extends StatefulWidget {
  const AnimatedFloatingActionButton({
    required this.animation,
    required this.tag,
    super.key,
    this.elevation,
    this.onPressed,
    this.child,
  });

  final String tag;
  final Animation<double> animation;
  final VoidCallback? onPressed;
  final Widget? child;
  final double? elevation;

  @override
  State<AnimatedFloatingActionButton> createState() => _AnimatedFloatingActionButton();
}

class _AnimatedFloatingActionButton extends State<AnimatedFloatingActionButton> {
  late final ColorScheme _colorScheme = Theme.of(context).colorScheme;
  late final Animation<double> _scaleAnimation = ScaleAnimation(parent: widget.animation);
  late final Animation<double> _shapeAnimation = ShapeAnimation(parent: widget.animation);

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: FloatingActionButton(
        heroTag: widget.tag,
        elevation: widget.elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(lerpDouble(30, 15, _shapeAnimation.value)!),
          ),
        ),
        backgroundColor: _colorScheme.tertiaryContainer,
        foregroundColor: _colorScheme.onTertiaryContainer,
        onPressed: widget.onPressed,
        child: widget.child,
      ),
    );
  }
}
