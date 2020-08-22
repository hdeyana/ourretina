import 'package:app/module/hasiltestlist/controller/hasiltestlistcontroller.dart';
import 'package:app/module/hasiltestlist/widget/hasiltestitem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HasilTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HasilTestListController>(
      init: HasilTestListController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Hasi Test Anda'),
          ),
          body: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: controller.results.length,
            itemBuilder: (context, index) {
              return HasiTestItem(controller.results[index]);
            },
          ),
        );
      },
    );
  }
}
