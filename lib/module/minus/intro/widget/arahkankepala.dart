import 'dart:async';

import 'package:app/app/assets/appassets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:supercharged/supercharged.dart';

class ArahkanKepala extends StatefulWidget {
  @override
  _ArahkanKepalaState createState() => _ArahkanKepalaState();
}

class _ArahkanKepalaState extends State<ArahkanKepala> {
  final arrayImages = [
    AppAssets.headNetral,
    AppAssets.headKanan,
    AppAssets.heakKiri,
    AppAssets.headUp,
    AppAssets.headDown,
  ];
  int currentIndex = 0;
  Timer timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(1.seconds, (tick) {
      if (mounted) {
        setState(() {
          if (currentIndex < 4)
            currentIndex++;
          else
            currentIndex = 0;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(36),
      child: SvgPicture.asset(
        arrayImages[currentIndex],
      ),
    );
  }
}
