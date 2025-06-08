import 'package:flutter/material.dart';
import 'dart:math' as math;

class BackgroundPainter extends CustomPainter {
  final Animation<double> animation;
  final Color color;

  BackgroundPainter({
    required this.animation,
    required this.color,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    final path = Path();
    final y1 = size.height * 0.7;
    final y2 = size.height * 0.3;
    final x1 = size.width * 0.1;
    final x2 = size.width * 0.5;
    final x3 = size.width * 0.9;

    path.moveTo(0, y1);
    path.quadraticBezierTo(
      x1 + (math.sin(animation.value * math.pi) * 30),
      y1 + (math.cos(animation.value * math.pi) * 20),
      x2,
      y2 + (math.sin(animation.value * math.pi) * 30),
    );
    path.quadraticBezierTo(
      x3 - (math.cos(animation.value * math.pi) * 30),
      y2 - (math.sin(animation.value * math.pi) * 20),
      size.width,
      y1,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);

    // Draw additional decorative elements
    final circlePaint = Paint()
      ..color = color.withOpacity(0.05)
      ..style = PaintingStyle.fill;

    // Animated circles
    final circleRadius = 50.0 + (math.sin(animation.value * math.pi) * 10);
    canvas.drawCircle(
      Offset(size.width * 0.8, size.height * 0.2),
      circleRadius,
      circlePaint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.2, size.height * 0.8),
      circleRadius * 0.7,
      circlePaint,
    );
  }

  @override
  bool shouldRepaint(BackgroundPainter oldDelegate) =>
      animation != oldDelegate.animation || color != oldDelegate.color;
}
