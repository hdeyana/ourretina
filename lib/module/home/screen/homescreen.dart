import 'package:app/module/home/widget/homebottom.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [HomeBottom()],
      ),
    );
  }
}
