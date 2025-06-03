import 'package:flutter/widgets.dart';

import '../tooltip.dart';

/// Uses a [PathBuilder] to return a [CustomClipper] for a given [value]
class PathBuilderClipper extends CustomClipper<Path> {
  PathBuilderClipper({
    required this.value,
    required this.pathBuilder,
    this.position = TooltipPosition.topStart,
  });

  final double value;
  final PathBuilder pathBuilder;
  final TooltipPosition position;

  @override
  Path getClip(Size size) {
    return pathBuilder(size, value, position: position);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
