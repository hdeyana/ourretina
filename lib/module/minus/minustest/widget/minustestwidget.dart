import 'package:app/module/minus/minustest/controller/testcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MinusTestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestController>(
      init: TestController(),
      builder: (controller) {
        return controller.widgets[controller.currentIndex];
      },
    );
  }
}
