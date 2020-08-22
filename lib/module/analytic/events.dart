import 'package:app/module/analytic/analyticplatform.dart';
import 'package:app/module/minus/result/data/model/resultitemmodel.dart';

class OurRetinaEvents with AnalyticPlatform {
  recordSkip() async {
    await sendfirebaseAnalytic(event: "skipped");
  }

  recordLastResultCLicked() async {
    await sendfirebaseAnalytic(event: "last_result_clicked");
  }

  recordDurationTrial(int second) async {
    await sendfirebaseAnalytic(event: "last_result_clicked", value: {'duration': second});
  }

  recordFinishTest(ResultItemModel result) async {
    final res = result.toMap();

    await sendfirebaseAnalytic(event: "minus_result", value: res);
    await sendFirestore(collection: "minus_result", value: res);
  }
}
