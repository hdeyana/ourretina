import 'dart:math';

import 'package:app/app/assets/appassets.dart';
import 'package:app/common/model/facedirectios.dart';
import 'package:app/module/minus/minustest/controller/minustestcontroller.dart';
import 'package:app/module/minus/minustest/controller/testcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class SymbolText extends StatefulWidget {
  final int index;
  SymbolText(this.index);
  @override
  _SymbolTextState createState() => _SymbolTextState();
}

class _SymbolTextState extends State<SymbolText> with AnimationMixin {
  final duration = 7.0;
  Animation<double> durationTween;

  MinusTestController _minusTestController = Get.find();
  TestController _testController = Get.find();

  @override
  void initState() {
    super.initState();
    _minusTestController.initializeCamera();
    durationTween = duration.tweenTo(0.0).animatedBy(controller);
    controller.play(duration: duration.seconds);

    _minusTestController.warningText.listen((v) {
      if (v.isEmpty)
        controller.play();
      else
        controller.stop();
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _testController.nextAnswer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final FaceDirections di = _testController.tests[widget.index].question.getFaceDirection();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Perhatikan orientasi simbol di bawah ini',
          style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 48),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 36),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.5),
          ),
          child: Center(
            child: Transform.rotate(
              angle: pi * di.getAngle(),
              child: Image.asset(
                AppAssets.letterE,
                fit: BoxFit.scaleDown,
                width: _testController.tests[widget.index].fontSize.toDouble(),
              ),
            ),
          ),
        ),
        SizedBox(height: 48),
        CircularPercentIndicator(
          radius: 70,
          lineWidth: 8,
          circularStrokeCap: CircularStrokeCap.round,
          percent: (durationTween.value / duration),
          progressColor: Theme.of(context).accentColor,
          center: Text(
            durationTween.value.toStringAsFixed(0).toString(),
            style: TextStyle(fontSize: 24),
          ),
        )
      ],
    );
  }
}
