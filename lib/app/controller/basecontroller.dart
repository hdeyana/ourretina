import 'package:get/get.dart';

class BaseController extends GetxController {
  bool busy = false;

  setBusy(bool value) {
    busy = value;
    update();
  }
}
