import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../tooltip.dart';

class PathBuilderCircle extends PathBuilder {
  const PathBuilderCircle(bool invert) : super(invert: invert);

  @override
  Path buildPath(
    Size size,
    double value, {
    TooltipPosition position = TooltipPosition.topStart,
  }) {
    final double w = size.width;
    final double h = size.height;
    double centreX = w / 2;
    double centreY = h / 2;

    switch (position) {
      case TooltipPosition.topStart:
        centreX = 0;
        centreY = h;
      case TooltipPosition.topCenter:
        centreX = w / 2;
        centreY = h;
      case TooltipPosition.topEnd:
        centreX = w;
        centreY = h;
      case TooltipPosition.rightStart:
        centreX = 0;
        centreY = 0;
      case TooltipPosition.rightCenter:
        centreX = 0;
        centreY = h / 2;
      case TooltipPosition.rightEnd:
        centreX = 0;
        centreY = h;
      case TooltipPosition.bottomStart:
        centreX = 0;
        centreY = 0;
      case TooltipPosition.bottomCenter:
        centreX = w / 2;
        centreY = 0;
      case TooltipPosition.bottomEnd:
        centreX = w;
        centreY = 0;
      case TooltipPosition.leftStart:
        centreX = w;
        centreY = 0;
      case TooltipPosition.leftCenter:
        centreX = w;
        centreY = h / 2;
      case TooltipPosition.leftEnd:
        centreX = w;
        centreY = h;
    }

    final Offset center = Offset(centreX, centreY);
    final double maxRadius = sqrt(w * w + h * h);
    final double radius = value * maxRadius * 2;

    final rect = Rect.fromCenter(
      center: center,
      width: radius,
      height: radius,
    );

    return Path()..addOval(rect);
  }
}
