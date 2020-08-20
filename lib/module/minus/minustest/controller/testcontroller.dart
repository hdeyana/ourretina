import 'package:app/app/controller/basecontroller.dart';
import 'package:app/module/minus/minustest/data/model/minustestmodel.dart';
import 'dart:math' as math;

class TestController extends BaseController {
  final fontSizes = [150, 100, 75, 50];
  final rand = math.Random();

  List<MinusTestModel> tests = [];
  int currentTest = 0;
  int currentAnswer = 0;

  @override
  void onInit() {
    super.onInit();
    tests = List.generate(
      4,
      (index) => MinusTestModel(
        question: rand.nextInt(4),
        fontSize: fontSizes[index],
      ),
    );
  }

  @override
  void onClose() {
    super.onClose();
  }
}
