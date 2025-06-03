import 'package:flutter/cupertino.dart';

const _translationFactor = 0.3;

@immutable
class BlobPainter extends CustomPainter {
  final Color color;
  final double radius;
  final double radians;
  final double stretchScale;
  final double stretchDistance;

  const BlobPainter({
    required this.color,
    required this.radius,
    required this.radians,
    required this.stretchScale,
    required this.stretchDistance,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    canvas.translate(center.dx, center.dy);

    final Matrix4 transform = Matrix4.identity()
      ..rotateZ(radians)
      ..translate(stretchDistance * _translationFactor, 0)
      ..scale(stretchScale, 1 - (stretchScale - 1));

    canvas.transform(transform.storage);

    canvas.drawCircle(const Offset(0, 0), radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

@immutable
class BlobClipper extends CustomClipper<Path> {
  final double radius;
  final double radians;
  final double stretchScale;
  final double stretchDistance;

  const BlobClipper({
    required this.radius,
    required this.radians,
    required this.stretchScale,
    required this.stretchDistance,
  });

  @override
  Path getClip(Size size) {
    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    path.shift(Offset(center.dx, center.dy));

    path.addOval(Rect.fromCircle(
      center: const Offset(0, 0),
      radius: size.width / 2,
    ));

    final Matrix4 transform = Matrix4.identity()
      ..rotateZ(radians)
      ..translate(stretchDistance * _translationFactor, 0)
      ..scale(stretchScale, 1 - (stretchScale - 1));

    final transformedPath = path.transform(transform.storage);

    final Matrix4 alignTransformation = Matrix4.identity()..translate(center.dx, center.dy);
    final alignedPath = transformedPath.transform(alignTransformation.storage);

    return alignedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
