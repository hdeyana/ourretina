import 'package:animated_text/animated_text.dart';
import 'package:app/module/onboarding/controller/onboardingcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
      init: OnboardingController(),
      builder: (c) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset(
                'assets/onboarding.jpeg',
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black12,
                width: double.infinity,
                height: double.infinity,
              ),
              Container(
                height: double.infinity,
                alignment: Alignment.centerLeft,
                child: AnimatedText(
                  alignment: Alignment.center,
                  speed: Duration(milliseconds: 1000),
                  controller: c.animatedTextController,
                  wordList: ['Rapid Test.', 'For You.', 'Your Eyes.', 'OurRetina'],
                  repeatCount: 1,
                  textStyle: Theme.of(context).textTheme.headline2.copyWith(color: Colors.white),
                  onAnimate: (index) {
                    print(index);
                    if (index == 3) c.stopAnimation();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
