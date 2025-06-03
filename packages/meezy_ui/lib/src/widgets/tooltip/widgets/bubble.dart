import 'package:flutter/material.dart';

import '../models/directions.dart';
import '../models/enum/tooltip_position.dart';

/// [BaseBubble] is an abstract base class for creating different types of
/// bubbles, providing common properties and structure.
abstract class BaseBubble extends StatelessWidget {
  const BaseBubble({
    super.key,
    required this.color,
    required this.child,
    this.position,
    this.tail,
  });

  /// The background color of the bubble.
  final Color color;

  /// The position of the bubble relative to its target.
  final TooltipPosition? position;

  /// The main content displayed inside the bubble.
  final Widget child;

  /// An optional tail widget to be displayed with the bubble.
  final Widget? tail;

  /// Builds the bubble layout with optional tail and specific styling.
  Widget buildBubble(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Opacity(
        opacity: 1.0,
        child: buildBubble(context),
      ),
    );
  }
}

/// [Bubble] is a classic tooltip container.
class Bubble extends BaseBubble {
  /// Creates a [Bubble] widget.
  const Bubble({
    super.key,
    super.color = Colors.white,
    super.position,
    required super.child,
    super.tail,
    this.padding,
    this.radius = BorderRadius.zero,
    this.clipBehavior,
  });

  /// The padding around the [child] inside the bubble.
  final EdgeInsets? padding;

  /// The border radius of the bubble.
  final BorderRadiusGeometry radius;

  /// The clipping behavior of the bubble container.
  final Clip? clipBehavior;

  @override
  Widget buildBubble(BuildContext context) {
    final bool isVertical = Directions.up.contains(position) || Directions.down.contains(position);

    final bool needsReverse = Directions.down.contains(position) || Directions.right.contains(position);

    final List<Widget> tailWidgets = [
      const SizedBox(width: 4, height: 4),
      tail ?? const SizedBox(),
      const SizedBox(width: 4, height: 4),
    ];

    final List<Widget> bubbleContent = [
      Container(
        clipBehavior: clipBehavior ?? Clip.none,
        decoration: BoxDecoration(borderRadius: radius, color: color),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(10),
          child: child,
        ),
      ),
      if (tail != null)
        Wrap(
          direction: isVertical ? Axis.horizontal : Axis.vertical,
          children: needsReverse ? tailWidgets.reversed.toList() : tailWidgets,
        ),
    ];

    return Wrap(
      direction: isVertical ? Axis.vertical : Axis.horizontal,
      crossAxisAlignment: position?.wrapAlignment ?? WrapCrossAlignment.center,
      children: needsReverse ? bubbleContent.reversed.toList() : bubbleContent,
    );
  }
}

/// [MessageBubble] is a specialized bubble for displaying messages.
class MessageBubble extends BaseBubble {
  /// Creates a [MessageBubble] widget.
  const MessageBubble({
    super.key,
    super.color = Colors.white,
    super.position,
    required super.child,
    super.tail,
  });

  @override
  Widget buildBubble(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (tail != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: tail,
          ),
        Expanded(
          child: Container(
            constraints: const BoxConstraints(minHeight: 48),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: color,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: child,
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
