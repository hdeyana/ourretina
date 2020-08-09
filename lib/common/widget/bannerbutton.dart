import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class BannerButton extends StatelessWidget {
  final Function onTap;
  final String title;
  BannerButton({this.onTap, this.title});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 180,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.fromLTRB(60, 0, 24, 0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.white),
                    ),
                    Icon(
                      Icons.navigate_next,
                      size: 36,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 16,
              child: MirrorAnimation(
                tween: 0.5.tweenTo(1.0),
                builder: (BuildContext context, _, double value) {
                  return Opacity(
                    opacity: value,
                    child: Text(
                      'Ea',
                      style: TextStyle(fontSize: 84, height: 1, fontFamily: 'Roboto', fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
