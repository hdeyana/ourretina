import 'package:app/common/widget/arrowdirection.dart';
import 'package:flutter/material.dart';

class CobaGerakanKepala extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 24,
      crossAxisSpacing: 24,
      childAspectRatio: 1,
      padding: const EdgeInsets.all(36.0),
      physics: NeverScrollableScrollPhysics(),
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
    );
  }
}
