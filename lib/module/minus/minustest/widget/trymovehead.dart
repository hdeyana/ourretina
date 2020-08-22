import 'package:app/common/model/facedirectios.dart';
import 'package:app/common/widget/arrowdirection.dart';
import 'package:app/module/global/controller/globalcontroller.dart';
import 'package:app/module/minus/minustest/controller/minustestcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class TryMoveHead extends StatefulWidget {
  @override
  _TryMoveHeadState createState() => _TryMoveHeadState();
}

class _TryMoveHeadState extends State<TryMoveHead> with AnimationMixin {
  final duration = 2.5;
  Animation<double> durationTween;
  bool turnedOn = false;

  MinusTestController _minusTestController = Get.find();
  GlobalController _gc = Get.find();

  @override
  void initState() {
    super.initState();

    durationTween = 0.0.tweenTo(duration).animatedBy(controller);

    _minusTestController.facedirection.listen((FaceDirections v) {
      controller.reset();
      if (v != FaceDirections.nan) controller.play(duration: duration.seconds);
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        setState(() {
          turnedOn = true;
        });
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
              padding: const EdgeInsets.all(36),
              child: Text(
                'Coba Gerakan Kepala Anda',
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
            ),
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
                            directions: ArrowDirections.down,
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
                            directions: ArrowDirections.up,
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
                            directions: ArrowDirections.right,
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
            if (_gc.isTrained || turnedOn)
              RaisedButton(
                child: Text('Mulai Test'),
                onPressed: () {
                  _gc.trainComplete();
                  _minusTestController.nextStep();
                },
              ),
          ],
        ),
      ),
    );
  }
}
