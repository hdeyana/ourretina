import 'package:advertising_id/advertising_id.dart';
import 'package:app/module/analytic/analyticplatform.dart';
import 'package:app/module/minus/result/data/model/resultitemmodel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class OurRetinaEvents with AnalyticPlatform {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

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
    res.addAll({
      'advID': await _getADVID(),
      'duration': result.results.last.answeredAt.difference(result.results.first.answeredAt).inSeconds,
    });

    await sendfirebaseAnalytic(event: "minus_result", value: res);
    await sendFirestore(collection: "minus_result", value: res);
  }

  _getADVID() async {
    try {
      return await AdvertisingId.id;
    } catch (e) {
      return '';
    }
  }
}
