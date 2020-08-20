import 'package:app/app/assets/appassets.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'package:timer_count_down/timer_count_down.dart';

class SymbolText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Perhatikan orientasi simbol di bawah ini',
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 48),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(horizontal: 36),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                AppAssets.letterE,
                width: 150,
              ),
            ),
          ),
          SizedBox(height: 48),
          PlayAnimation<double>(
            tween: 0.0.tweenTo(1.0),
            duration: 5.seconds,
            builder: (context, _, value) {
              return CircularPercentIndicator(
                radius: 70,
                lineWidth: 8,
                circularStrokeCap: CircularStrokeCap.round,
                percent: value,
                progressColor: Theme.of(context).accentColor,
                center: Countdown(
                  seconds: 5,
                  build: (BuildContext context, double time) => Text(
                    time.toStringAsFixed(0).toString(),
                    style: TextStyle(fontSize: 24),
                  ),
                  interval: Duration(milliseconds: 100),
                  onFinished: () {
                    print('Timer is done!');
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
