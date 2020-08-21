import 'package:app/module/minus/minustest/controller/minustestcontroller.dart';
import 'package:app/module/minus/minustest/controller/testcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MinusTestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MinusTestController>(builder: (snapshot) {
      if (snapshot.minuscameraController == null)
        return Center(
          child: Text('Cant Acces Camera'),
        );
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
    });
  }
}
