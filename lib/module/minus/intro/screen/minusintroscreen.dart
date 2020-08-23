import 'package:app/module/analytic/events.dart';
import 'package:app/module/global/controller/globalcontroller.dart';
import 'package:app/module/minus/intro/controller/minusintrocontroller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MinusIntroScreen extends StatefulWidget {
  @override
  _MinusIntroScreenState createState() => _MinusIntroScreenState();
}

class _MinusIntroScreenState extends State<MinusIntroScreen> {
  final GlobalController gc = Get.find();
  final OurRetinaEvents _events = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MinusIntroController>(
      init: MinusIntroController(),
      builder: (controller) {
        return Scaffold(
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
                      onPageChanged: (i, _) => controller.setSlide(i),
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
                  child: Text(controller.currentSlide < 3 ? 'Lanjut' : 'Coba'),
                  elevation: 0,
                ),
                if (controller.currentSlide != 4 && gc.isTrained)
                  FlatButton(
                    onPressed: () {
                      _events.recordSkip();
                      controller.gotoMinusTest();
                    },
                    child: Text('Lewati'),
                    textColor: Theme.of(context).accentColor,
                  ),
                SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }
}
