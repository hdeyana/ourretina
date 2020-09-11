import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationHandler {
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  static init() async {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        _typeHandler(data: message, isForeGround: true);
      },
      onLaunch: (Map<String, dynamic> message) async {
        _typeHandler(data: message);
      },
      onResume: (Map<String, dynamic> message) async {
        _typeHandler(data: message);
      },
    );
    _firebaseMessaging.subscribeToTopic("all");
  }

  static void _typeHandler({Map<String, dynamic> data, bool isForeGround = false}) {
    print('New Notification ' + data.toString());
    final value = data['data'];
    final ntype = value['notif_type'];
  }
}
