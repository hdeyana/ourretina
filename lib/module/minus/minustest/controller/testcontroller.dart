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
  final fontSizes = [100, 50, 25, 10];
  final rand = math.Random();
  final MinusTestController _minusTestController = Get.find();

  List<MinusTestModel> tests = [];
  List<Widget> widgets = [];
  int currentIndex = 0;
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
    currentIndex++;
    update();
  }

  nextTest() {
    _minusTestController.addAnswer(
      tests[currentTest].copyWith(
        answeredAt: DateTime.now(),
        answer: _minusTestController.facedirection.value.index,
      ),
    );
    if (currentIndex < 7) {
      currentIndex++;
      currentTest++;
      update();
    } else {
      _minusTestController.nextStep();
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
