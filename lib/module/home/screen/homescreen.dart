import 'package:app/app/assets/appassets.dart';
import 'package:app/module/home/widget/homebottom.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppAssets.bg,
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.saturation,
            color: Colors.grey,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Theme.of(context).primaryColor.withAlpha(75),
          ),
          HomeBottom(),
        ],
      ),
    );
  }
}
