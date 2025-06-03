import 'dart:math' as math;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meezy_ui/meezy_ui.dart';

class MeteorShower extends StatefulWidget {
  final Widget child;
  final int numberOfMeteors;
  final Duration duration;
  final double meteorMaxRadius;
  final bool isOnBackline;
  final Color? backgroundColor;
  final Color? meteorsColor;
  final LinearGradient? gradient;
  final double? height;
  final bool show;

  const MeteorShower({
    super.key,
    required this.child,
    this.backgroundColor,
    this.numberOfMeteors = 100,
    this.meteorMaxRadius = 3,
    this.isOnBackline = false,
    this.height,
    this.gradient,
    this.show = true,
    this.meteorsColor,
    this.duration = const Duration(seconds: 30),
  });

  @override
  State<MeteorShower> createState() => _MeteorShowerState();
}

class _MeteorShowerState extends State<MeteorShower> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<Meteor> _meteors = [];
  final double meteorAngle = pi / 4;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _initializeMeteors(Size size) {
    if (_meteors.isEmpty) {
      _meteors = List.generate(
        widget.numberOfMeteors,
        (_) => Meteor(
          angle: meteorAngle,
          size: size,
          maxRadius: widget.meteorMaxRadius,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(constraints.maxWidth, widget.height ?? constraints.maxHeight);
        _initializeMeteors(size);

        final stack = [
          widget.child,
          if (widget.show)
            Positioned(
              left: -size.height,
              child: CustomPaint(
                size: size,
                painter: MeteorPainter(
                  meteors: _meteors,
                  controller: _controller,
                  meteorMaxRadius: widget.meteorMaxRadius,
                  meteorColors: widget.meteorsColor ?? context.colorScheme.tertiary,
                ),
              ).animate().fadeIn(),
            ),
        ];

        return DecoratedBox(
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? Colors.transparent,
            gradient: widget.gradient,
          ),
          child: Stack(
            children: widget.isOnBackline ? stack.reversed.toList() : stack,
          ),
        );
      },
    );
  }
}

class MeteorPainter extends CustomPainter {
  final List<Meteor> meteors;
  final AnimationController controller;
  final double meteorMaxRadius;
  final Color meteorColors;

  MeteorPainter({
    required this.meteors,
    required this.controller,
    required this.meteorMaxRadius,
    required this.meteorColors,
  }) : super(repaint: controller);

  @override
  void paint(Canvas canvas, Size size) {
    for (final meteor in meteors) {
      final progress = ((controller.value - meteor.delay) % 1.0) / meteor.duration;
      final dx = meteor.startX + (meteor.endX - meteor.startX) * progress;
      final dy = meteor.startY + (meteor.endY - meteor.startY) * progress;

      const trailLength = 30;
      for (int i = 1; i <= trailLength; i++) {
        final alpha = (255 * (i / trailLength)).toInt();
        final trailPaint = Paint()
          ..color = meteorColors.withAlpha(alpha)
          ..style = PaintingStyle.fill;
        canvas.drawCircle(
          Offset(dx - trailLength + i, dy - trailLength + i),
          meteor.radius * 0.33,
          trailPaint,
        );
      }

      final outerGlowPaint = Paint()
        ..color = meteorColors
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

      canvas.drawCircle(
        Offset(dx, dy),
        meteor.radius * 2.0,
        outerGlowPaint,
      );

      final Paint circlePaint = Paint()
        ..color = meteorColors
        ..style = PaintingStyle.fill;

      final starPath = _drawStar(Offset(dx, dy), meteor.radius);
      canvas.drawPath(starPath, circlePaint);
    }
  }

  Path _drawStar(Offset center, double size) {
    final path = Path();
    final double fullSize = size;

    // Control point distance for the quadratic curves
    // This controls how much the sides curve inward
    final double controlPointDistance = fullSize * 0.4;

    for (int i = 0; i < 4; i++) {
      final angle = (i * math.pi / 2); // 90 degree rotation for each point

      // Calculate point position
      final pointX = center.dx + math.cos(angle) * fullSize;
      final pointY = center.dy + math.sin(angle) * fullSize;

      if (i == 0) {
        path.moveTo(pointX, pointY);
      } else {
        // Calculate control point for the quadratic curve
        final prevAngle = ((i - 1) * math.pi / 2);
        final midAngle = prevAngle + math.pi / 4; // Halfway between points

        final controlX = center.dx + math.cos(midAngle) * controlPointDistance;
        final controlY = center.dy + math.sin(midAngle) * controlPointDistance;

        // Draw curved line to next point
        path.quadraticBezierTo(controlX, controlY, pointX, pointY);
      }
    }

    // Close the path with final curve
    final controlX = center.dx + math.cos(7 * math.pi / 4) * controlPointDistance;
    final controlY = center.dy + math.sin(7 * math.pi / 4) * controlPointDistance;

    path.quadraticBezierTo(controlX, controlY, center.dx + fullSize, center.dy);

    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class Meteor {
  final double startX;
  final double startY;
  late double endX;
  late double endY;
  final double delay;
  final double duration;
  final double radius;

  Meteor({required double angle, required Size size, required double maxRadius})
      : startX = Random().nextDouble() * (size.height + size.width),
        startY = 0,
        delay = Random().nextDouble(),
        duration = 0.4 + Random().nextDouble(),
        radius = maxRadius * Random().nextDouble() {
    var distance = size.height * 2;
    endX = startX + cos(angle) * distance;
    endY = startY + sin(angle) * distance;
  }
}
