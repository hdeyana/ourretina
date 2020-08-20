import 'package:app/app/style/color.dart';
import 'package:app/module/minus/minustest/controller/minustestcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorText extends StatelessWidget {
  final MinusTestController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.warningText.value.isEmpty) return Container();
      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Card(
            elevation: 10,
            color: OurRetinaColors.redError,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(24),
              child: Obx(
                () => Text(
                  controller.warningText.value,
                  style: TextStyle(color: Colors.white, fontSize: 36),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
