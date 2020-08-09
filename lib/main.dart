import 'package:app/app/route/approute.dart';
import 'package:app/app/route/retinaroute.dart';
import 'package:app/app/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'OurRetina',
      theme: AppTheme.main,
      initialRoute: AppRoute.onboardingPage,
      getPages: RouteApplication.getroute,
    );
  }
}
