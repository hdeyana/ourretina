import 'package:app/app/controller/basecontroller.dart';
import 'package:app/module/global/data/sharedpref/globalsharedpref.dart';

class GlobalController extends BaseController with GlobalSharedPref {
  bool isCameraPolicyRead = false;
  bool isTrained = false;

  GlobalController() {
    load();
  }

  load() async {
    isTrained = await loadTrained();
    isCameraPolicyRead = await loadCameraPolicyRead();
  }

  cameraRead() async {
    isCameraPolicyRead = true;
    await setCameraPolicyRead();
  }

  trainComplete() async {
    isTrained = true;
    await setTrained();
  }
}
