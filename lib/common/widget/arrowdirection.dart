import 'dart:math';

import 'package:app/app/assets/appassets.dart';
import 'package:flutter/material.dart';

class ArrowDirection extends StatelessWidget {
  final double radius;
  final Color circleColor;
  final ArrowDirections directions;
  ArrowDirection({this.circleColor, this.directions, this.radius});
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _direction,
      child: CircleAvatar(
        radius: radius ?? 50,
        backgroundColor: circleColor ?? Colors.grey,
        child: Image.asset(
          AppAssets.arrow,
          width: (radius ?? 50) - 10,
          color: Colors.white,
        ),
      ),
    );
  }

  double get _direction {
    switch (directions) {
      case ArrowDirections.right:
        return pi * 0.5;
        break;
      case ArrowDirections.left:
        return pi * -0.5;
        break;
      case ArrowDirections.up:
        return pi * 0;
        break;
      default:
        return pi;
    }
  }
}

enum ArrowDirections { right, left, up, down }
