import 'package:app/common/model/facedirectios.dart';
import 'package:app/common/widget/arrowdirection.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/module/minus/minustest/controller/minustestcontroller.dart';
import 'package:app/module/minus/minustest/controller/testcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class HeadDirection extends StatefulWidget {
  @override
  _HeadDirectionState createState() => _HeadDirectionState();
}

class _HeadDirectionState extends State<HeadDirection> with AnimationMixin {
  final duration = 2.5;
  Animation<double> durationTween;

  MinusTestController _minusTestController = Get.find();
  TestController _testController = Get.find();

  @override
  void initState() {
    super.initState();

    durationTween = 0.0.tweenTo(duration).animatedBy(controller);

    _minusTestController.warningText.listen((v) {
      if (v.isEmpty)
        controller.play(duration: duration.seconds);
      else
        controller.stop();
    });

    _minusTestController.facedirection.listen((FaceDirections v) {
      controller.reset();
      if (v != FaceDirections.nan) controller.play(duration: duration.seconds);
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _testController.nextTest();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                S.of(context).kemanaOrientasiHurufSebelumnya,
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 24),
            Container(
              width: double.maxFinite,
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularPercentIndicator(
                          radius: 125,
                          lineWidth: 8,
                          circularStrokeCap: CircularStrokeCap.round,
                          percent: _minusTestController.facedirection.value == FaceDirections.topleft ? (durationTween.value / duration) : 0.0,
                          progressColor: Theme.of(context).accentColor,
                          center: ArrowDirection(
                            directions: ArrowDirections.up,
                            circleColor: _minusTestController.facedirection.value == FaceDirections.topleft ? Theme.of(context).accentColor : null,
                          ),
                        ),
                        SizedBox(width: 24),
                        CircularPercentIndicator(
                          radius: 125,
                          lineWidth: 8,
                          circularStrokeCap: CircularStrokeCap.round,
                          percent: _minusTestController.facedirection.value == FaceDirections.topright ? (durationTween.value / duration) : 0.0,
                          progressColor: Theme.of(context).accentColor,
                          center: ArrowDirection(
                            directions: ArrowDirections.right,
                            circleColor: _minusTestController.facedirection.value == FaceDirections.topright ? Theme.of(context).accentColor : null,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularPercentIndicator(
                          radius: 125,
                          lineWidth: 8,
                          circularStrokeCap: CircularStrokeCap.round,
                          percent: _minusTestController.facedirection.value == FaceDirections.bottomleft ? (durationTween.value / duration) : 0.0,
                          progressColor: Theme.of(context).accentColor,
                          center: ArrowDirection(
                            directions: ArrowDirections.left,
                            circleColor: _minusTestController.facedirection.value == FaceDirections.bottomleft ? Theme.of(context).accentColor : null,
                          ),
                        ),
                        SizedBox(width: 24),
                        CircularPercentIndicator(
                          radius: 125,
                          lineWidth: 8,
                          circularStrokeCap: CircularStrokeCap.round,
                          percent: _minusTestController.facedirection.value == FaceDirections.bottomright ? (durationTween.value / duration) : 0.0,
                          progressColor: Theme.of(context).accentColor,
                          center: ArrowDirection(
                            directions: ArrowDirections.down,
                            circleColor: _minusTestController.facedirection.value == FaceDirections.bottomright ? Theme.of(context).accentColor : null,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Text(
              _minusTestController.facedirection.value.index.getFaceName(),
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 36),
          ],
        ),
      ),
    );
  }
}
