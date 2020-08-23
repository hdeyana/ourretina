import 'package:app/module/minus/result/data/model/resultitemmodel.dart';
import 'package:app/module/minus/result/data/sharedpref/resultpref.dart';

import 'package:app/app/controller/basecontroller.dart';

class HasilTestListController extends BaseController with ResultPref {
  List<ResultItemModel> results = [];

  @override
  void onInit() {
    super.onInit();
    loadResult().then((value) {
      results = value;
      update();
    });
  }
}
