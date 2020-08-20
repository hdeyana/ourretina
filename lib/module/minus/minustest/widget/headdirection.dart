import 'package:app/common/widget/arrowdirection.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'package:timer_count_down/timer_count_down.dart';

class HeadDirection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Kemana orientasi huruf sebelumnya?',
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1,
              padding: const EdgeInsets.all(36.0),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                CircularPercentIndicator(
                  radius: 125,
                  lineWidth: 8,
                  circularStrokeCap: CircularStrokeCap.round,
                  percent: 0.0,
                  progressColor: Theme.of(context).accentColor,
                  center: ArrowDirection(
                    directions: ArrowDirections.down,
                    circleColor: Theme.of(context).accentColor,
                  ),
                ),
                CircularPercentIndicator(
                  radius: 125,
                  lineWidth: 8,
                  circularStrokeCap: CircularStrokeCap.round,
                  percent: 0.0,
                  progressColor: Theme.of(context).accentColor,
                  center: ArrowDirection(
                    directions: ArrowDirections.up,
                  ),
                ),
                CircularPercentIndicator(
                  radius: 125,
                  lineWidth: 8,
                  circularStrokeCap: CircularStrokeCap.round,
                  percent: 0.0,
                  progressColor: Theme.of(context).accentColor,
                  center: ArrowDirection(
                    directions: ArrowDirections.left,
                  ),
                ),
                CircularPercentIndicator(
                  radius: 125,
                  lineWidth: 8,
                  circularStrokeCap: CircularStrokeCap.round,
                  percent: 0.0,
                  progressColor: Theme.of(context).accentColor,
                  center: ArrowDirection(
                    directions: ArrowDirections.right,
                  ),
                ),
              ],
            ),
            Text(
              'ATAS',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 36),
          ],
        ),
      ),
    );
  }
}
