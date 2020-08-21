import 'package:app/app/route/approute.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:sa_anicoto/sa_anicoto.dart';
import 'package:supercharged/supercharged.dart';

class SimpantTeleponJauh extends StatefulWidget {
  @override
  _SimpantTeleponJauhState createState() => _SimpantTeleponJauhState();
}

class _SimpantTeleponJauhState extends State<SimpantTeleponJauh> with AnimationMixin {
  final duration = 7.0;
  Animation<double> durationTween;

  @override
  void initState() {
    super.initState();

    durationTween = duration.tweenTo(0.0).animatedBy(controller);
    controller.play(duration: duration.seconds);

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Get.offNamed(AppRoute.minusTestPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Simpan Smartphone anda dan",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              "Menjauh",
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              "Test Akan dimulai dalam",
              style: Theme.of(context).textTheme.caption,
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
      ),
    );
  }
}
