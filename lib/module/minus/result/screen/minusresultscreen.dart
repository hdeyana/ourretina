import 'package:app/module/minus/result/controller/resultcontroller.dart';
import 'package:app/module/minus/result/widget/cardresult.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MinusResultScreen extends StatelessWidget {
  final args = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResultController>(
      init: ResultController(args),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Hasil Test'),
            centerTitle: true,
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24),
            children: [
              // Text(
              //   'Anda Sehat',
              //   textAlign: TextAlign.center,
              //   style: Theme.of(context).textTheme.headline2,
              // ),
              // SizedBox(height: 24),
              // Text(
              //   'Kemungkinan mata sebelah kanan kamu bermasalah, kunjungi dokter mata terdekatmu',
              //   textAlign: TextAlign.center,
              // ),
              SizedBox(height: 48),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: CardResult(
                      isKiri: true,
                      result: controller.result.leftScore,
                      total: 4,
                    )),
                    SizedBox(width: 24),
                    Expanded(
                        child: CardResult(
                      isKiri: false,
                      result: controller.result.rightScore,
                      total: 4,
                    )),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                DateFormat.yMMMEd().format(DateTime.parse(controller.result.testAt)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              GestureDetector(
                onTap: () => controller.goHome(),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).dividerColor),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Text(
                      'Beranda',
                      style: Theme.of(context).textTheme.button.copyWith(color: Theme.of(context).accentColor),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 36),
              Text(
                'Disclaimer',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Text(
                  'Hasil tes tidak dapat menggantikan saran dari dokter',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
