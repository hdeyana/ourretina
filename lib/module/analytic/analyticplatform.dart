import 'package:firebase_analytics/firebase_analytics.dart';

mixin AnalyticPlatform {
  Future<void> sendfirebaseAnalytic({String event, Map value}) async {
    final FirebaseAnalytics analytics = FirebaseAnalytics();
    analytics.logEvent(name: event, parameters: value);
  }

  Future<void> sendFirestore({String collection, Map value}) async {}
}
