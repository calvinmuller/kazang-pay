import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  final Color color;

  TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withAlpha(5) // Semi-transparent
      ..style = PaintingStyle.fill;

    final path = Path();
    path.lineTo(size.width, 0); // Top-right corner
    path.lineTo(0, size.height); // Bottom-left corner

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}