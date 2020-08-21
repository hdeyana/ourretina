import 'package:app/app/controller/basecontroller.dart';
import 'package:app/module/minus/minustest/controller/minustestcontroller.dart';
import 'package:app/module/minus/minustest/data/model/minustestmodel.dart';
import 'package:app/module/minus/minustest/widget/headdirection.dart';
import 'package:app/module/minus/minustest/widget/symboltext.dart';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercharged/supercharged.dart';

class TestController extends BaseController {
  final fontSizes = [150, 75, 25, 10];
  final rand = math.Random();
  final PageController pageController = PageController();
  final MinusTestController _minusTestController = Get.find();

  List<MinusTestModel> tests = [];
  List<Widget> widgets = [];
  int currentTest = 0;

  @override
  void onInit() {
    super.onInit();
    fontSizes.forEachIndexed((index, element) {
      widgets.addAll([SymbolText(index), HeadDirection()]);
      tests.add(MinusTestModel(
        question: rand.nextInt(4),
        fontSize: fontSizes[index],
      ));
    });
  }

  nextAnswer() {
    currentTest++;
    update();
    pageController.nextPage(duration: 200.milliseconds, curve: Curves.linear);
  }

  nextTest(int answer) {
    _minusTestController.addAnswer(
      tests[currentTest].copyWith(
        answeredAt: DateTime.now(),
        answer: answer,
      ),
    );
    if (currentTest != 4)
      pageController.nextPage(duration: 1.seconds, curve: Curves.linear);
    else
      _minusTestController.nextStep();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
