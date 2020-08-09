import 'package:animated_text/animated_text.dart';
import 'package:app/app/controller/basecontroller.dart';
import 'package:app/app/route/approute.dart';
import 'package:get/get.dart';

class OnboardingController extends BaseController {
  AnimatedTextController animatedTextController = AnimatedTextController.play;

  stopAnimation() async {
    animatedTextController = AnimatedTextController.pause;
    update();
    await Future.delayed(Duration(seconds: 2));
    Get.offNamed(AppRoute.homePage);
  }
}
