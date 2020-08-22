import 'package:app/app/controller/basecontroller.dart';
import 'package:app/module/minus/minustest/data/model/minustestmodel.dart';

class ResultController extends BaseController {
  List<MinusTestModel> results = [];
  List<MinusTestModel> left = [];
  List<MinusTestModel> right = [];
  int leftScore = 4;
  int rightScore = 4;

  ResultController(res) {
    results = List<MinusTestModel>.from(res);
  }

  @override
  void onInit() {
    super.onInit();
    left = results.getRange(0, 3).toList();
    right = results.getRange(4, 7).toList();

    calculateResult();
  }

  calculateResult() {
    left.forEach((element) {
      if (element.question != element.answer) leftScore--;
    });
    right.forEach((element) {
      if (element.question != element.answer) rightScore--;
    });
  }
}
