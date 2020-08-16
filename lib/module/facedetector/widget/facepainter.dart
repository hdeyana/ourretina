import 'package:flutter/material.dart';

class FacePainter extends CustomPainter {
  Rect rect;

  FacePainter({@required this.rect});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(8)),
      Paint()
        ..color = Colors.red
        ..strokeWidth = 1.0
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
