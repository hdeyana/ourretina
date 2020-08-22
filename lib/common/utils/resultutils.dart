import 'package:flutter/material.dart';

import 'package:app/app/style/color.dart';

class ResultUtils {
  static defineColor(BuildContext context, int result, int total) {
    final score = result / total;
    if (score < 0.5) return OurRetinaColors.redError;
    if (score < 0.8) return Colors.orange;
    return Theme.of(context).accentColor;
  }
}
