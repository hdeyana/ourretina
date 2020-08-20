import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'package:timer_count_down/timer_count_down.dart';

class TutupMata extends StatelessWidget {
  final bool isLeft;
  TutupMata({this.isLeft = false});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Tutup \nMata ${isLeft ? 'Kiri' : 'Kanan'}',
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          PlayAnimation<double>(
            tween: 0.0.tweenTo(1.0),
            duration: 5.seconds,
            builder: (context, _, value) {
              return CircularPercentIndicator(
                radius: 48,
                lineWidth: 5,
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
