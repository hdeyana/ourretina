import 'package:app/app/assets/appassets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SimpanPerangkat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(36),
      child: SvgPicture.asset(AppAssets.headJarak),
    );
  }
}
