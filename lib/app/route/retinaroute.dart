import 'package:app/app/route/approute.dart';
import 'package:app/module/home/screen/homescreen.dart';
import 'package:app/module/minus/intro/screen/minusintroscreen.dart';
import 'package:app/module/minus/minustest/screen/minustestscreen.dart';
import 'package:app/module/permission/screen/camerapermission.dart';
import 'package:get/get.dart';

class RouteApplication {
  static final getroute = <GetPage>[
    GetPage(name: AppRoute.homePage, page: () => HomeScreen(), transition: Transition.noTransition),
    GetPage(name: AppRoute.minusIntroPage, page: () => MinusIntroScreen()),
    GetPage(name: AppRoute.cameraPermision, page: () => CameraPermissionScreen()),
    GetPage(name: AppRoute.minusTestPage, page: () => MinusTestScreen()),
  ];
}
