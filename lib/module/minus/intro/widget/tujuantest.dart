import 'dart:ui';

import 'package:app/app/style/color.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class TujuanTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Icon(
              Icons.font_download,
              size: 210,
              color: OurRetinaColors.mainGreenDark,
            )),
        Center(
          child: ClipRect(
            child: MirrorAnimation<double>(
              tween: 0.0.tweenTo(4.0),
              duration: 1.seconds,
              curve: Curves.easeInOut,
              builder: (context, _, value) {
                return BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: value, sigmaY: value),
                  child: Container(
                    width: 200.0,
                    height: 200.0,
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
