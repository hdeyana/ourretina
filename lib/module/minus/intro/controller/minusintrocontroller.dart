import 'package:app/app/controller/basecontroller.dart';
import 'package:carousel_slider/carousel_controller.dart';

class MinusIntroController extends BaseController {
  int currentSlide = 0;
  CarouselController slideController = CarouselController();

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
