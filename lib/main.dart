import 'package:app/app/notification/appnotification.dart';
import 'package:app/app/route/approute.dart';
import 'package:app/app/route/retinaroute.dart';
import 'package:app/app/style/theme.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/module/analytic/events.dart';
import 'package:app/module/global/controller/globalcontroller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wakelock/wakelock.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Wakelock.enable();
  await Firebase.initializeApp();
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Get.put(GlobalController());
    Get.put(OurRetinaEvents());
    NotificationHandler.init();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'OurRetina',
      theme: AppTheme.main,
      initialRoute: AppRoute.homePage,
      getPages: RouteApplication.getroute,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
