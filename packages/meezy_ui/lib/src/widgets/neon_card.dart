import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NeonCard extends StatefulWidget {
  final Widget child;
  final double intensity;
  final double glowSpread;
  final Color? firstColor;
  final Color? secondColor;
  final bool isEnabled;
  final Radius borderRadius;

  const NeonCard({
    super.key,
    required this.child,
    this.intensity = 0.3,
    this.glowSpread = 2.0,
    this.firstColor,
    this.secondColor,
    this.isEnabled = true,
    this.borderRadius = const Radius.circular(16),
  });

  @override
  _NeonCardState createState() => _NeonCardState();
}

class _NeonCardState extends State<NeonCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          children: [
            if (widget.isEnabled)
              Positioned.fill(
                child: CustomPaint(
                  painter: GlowRectanglePainter(
                    progress: _controller.value,
                    intensity: widget.intensity,
                    glowSpread: widget.glowSpread,
                    firstColor: widget.firstColor ?? const Color(0xFFFF00AA),
                    secondColor: widget.secondColor ?? const Color(0xFF00FFF1),
                    borderRadius: widget.borderRadius,
                  ),
                ),
              ).animate().fadeIn(),
            widget.child,
          ],
        );
      },
    );
  }
}

class GlowRectanglePainter extends CustomPainter {
  final double progress;
  final double intensity;
  final double glowSpread;
  final Color firstColor;
  final Color secondColor;
  final Radius borderRadius;

  GlowRectanglePainter({
    required this.progress,
    this.intensity = 0.3,
    this.glowSpread = 2.0,
    required this.firstColor,
    required this.secondColor,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(rect, borderRadius);

    final blackPaint = Paint()..color = Colors.black;
    canvas.drawRRect(rrect, blackPaint);

    final glowPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..shader = LinearGradient(
        colors: [
          Color.lerp(firstColor, secondColor, progress)!,
          Color.lerp(secondColor, firstColor, progress)!,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(rect);

    canvas.drawRRect(rrect, glowPaint);
  }

  @override
  bool shouldRepaint(GlowRectanglePainter oldDelegate) =>
      oldDelegate.progress != progress ||
      oldDelegate.intensity != intensity ||
      oldDelegate.glowSpread != glowSpread;
}
