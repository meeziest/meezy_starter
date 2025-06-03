import 'package:flutter/widgets.dart';

import '../../models/enum/tooltip_position.dart';

abstract class PathBuilder {
  const PathBuilder({this.invert = false});

  final bool invert;

  Path call(
    Size size,
    double value, {
    TooltipPosition position = TooltipPosition.topStart,
  }) {
    if (value == 1) return _getBoundary(size);
    if (value == 0) return Path();
    if (!invert) return buildPath(size, value, position: position);
    return Path.combine(
      PathOperation.reverseDifference,
      buildPath(size, 1 - value, position: position),
      _getBoundary(size),
    );
  }

  Path buildPath(
    Size size,
    double value, {
    TooltipPosition position = TooltipPosition.topStart,
  });

  Path _getBoundary(Size size) {
    return Path()..addRect(Rect.fromLTWH(-2, -2, size.width + 2, size.height + 2));
  }
}
