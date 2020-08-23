import 'package:app/app/controller/basecontroller.dart';
import 'package:app/module/analytic/events.dart';
import 'package:app/module/minus/minustest/data/model/minustestmodel.dart';
import 'package:app/module/minus/result/data/model/resultitemmodel.dart';
import 'package:app/module/minus/result/data/sharedpref/resultpref.dart';
import 'package:get/get.dart';

class ResultController extends BaseController with ResultPref {
  ResultItemModel result;
  List<MinusTestModel> results;
  List<MinusTestModel> left = [];
  List<MinusTestModel> right = [];
  int _leftScore = 4;
  int _rightScore = 4;

  OurRetinaEvents _events = Get.find();

  ResultController(res) {
    if (res is List<MinusTestModel>) results = List<MinusTestModel>.from(res);
    if (res is ResultItemModel) result = res;
  }

  @override
  void onInit() {
    super.onInit();
    if (results != null) {
      left = results.getRange(0, 3).toList();
      right = results.getRange(4, 7).toList();

      calculateResult();
    }
  }

  calculateResult() {
    left.forEach((element) {
      if (element.question != element.answer) _leftScore--;
    });
    right.forEach((element) {
      if (element.question != element.answer) _rightScore--;
    });

    result = ResultItemModel(leftScore: _leftScore, rightScore: _rightScore, results: results, testAt: DateTime.now().toIso8601String(), total: 4);
    update();

    saveResult(result);
    _events.recordFinishTest(result);
  }

  goHome() {
    Get.back();
  }
}
