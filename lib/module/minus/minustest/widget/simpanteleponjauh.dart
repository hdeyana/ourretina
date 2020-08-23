import 'package:app/app/assets/appassets.dart';
import 'package:app/app/route/approute.dart';
import 'package:app/module/minus/minustest/controller/minustestcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:sa_anicoto/sa_anicoto.dart';
import 'package:supercharged/supercharged.dart';

class SimpantTeleponJauh extends StatefulWidget {
  @override
  _SimpantTeleponJauhState createState() => _SimpantTeleponJauhState();
}

class _SimpantTeleponJauhState extends State<SimpantTeleponJauh> with AnimationMixin, WidgetsBindingObserver {
  final duration = 7.0;
  Animation<double> durationTween;
  MinusTestController _minusTestController = Get.find();

  @override
  void initState() {
    super.initState();
    checkCameraPermision();

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

  checkCameraPermision() async {
    final status = await Permission.camera.status;
    if (status != PermissionStatus.granted) Get.toNamed(AppRoute.cameraPermision);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // App state changed before we got the chance to initialize.

    if (state == AppLifecycleState.inactive) {
      controller.stop();
    } else if (state == AppLifecycleState.resumed) {
      controller.reset();
      controller.play();
    }
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
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            SvgPicture.asset(AppAssets.headJarak),
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
