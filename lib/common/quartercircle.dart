import 'package:flutter/material.dart';
import 'dart:math' as math;

enum CircleAlignment {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}

class QuarterCircle extends StatelessWidget {
  final CircleAlignment circleAlignment;
  final Color color;
  final Widget child;

  const QuarterCircle({
    this.color = Colors.grey,
    this.circleAlignment = CircleAlignment.topLeft,
    this.child,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width / 2) - (MediaQuery.of(context).size.width / 13),
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipRect(
          child: CustomPaint(
            painter: QuarterCirclePainter(
              circleAlignment: circleAlignment,
              color: color,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class QuarterCirclePainter extends CustomPainter {
  final CircleAlignment circleAlignment;
  final Color color;

  const QuarterCirclePainter({this.circleAlignment, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final radius = math.min(size.height, size.width);
    final offset = circleAlignment == CircleAlignment.bottomRight
        ? Offset(.0, .0)
        : circleAlignment == CircleAlignment.bottomLeft ? Offset(size.width, .0) : circleAlignment == CircleAlignment.topRight ? Offset(.0, size.height) : Offset(size.width, size.height);
    canvas.drawCircle(offset, radius, Paint()..color = color);
  }

  @override
  bool shouldRepaint(QuarterCirclePainter oldDelegate) {
    return color == oldDelegate.color && circleAlignment == oldDelegate.circleAlignment;
  }
}
