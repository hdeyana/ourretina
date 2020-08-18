import 'package:app/app/controller/basecontroller.dart';
import 'package:app/module/minus/intro/widget/rotatingletter.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

class MinusIntroController extends BaseController {
  int currentSlide = 0;
  CarouselController slideController = CarouselController();

  final slides = <Widget>[RotatingLetter()];

  nextSlide() {
    switch (currentSlide) {
      case 3:
        break;
      default:
        currentSlide++;
        slideController.nextPage();
        update();
    }
  }
}
