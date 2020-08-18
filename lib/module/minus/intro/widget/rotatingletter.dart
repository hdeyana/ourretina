import 'package:app/app/assets/appassets.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class RotatingLetter extends StatelessWidget {
  final tween = MultiTween<String>()..add("a", 0.0.tweenTo(0.5), 1.seconds)..add("a", 0.5.tweenTo(1), 1.seconds)..add("a", (1.0).tweenTo((-0.5)), 1.seconds)..add("a", (-0.5).tweenTo((0)), 1.seconds);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: MirrorAnimation<MultiTweenValues<String>>(
            builder: (BuildContext context, _, value) {
              return Transform.rotate(
                angle: pi * value.get("a"),
                child: Image.asset(AppAssets.letterE),
              );
            },
            duration: tween.duration,
            tween: tween,
          ),
        ),
      ],
    );
  }
}
