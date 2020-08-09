import 'package:app/app/route/approute.dart';
import 'package:app/module/home/screen/homescreen.dart';
import 'package:app/module/onboarding/screen/onboardingscreen.dart';
import 'package:get/get.dart';

class RouteApplication {
  static final getroute = <GetPage>[
    GetPage(name: AppRoute.homePage, page: () => HomeScreen(), transition: Transition.downToUp),
    GetPage(name: AppRoute.onboardingPage, page: () => OnboardingScreen()),
  ];
}
