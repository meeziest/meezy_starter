import 'package:flutter/material.dart';

class MessageBubbleWidget extends StatelessWidget {
  const MessageBubbleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const Text(
              "Type your first message here",
              style: TextStyle(color: Colors.white),
            ),
            Positioned(
              right: 20, // смещение от края
              bottom: 0,
              child: CustomPaint(
                size: const Size(16, 10), // размер выноски
                painter: TrianglePainter(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.grey[800]!;

    final path = Path();
    // Рисуем треугольник справа снизу
    path.moveTo(30, 30); // левая верхняя точка треугольника
    path.lineTo(30, size.height / 2); // острие треугольника направлено вправо
    path.lineTo(0, size.height); // левая нижняя точка треугольника
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
