import 'package:flutter/widgets.dart';

import '../tooltip.dart';

/// Wraps a widget with [ClipPath] and Animates [clipper] with a [PathBuilder].
class ClipPathTransition extends AnimatedWidget {
  const ClipPathTransition({
    super.key,
    required Animation<double> animation,
    this.pathBuilder = PathBuilders.circleIn,
    this.clipBehavior = Clip.antiAlias,
    this.position = TooltipPosition.topStart,
    this.child,
  }) : super(listenable: animation);

  /// The animation that controls the ClipPath of the child.
  Animation<double> get value => listenable as Animation<double>;

  final PathBuilder pathBuilder;
  final Clip clipBehavior;
  final TooltipPosition position;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipBehavior: clipBehavior,
      clipper: PathBuilderClipper(
        value: value.value,
        position: position,
        pathBuilder: pathBuilder,
      ),
      child: child,
    );
  }
}
