import 'dart:io';

import 'package:app/module/minus/intro/controller/minusintrocontroller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MinusIntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MinusIntroController>(
      init: MinusIntroController(),
      builder: (controller) {
        return WillPopScope(
          onWillPop: () async {
            if (Platform.isIOS) return true;
            return controller.backSlide();
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text('Instruksi Tes'),
              centerTitle: true,
            ),
            body: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  CarouselSlider(
                    carouselController: controller.slideController,
                    options: CarouselOptions(
                        viewportFraction: 0.9,
                        aspectRatio: 1,
                        height: MediaQuery.of(context).size.width - 48,
                        enableInfiniteScroll: false,
                        enlargeCenterPage: true,
                        scrollPhysics: NeverScrollableScrollPhysics(),
                        enlargeStrategy: CenterPageEnlargeStrategy.height),
                    items: controller.slides.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: double.maxFinite,
                            child: Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              child: i,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 8),
                  Text(
                    controller.titleAndDesc[controller.currentSlide]['title'],
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
                    child: Text(
                      controller.titleAndDesc[controller.currentSlide]['desc'],
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Spacer(),
                  RaisedButton(
                    onPressed: () => controller.nextSlide(),
                    child: Text(controller.currentSlide != 3 ? 'Lanjut' : 'Mulai Test'),
                    elevation: 0,
                  ),
                  if (controller.currentSlide != 3)
                    FlatButton(
                      onPressed: () {},
                      child: Text('Lewati'),
                    ),
                  SizedBox(height: controller.currentSlide != 3 ? 16 : 60),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
