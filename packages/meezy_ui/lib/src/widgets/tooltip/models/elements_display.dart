import 'package:flutter/material.dart';

import '../tooltip.dart';

class ToolTipElementsDisplay {
  final ElementBox bubble;
  final ElementBox arrow;
  final TooltipPosition position;
  final BorderRadiusGeometry? radius;

  ToolTipElementsDisplay({
    required this.bubble,
    required this.arrow,
    required this.position,
    this.radius,
  });
}
