import 'dart:math' as math;

import 'package:flutter/material.dart';

class StepRotatingShape extends StatefulWidget {
  final double size;
  final Duration rotationDuration;
  final Duration pauseDuration;
  final Color color;

  const StepRotatingShape({
    super.key,
    this.size = 100,
    this.rotationDuration = const Duration(milliseconds: 300),
    this.pauseDuration = const Duration(milliseconds: 200),
    this.color = const Color(0xFF8157E8),
  });

  @override
  State<StepRotatingShape> createState() => _StepRotatingShapeState();
}

class _StepRotatingShapeState extends State<StepRotatingShape> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.rotationDuration,
      vsync: this,
    );

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: math.pi / 2,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    ));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _startNextRotation();
      }
    });

    _startRotation();
  }

  void _startNextRotation() async {
    await Future.delayed(widget.pauseDuration);
    if (!mounted) return;

    _currentStep = (_currentStep + 1) % 4;
    if (_currentStep == 0) {
      _controller.value = 0;
    }
    _startRotation();
  }

  void _startRotation() {
    if (!mounted) return;
    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Add a SizedBox to constrain the size
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            size: Size(widget.size, widget.size),
            painter: StarPainter(
              rotationAngle: _currentStep * (math.pi / 2) + _rotationAnimation.value,
              color: widget.color,
            ),
          );
        },
      ),
    );
  }
}

class StarPainter extends CustomPainter {
  final double rotationAngle;
  final Color color;

  StarPainter({
    required this.rotationAngle,
    required this.color,
  });

  void _drawStar(Canvas canvas, Offset center, double size, Paint paint) {
    final path = Path();
    final double fullSize = size * 0.8; // Adjust size to 80% of the container to ensure it fits
    final double controlPointDistance = fullSize * 0.4;

    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(rotationAngle);
    canvas.translate(-center.dx, -center.dy);

    for (int i = 0; i < 4; i++) {
      final angle = (i * math.pi / 2);

      final pointX = center.dx + math.cos(angle) * fullSize;
      final pointY = center.dy + math.sin(angle) * fullSize;

      if (i == 0) {
        path.moveTo(pointX, pointY);
      } else {
        final prevAngle = ((i - 1) * math.pi / 2);
        final midAngle = prevAngle + math.pi / 4;

        final controlX = center.dx + math.cos(midAngle) * controlPointDistance;
        final controlY = center.dy + math.sin(midAngle) * controlPointDistance;

        path.quadraticBezierTo(controlX, controlY, pointX, pointY);
      }
    }

    final controlX = center.dx + math.cos(7 * math.pi / 4) * controlPointDistance;
    final controlY = center.dy + math.sin(7 * math.pi / 4) * controlPointDistance;

    path.quadraticBezierTo(controlX, controlY, center.dx + fullSize, center.dy);

    paint.style = PaintingStyle.fill;
    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final shapeSize = size.width / 2; // Use half of the width directly, since we're working with radius

    _drawStar(canvas, center, shapeSize, paint);
  }

  @override
  bool shouldRepaint(StarPainter oldDelegate) {
    return oldDelegate.rotationAngle != rotationAngle || oldDelegate.color != color;
  }
}

enum ParticleShape { circle, star, diamond }

class RisingParticles extends StatefulWidget {
  final int quantity;
  final List<Color> colors;
  final double maxSize;
  final double minSize;
  final ParticleShape? shape;

  const RisingParticles({
    super.key,
    this.quantity = 50,
    this.colors = const [
      Color(0xFF4C40BB), // Deep purple/blue
      Color(0xFF5DEC88), // Bright green
      Color(0xFFFF4423), // Bright red/orange
      Color(0xFF8157E8), // Bright purple
    ],
    this.maxSize = 8,
    this.minSize = 3,
    this.shape,
  });

  @override
  State<RisingParticles> createState() => _RisingParticlesState();
}

class _RisingParticlesState extends State<RisingParticles> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<RisingParticle> particles = [];
  Size canvasSize = Size.zero;
  final math.Random random = math.Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
    _controller.addListener(_updateParticles);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _initParticles() {
    particles.clear();
    for (int i = 0; i < widget.quantity; i++) {
      particles.add(_createParticle());
    }
  }

  RisingParticle _createParticle({double initialProgress = 0.0}) {
    // Random starting position at bottom of screen
    final x = random.nextDouble() * canvasSize.width;
    final y = canvasSize.height + random.nextDouble() * 20; // Slight variance in start

    // Control points for moderately pronounced S-curve
    // First control point - creates the bottom curve of S
    final cp1x =
        x + (random.nextDouble() * 60 + 30) * (random.nextBool() ? 1 : -1); // Moderate horizontal displacement
    final cp1y = canvasSize.height * 0.8; // Slightly higher first control point

    // Second control point - creates the top curve of S
    final cp2x =
        x + (random.nextDouble() * 60 + 30) * (cp1x < x ? 1 : -1); // Opposite direction, moderate displacement
    final cp2y = canvasSize.height * 0.65; // Adjusted second control point

    return RisingParticle(
      startX: x,
      startY: y,
      controlPoint1: Offset(cp1x, cp1y),
      controlPoint2: Offset(cp2x, cp2y),
      endX: x + (random.nextDouble() - 0.5) * 50,
      endY: canvasSize.height * 0.5, // Half screen height
      size: random.nextDouble() * (widget.maxSize - widget.minSize) + widget.minSize,
      color: widget.colors[random.nextInt(widget.colors.length)],
      shape: widget.shape ?? ParticleShape.values[random.nextInt(ParticleShape.values.length)],
      progress: initialProgress, // Random initial progress
      speed: 0.2 + random.nextDouble() * 0.3, // Random speed
    );
  }

  void _updateParticles() {
    for (final particle in particles) {
      particle.progress += particle.speed / 120; // Update based on speed

      if (particle.progress >= 1.0) {
        // Reset particle when it reaches the top
        final index = particles.indexOf(particle);
        particles[index] = _createParticle();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        canvasSize = Size(constraints.maxWidth, constraints.maxHeight);
        if (particles.isEmpty) {
          _initParticles();
        }

        return CustomPaint(
          size: Size.infinite,
          painter: RisingParticlesPainter(
            particles: particles,
            repaint: _controller,
          ),
        );
      },
    );
  }
}

class RisingParticlesPainter extends CustomPainter {
  final List<RisingParticle> particles;

  RisingParticlesPainter({required this.particles, required Listenable repaint})
      : super(
          repaint: repaint,
        );

  late final Path _unitStarPath = _buildUnitStarPath();
  late final Path _unitDiamondPath = _buildUnitDiamondPath();
  final Paint _paint = Paint()..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in particles) {
      // 1) compute eased opacity & size just once
      final easedProgress = Curves.easeIn.transform(p.progress);
      _paint.color = p.color.withAlpha((255 * (1 - easedProgress)).toInt());
      final curSize = p.size * (1 - (1 - 0.3) * easedProgress);

      // 2) compute your Bézier‐point using muls, not pow
      final t = p.progress;
      final mt = 1 - t;
      final mt2 = mt * mt;
      final t2 = t * t;
      final a = mt2 * mt;
      final b = 3 * mt2 * t;
      final c = 3 * mt * t2;
      final d = t2 * t;
      final x = a * p.startX + b * p.controlPoint1.dx + c * p.controlPoint2.dx + d * p.endX;
      final y = a * p.startY + b * p.controlPoint1.dy + c * p.controlPoint2.dy + d * p.endY;
      final pos = Offset(x, y);

      // 3) one save/restore per particle
      canvas.save();
      canvas.translate(pos.dx, pos.dy);
      canvas.rotate(p.progress * 4 * math.pi);

      switch (p.shape) {
        case ParticleShape.circle:
          // draw one cheap circle
          canvas.drawCircle(Offset.zero, curSize, _paint);
          break;
        case ParticleShape.star:
          // scale & draw the cached unit‐star
          canvas.save();
          canvas.scale(curSize);
          canvas.drawPath(_unitStarPath, _paint);
          canvas.restore();
          break;
        case ParticleShape.diamond:
          // scale & draw the cached unit‐diamond
          canvas.save();
          canvas.scale(curSize);
          canvas.drawPath(_unitDiamondPath, _paint);
          canvas.restore();
          break;
      }

      canvas.restore();
    }
  }

  /// Builds a 4-point “star” at unit size around the origin.
  Path _buildUnitStarPath() {
    final path = Path();
    const cpDist = 0.4;
    for (var i = 0; i < 4; i++) {
      final angle = i * math.pi / 2;
      final px = math.cos(angle);
      final py = math.sin(angle);
      if (i == 0) {
        path.moveTo(px, py);
      } else {
        final prev = (i - 1) * math.pi / 2;
        final mid = prev + math.pi / 4;
        path.quadraticBezierTo(
          math.cos(mid) * cpDist,
          math.sin(mid) * cpDist,
          px,
          py,
        );
      }
    }
    // close the last corner back to the first
    final mid = 7 * math.pi / 4;
    path.quadraticBezierTo(
      math.cos(mid) * cpDist,
      math.sin(mid) * cpDist,
      1,
      0,
    );
    path.close();
    return path;
  }

  /// Builds a diamond at unit size around the origin.
  Path _buildUnitDiamondPath() {
    return Path()
      ..moveTo(0, -1)
      ..lineTo(1, 0)
      ..lineTo(0, 1)
      ..lineTo(-1, 0)
      ..close();
  }

  @override
  bool shouldRepaint(RisingParticlesPainter oldDelegate) => true;
}

class RisingParticle {
  final double startX;
  final double startY;
  final Offset controlPoint1;
  final Offset controlPoint2;
  final double endX;
  final double endY;
  final double size;
  final Color color;
  final ParticleShape shape;
  double progress;
  final double speed;

  RisingParticle({
    required this.startX,
    required this.startY,
    required this.controlPoint1,
    required this.controlPoint2,
    required this.endX,
    required this.endY,
    required this.size,
    required this.color,
    required this.shape,
    required this.progress,
    required this.speed,
  });
}
