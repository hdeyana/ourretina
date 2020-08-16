import 'package:app/module/minus/controller/minuscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MinusTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MinusController>(
      init: MinusController(),
      builder: (c) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Test Suara'),
          ),
          body: ListView(
            children: [for (var item in c.words) Text(item.recognizedWords)],
          ),
        );
      },
    );
  }
}
