import 'package:get/get.dart';
import 'package:shooter_app/views/screens/splashScreen/splash_screen.dart';
import '../views/screens/onboardingsScreen/onboardings_screen.dart';

import '../views/screens/sign_up/sign_up_screen.dart';

import '../views/screens/verifyEmailScreen/verify_email_screen.dart';


class AppRoutes {
  static const String splashScreen = "/splash_screen.dart";
  static const String onboardingsScreen = "/onboardings_screen.dart";
  static const String signUpScreen = "/SignUpScreen.dart";

  static List<GetPage> get routes => [
        GetPage(name: splashScreen, page: () => SplashScreen()),
        GetPage(name: onboardingsScreen, page: () => OnboardingsScreen()),
      ];
}
