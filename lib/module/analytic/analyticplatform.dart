import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

mixin AnalyticPlatform {
  Future<void> sendfirebaseAnalytic({String event, Map value}) async {
    if (kReleaseMode) {
      final FirebaseAnalytics analytics = FirebaseAnalytics();
      await analytics.logEvent(name: event, parameters: value);
    }
  }

  Future<void> sendFirestore({String collection, Map value}) async {
    // if (kReleaseMode) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection(collection).add(value);
    // }
  }
}
