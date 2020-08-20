import 'package:app/common/controller/camerafacecontroller.dart';
import 'package:app/common/widget/arrowdirection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CobaGerakanKepala extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CameraFaceController>(builder: (cam) {
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
            circleColor: cam.facedirection == FaceDirection.topleft ? Theme.of(context).accentColor : null,
          ),
          ArrowDirection(
            directions: ArrowDirections.up,
            circleColor: cam.facedirection == FaceDirection.topright ? Theme.of(context).accentColor : null,
          ),
          ArrowDirection(
            directions: ArrowDirections.left,
            circleColor: cam.facedirection == FaceDirection.bottomleft ? Theme.of(context).accentColor : null,
          ),
          ArrowDirection(
            directions: ArrowDirections.right,
            circleColor: cam.facedirection == FaceDirection.bottomright ? Theme.of(context).accentColor : null,
          ),
        ],
      );
    });
  }
}
