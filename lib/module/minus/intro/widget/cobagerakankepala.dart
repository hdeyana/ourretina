import 'package:app/common/widget/arrowdirection.dart';
import 'package:flutter/material.dart';

class CobaGerakanKepala extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 24.0,
        runSpacing: 24.0,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [
          ArrowDirection(
            directions: ArrowDirections.down,
            circleColor: Theme.of(context).primaryColor,
          ),
          ArrowDirection(
            directions: ArrowDirections.up,
          ),
          ArrowDirection(
            directions: ArrowDirections.left,
          ),
          ArrowDirection(
            directions: ArrowDirections.right,
          ),
        ],
      ),
    );
  }
}
