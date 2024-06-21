import 'package:flutter/material.dart';

class MessageCloudPainter extends CustomPainter {
  final Color color;
  final Gradient gradient;

  MessageCloudPainter({required this.color, required this.gradient});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..shader = gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    canvas.drawRect(const Offset(10, 10) & const Size(200, 60), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}