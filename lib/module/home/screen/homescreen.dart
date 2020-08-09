import 'package:app/common/widget/bannerbutton.dart';
import 'package:flutter/material.dart';

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
              title: 'Minus',
            )
          ],
        ),
      ),
    );
  }
}
