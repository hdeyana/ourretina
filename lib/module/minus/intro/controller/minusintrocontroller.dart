import 'package:app/app/controller/basecontroller.dart';
import 'package:app/app/route/approute.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/module/minus/intro/widget/arahkankepala.dart';
import 'package:app/module/minus/intro/widget/rotatingletter.dart';
import 'package:app/module/minus/intro/widget/simpanperangkat.dart';
import 'package:app/module/minus/intro/widget/tujuantest.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MinusIntroController extends BaseController {
  int currentSlide = 0;
  CarouselController slideController = CarouselController();

  static const int lastLength = 3;

  final slides = <Widget>[
    TujuanTest(),
    SimpanPerangkat(),
    RotatingLetter(),
    ArahkanKepala(),
  ];

  final titleAndDesc = [
    {'title': S.of(Get.context).testKetajamanMata, 'desc': S.of(Get.context).testIniBertujuanUntukMengujiKetajamanMataAnda},
    {'title': S.of(Get.context).testJarakJauh, 'desc': S.of(Get.context).posisikanTubuhAndaDariPerangkatPadaJarak50cmSampai100cm},
    {'title': S.of(Get.context).perhatikanOrientasiSimbol, 'desc': S.of(Get.context).andaDimintaUntukMenebakOrientasiSimbolYangMunculSelama7},
    {'title': S.of(Get.context).arahkanKepala, 'desc': S.of(Get.context).jawabDenganMenggerakkanKepalaMenujuPojokLayarSesuaiDenganSusunan},
  ];

  nextSlide() async {
    switch (currentSlide) {
      case lastLength:
        Get.offNamed(AppRoute.minusTestPage);
        break;
      default:
        currentSlide++;
        slideController.nextPage();
        update();
    }
  }

  setSlide(int index) {
    currentSlide = index;
    update();
  }

  backSlide() {
    switch (currentSlide) {
      case 0:
        return true;
        break;
      default:
        currentSlide--;
        slideController.previousPage();
        update();
        return false;
    }
  }

  gotoMinusTest() => Get.offNamed(AppRoute.minusTestPage);
}
