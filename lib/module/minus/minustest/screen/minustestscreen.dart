import 'package:app/module/minus/minustest/controller/minustestcontroller.dart';
import 'package:app/module/minus/minustest/widget/errortext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MinusTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MinusTestController>(
      init: MinusTestController(),
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              controller.steps[controller.currentStep],
              if (controller.currentStep != 0) ErrorText(),
            ],
          ),
        );
      },
    );
  }
}
