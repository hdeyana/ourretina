import 'package:app/app/assets/appassets.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/module/minus/minustest/controller/minustestcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:sa_anicoto/sa_anicoto.dart';
import 'package:supercharged/supercharged.dart';

class TutupMata extends StatefulWidget {
  final bool isLeft;
  TutupMata(this.isLeft);

  @override
  _TutupMataState createState() => _TutupMataState();
}

class _TutupMataState extends State<TutupMata> with AnimationMixin {
  final duration = 7.0;
  Animation<double> durationTween;

  MinusTestController _minusTestController = Get.find();

  @override
  void initState() {
    super.initState();

    durationTween = duration.tweenTo(0.0).animatedBy(controller);
    controller.play(duration: duration.seconds);

    _minusTestController.warningText.listen((v) {
      if (v.isEmpty)
        controller.play(duration: duration.seconds);
      else
        controller.stop();
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _minusTestController.nextStep();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String introStr = S.of(context).tutupNmata;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(widget.isLeft ? AppAssets.headTutupMata : AppAssets.headTutupMataKanan),
          Text(
            "${introStr} ${widget.isLeft ? S.of(context).kiriMata : S.of(context).kananMata}",
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          CircularPercentIndicator(
            radius: 70,
            lineWidth: 6,
            circularStrokeCap: CircularStrokeCap.round,
            percent: (durationTween.value / duration),
            progressColor: Theme.of(context).accentColor,
            center: Text(
              durationTween.value.toStringAsFixed(0).toString(),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
