import 'package:app/module/minus/minustest/controller/testcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MinusTestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestController>(
      init: TestController(),
      builder: (controller) {
        return PageView.builder(
          controller: controller.pageController,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.widgets.length,
          itemBuilder: (context, i) {
            return controller.widgets[i];
          },
        );
      },
    );
  }
}
