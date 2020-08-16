import 'package:app/common/quartercircle.dart';
import 'package:app/module/facedetector/controller/facedetectorcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FaceDetectorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FaceDetectorController>(
      init: FaceDetectorController(),
      builder: (c) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
            ),
            body: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "Dimana letak hidung, relatif thd mulut?",
                      style: Theme.of(context).textTheme.headline3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Stack(
                      overflow: Overflow.clip,
                      children: [
                        QuarterCircle(
                          color: c.facedirection == FaceDirection.topleft ? Theme.of(context).primaryColor : Colors.grey[300],
                          child: Icon(
                            Icons.arrow_downward,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: QuarterCircle(
                        color: c.facedirection == FaceDirection.topright ? Theme.of(context).primaryColor : Colors.grey[300],
                        circleAlignment: CircleAlignment.topRight,
                        child: Icon(
                          Icons.arrow_upward,
                          size: 35,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: QuarterCircle(
                        color: c.facedirection == FaceDirection.bottomleft ? Theme.of(context).primaryColor : Colors.grey[300],
                        circleAlignment: CircleAlignment.bottomLeft,
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Icon(
                            Icons.arrow_upward,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: QuarterCircle(
                        color: c.facedirection == FaceDirection.bottomright ? Theme.of(context).primaryColor : Colors.grey[300],
                        circleAlignment: CircleAlignment.bottomRight,
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Icon(
                            Icons.arrow_upward,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: <Widget>[
                        Text('Number of Faces ${c.numberOfFaces}', style: Theme.of(context).textTheme.bodyText1),
                        Text('Y ${c.angleY.toStringAsFixed(2) ?? 0}', style: Theme.of(context).textTheme.bodyText1),
                        Text('Z ${c.angleZ.toStringAsFixed(2) ?? 0}', style: Theme.of(context).textTheme.bodyText1),
                      ],
                    ))
              ],
            ));
      },
    );
  }
}
