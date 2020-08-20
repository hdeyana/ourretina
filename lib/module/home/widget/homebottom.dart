import 'package:app/app/route/approute.dart';
import 'package:app/module/global/controller/globalcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBottom extends StatelessWidget {
  final GlobalController gc = Get.find();
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 36,
      left: 36,
      right: 36,
      child: Container(
        alignment: Alignment.bottomCenter,
        height: MediaQuery.of(context).size.height / 2.2,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'OurRetina',
              style: Theme.of(context).textTheme.headline2,
            ),
            Container(
                width: 200,
                child: Text(
                  'Tes singkat kesehatan mata anda dimana saja',
                  textAlign: TextAlign.center,
                )),
            Spacer(),
            Container(
              width: 150,
              child: RaisedButton(
                onPressed: () {
                  Get.toNamed(AppRoute.minusIntroPage);
                },
                child: Text('Mulai'),
              ),
            ),
            Container(
              width: 150,
              child: OutlineButton(
                onPressed: () {
                  Get.toNamed(AppRoute.minusResultHistoryPage);
                },
                child: Text(
                  'Hasil',
                  style: Theme.of(context).textTheme.button.copyWith(color: Theme.of(context).accentColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
