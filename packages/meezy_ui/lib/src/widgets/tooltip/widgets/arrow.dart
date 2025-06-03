import 'package:flutter/material.dart';

import '../models/directions.dart';
import '../models/enum/tooltip_position.dart';

/// Custom painter for drawing the tail arrow of a tooltip.
class ArrowTailPainter extends CustomPainter {
  final Color color;
  final TooltipPosition position;

  ArrowTailPainter({
    required this.color,
    required this.position,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final path = Path();

    if (Directions.up.contains(position)) {
      // For a tooltip above the target, the tail should point downward.
      path.moveTo(0, 0);
      path.lineTo(size.width / 2, size.height);
      path.lineTo(size.width, 0);
      path.close();
      canvas.translate(0, -1);
    } else if (Directions.down.contains(position)) {
      // For a tooltip below the target, the tail should point upward.
      path.moveTo(0, size.height);
      path.lineTo(size.width / 2, 0);
      path.lineTo(size.width, size.height);
      path.close();
      canvas.translate(0, 1);
    } else if (Directions.right.contains(position)) {
      // For a tooltip to the right, the tail should point left.
      path.moveTo(size.width, 0);
      path.lineTo(0, size.height / 2);
      path.lineTo(size.width, size.height);
      path.close();
      canvas.translate(1, 0);
    } else if (Directions.left.contains(position)) {
      // For a tooltip to the left, the tail should point right.
      path.moveTo(0, 0);
      path.lineTo(size.width, size.height / 2);
      path.lineTo(0, size.height);
      path.close();
      canvas.translate(-1, 0);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant ArrowTailPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.position != position;
  }
}

/// [ArrowTail] serves as the tail of a tooltip bubble pointing to the triggered element.
/// This version uses a [CustomPainter] to draw the arrow tail instead of using SVG assets.
class ArrowTail extends StatelessWidget {
  final Color color;
  final TooltipPosition position;

  const ArrowTail({
    required this.color,
    required this.position,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ArrowTailPainter(
        color: color,
        position: position,
      ),
      size: _getSizeForPosition(),
    );
  }

  // Adjust the size of the CustomPaint based on the arrow direction.
  Size _getSizeForPosition() {
    if (Directions.up.contains(position) || Directions.down.contains(position)) {
      return const Size(20, 10);
    } else if (Directions.left.contains(position) || Directions.right.contains(position)) {
      return const Size(10, 20);
    }
    return Size.zero;
  }
}
