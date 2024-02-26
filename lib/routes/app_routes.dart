import 'package:get/get.dart';
import 'package:shooter_app/views/screens/splashScreen/splash_screen.dart';
import '../views/screens/EditprofileScreen/editprofile_screen.dart';
import '../views/screens/auth/log_in/log_in_screen.dart';
import '../views/screens/auth/forgetPasswordScreen/forget_password_screen.dart';
import '../views/screens/auth/setPasswordScreen/set_password_screen.dart';
import '../views/screens/auth/sign_up/sign_up_screen.dart';
import '../views/screens/auth/verifyEmailScreen/verify_email_screen.dart';
import '../views/screens/home/home_screen.dart';
import '../views/screens/onboardingsScreen/onboardings_screen.dart';
import '../views/screens/profileScreen/profile_screen.dart';



class AppRoutes {
  static const String splashScreen = "/splash_screen.dart";
  static const String onboardingsScreen = "/onboardings_screen.dart";
  static const String verifyEmailScreen = "/verify_email_screen.dart";
  static const String setPasswordScreen = "/set_password_screen.dart";
  static const String signInScreen = "/SignInScreen.dart";
  static const String forgetPasswordScreen = "/forget_password_screen.dart";
  static const String profileScreen = "/profile_screen.dart";
  static const String signUpScreen = "/SignUpScreen.dart";
  static const String editprofileScreen = "/editprofile_screen.dart";
  static const String homeScreen = "/HomeScreen.dart";

  static List<GetPage> get routes => [
        GetPage(name: splashScreen, page: () => SplashScreen()),
        GetPage(name: onboardingsScreen, page: () => OnboardingsScreen()),
        GetPage(name: verifyEmailScreen, page: () => VerifyEmailScreen()),
        GetPage(name: setPasswordScreen, page: () => SetPasswordScreen()),
        GetPage(name: signInScreen, page: () => SignInScreen()),
        GetPage(name: homeScreen, page: () => HomeScreen()),
        GetPage(name: forgetPasswordScreen, page: () => ForgetPasswordScreen()),
        GetPage(name: profileScreen, page: () => ProfileScreen()),
        GetPage(name: editprofileScreen, page: () => EditprofileScreen()),
      ];
}
