import 'package:app/module/hasiltestlist/widget/hasiltestitem.dart';
import 'package:flutter/material.dart';

class HasilTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasi Test Anda'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [HasiTestItem()],
      ),
    );
  }
}
