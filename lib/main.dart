import 'package:app/app/route/approute.dart';
import 'package:app/app/route/retinaroute.dart';
import 'package:app/app/style/theme.dart';
import 'package:app/module/global/controller/globalcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'OurRetina',
      theme: AppTheme.main,
      initialRoute: AppRoute.homePage,
      getPages: RouteApplication.getroute,
    );
  }
}
