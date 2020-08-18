import 'package:app/app/controller/basecontroller.dart';
import 'package:app/module/global/controller/globalcontroller.dart';
import 'package:app/module/minus/intro/widget/arahkankepala.dart';
import 'package:app/module/minus/intro/widget/cobagerakankepala.dart';
import 'package:app/module/minus/intro/widget/rotatingletter.dart';
import 'package:app/module/minus/intro/widget/simpanperangkat.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MinusIntroController extends BaseController {
  int currentSlide = 0;
  CarouselController slideController = CarouselController();
  final GlobalController gc = Get.find();

  final slides = <Widget>[RotatingLetter(), ArahkanKepala(), CobaGerakanKepala(), SimpanPerangkat()];
  final titleAndDesc = [
    {'title': 'Perhatikan Orientasi Simbol', 'desc': 'Pada tes ini anda akan diminta untuk menebak orientasi simbol yang muncul selama 10 detik'},
    {'title': 'Arahkan Kepala', 'desc': 'Jawab dengan menggerakkan kepala menuju pojok layar sesuai dengan susunan tombol hingga timer pada tombol selesai'},
    {'title': 'Coba Gerakan Kepala Anda', 'desc': ''},
    {'title': 'Simpan Perangkat', 'desc': 'Simpan perangkat  anda secara vertikal lalu posisikan tubuh anda dari perangkat pada jarak 50cm sampai 100cm'},
  ];

  nextSlide() {
    switch (currentSlide) {
      case 3:
        gc.trainComplete();
        break;
      default:
        currentSlide++;
        slideController.nextPage();
        update();
    }
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
}
