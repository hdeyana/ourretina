import 'package:app/app/route/approute.dart';
import 'package:app/common/widget/bannerbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OurRetina'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            BannerButton(
              title: 'Minus (w/ v)',
              onTap: () => Get.toNamed(AppRoute.minusPage),
            ),
          ],
        ),
      ),
    );
  }
}
