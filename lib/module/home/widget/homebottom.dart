import 'package:app/app/route/approute.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        alignment: Alignment.bottomCenter,
        height: MediaQuery.of(context).size.height / 3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () => Get.toNamed(AppRoute.minusIntroPage),
              child: Text('Start Test'),
            )
          ],
        ),
      ),
    );
  }
}
