import 'package:get/get.dart';
import 'package:shooter_app/views/screens/splashScreen/splash_screen.dart';
import '../views/screens/onboardingsScreen/onboardings_screen.dart';
import '../views/screens/setPasswordScreen/set_password_screen.dart';
<<<<<<< HEAD

import '../views/screens/sign_up/sign_up_screen.dart';

=======
import '../views/screens/sign_up/sign_up_screen.dart';
>>>>>>> 363131cb5334c2972f805731e04a2ba3d8602d7b
import '../views/screens/verifyEmailScreen/verify_email_screen.dart';


class AppRoutes {
  static const String splashScreen = "/splash_screen.dart";
  static const String onboardingsScreen = "/onboardings_screen.dart";
  static const String verifyEmailScreen = "/verify_email_screen.dart";
  static const String setPasswordScreen = "/set_password_screen.dart";
  static const String signUpScreen = "/SignUpScreen.dart";

  static List<GetPage> get routes => [
        GetPage(name: splashScreen, page: () => SplashScreen()),
        GetPage(name: onboardingsScreen, page: () => OnboardingsScreen()),
        GetPage(name: verifyEmailScreen, page: () => VerifyEmailScreen()),
        GetPage(name: setPasswordScreen, page: () => SetPasswordScreen()),
<<<<<<< HEAD

=======
>>>>>>> 363131cb5334c2972f805731e04a2ba3d8602d7b
      ];
}
