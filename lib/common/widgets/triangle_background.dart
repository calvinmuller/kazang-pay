import 'package:flutter/material.dart';
import '../../core/constants.dart';
import '../../theme.dart';
import 'triangle_painter.dart';

class TriangleBackground extends StatelessWidget {
  final Widget child;
  final Color triangleColor;
  final BoxDecoration? decoration;

  const TriangleBackground({
    super.key,
    required this.child,
    this.triangleColor = const Color(0xFF43A2D9), // Light gray from CustomColours.grayscale
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: CustomTheme.backgroundDark,
      ),
      child: Stack(
        children: [
          // Triangle background
          Positioned.fill(
            child: CustomPaint(
              painter: TrianglePainter(color: triangleColor),
            ),
          ),
          // Original child content
          child,
        ],
      ),
    );
  }
}