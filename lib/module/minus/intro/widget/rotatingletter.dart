import 'package:app/app/assets/appassets.dart';
import 'package:app/app/style/color.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class RotatingLetter extends StatelessWidget {
  final _tweens = MultiTween<DefaultAnimationProperties>()
    ..add(DefaultAnimationProperties.rotation, 0.0.tweenTo(0.0), 1200.milliseconds)
    ..add(DefaultAnimationProperties.rotation, 0.0.tweenTo(0.5), 500.milliseconds, Curves.easeInOut)
    ..add(DefaultAnimationProperties.rotation, 0.5.tweenTo(0.5), 1200.milliseconds)
    ..add(DefaultAnimationProperties.rotation, 0.5.tweenTo(1.0), 500.milliseconds, Curves.easeInOut)
    ..add(DefaultAnimationProperties.rotation, 1.0.tweenTo(1.0), 1200.milliseconds);

  @override
  Widget build(BuildContext context) {
    return MirrorAnimation<MultiTweenValues<DefaultAnimationProperties>>(
        tween: _tweens, // Pass in tween
        duration: _tweens.duration, // Pass in total duration obtained from MultiTween
        builder: (context, child, value) {
          return Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Expanded(
                    child: Transform.rotate(
                  angle: pi * value.get(DefaultAnimationProperties.rotation),
                  child: Image.asset(
                    AppAssets.letterE,
                    width: 150,
                  ),
                )),
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Transform.rotate(
                    angle: pi * (value.get(DefaultAnimationProperties.rotation) + 0.5),
                    child: Image.asset(
                      AppAssets.arrow,
                      width: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  value.get(DefaultAnimationProperties.rotation) == 0.0
                      ? 'KANAN'
                      : value.get(DefaultAnimationProperties.rotation) == 0.5 ? 'BAWAH' : value.get(DefaultAnimationProperties.rotation) == 1.0 ? 'KIRI' : '',
                  style: TextStyle(color: OurRetinaColors.mainGreenDark, wordSpacing: 1.5, letterSpacing: 2),
                )
              ],
            ),
          );
        });
  }
}
