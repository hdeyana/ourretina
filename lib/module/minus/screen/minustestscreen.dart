import 'package:app/common/quartercircle.dart';
import 'package:app/module/minus/controller/minuscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MinusTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MinusController>(
      init: MinusController(),
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
                    child: Stack(
                      children: [
                        CircularPercentIndicator(
                          radius: MediaQuery.of(context).size.width - 16,
                          lineWidth: 10.0,
                          percent: 0.7,
                          backgroundColor: Colors.white,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: SizedBox(
                            width: MediaQuery.of(context).size.width - 48,
                            height: MediaQuery.of(context).size.width - 48,
                            child: Stack(
                              children: [
                                QuarterCircle(
                                  color: c.facedirection == FaceDirection.topleft ? Theme.of(context).primaryColor : Colors.grey[300],
                                  circleAlignment: CircleAlignment.topLeft,
                                  child: Icon(
                                    Icons.arrow_downward,
                                    size: 35,
                                  ),
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
                                Center(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 57,
                                  ),
                                ),
                                Center(
                                  child: CircleAvatar(
                                    backgroundColor: c.facedirection == FaceDirection.nan ? Theme.of(context).primaryColor : Colors.grey[300],
                                    radius: 50,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          progressColor: Colors.green,
                        ),
                      ],
                    ),
                  ),
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
                        Text('Left Open ${c.leftEyeOpen.toStringAsFixed(2) ?? 0}', style: Theme.of(context).textTheme.bodyText1),
                        Text('Right Open ${c.rightEyeOpen.toStringAsFixed(2) ?? 0}', style: Theme.of(context).textTheme.bodyText1),
                      ],
                    ))
              ],
            ));
      },
    );
  }
}
