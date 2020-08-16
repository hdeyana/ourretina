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
    final isLeft = circleAlignment == CircleAlignment.topLeft || circleAlignment == CircleAlignment.bottomLeft;
    final isRight = circleAlignment == CircleAlignment.topRight || circleAlignment == CircleAlignment.bottomRight;

    return SizedBox(
      width: 80,
      height: 80,
      child: ClipRect(
        child: CustomPaint(
          painter: QuarterCirclePainter(
            circleAlignment: circleAlignment,
            color: color,
          ),
          child: Padding(
            padding: EdgeInsets.only(right: isLeft ? 36 : 0, left: isRight ? 36 : 0),
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
    final offset = circleAlignment == CircleAlignment.topLeft
        ? Offset(.0, .0)
        : circleAlignment == CircleAlignment.topRight ? Offset(size.width, .0) : circleAlignment == CircleAlignment.bottomLeft ? Offset(.0, size.height) : Offset(size.width, size.height);
    canvas.drawCircle(offset, radius, Paint()..color = color);
  }

  @override
  bool shouldRepaint(QuarterCirclePainter oldDelegate) {
    return color == oldDelegate.color && circleAlignment == oldDelegate.circleAlignment;
  }
}
