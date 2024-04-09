import 'package:get/get.dart';
import 'package:shooter_app/views/screens/Scores/match_score.dart';
import 'package:shooter_app/views/screens/splashScreen/splash_screen.dart';
import '../views/screens/auth/forgetPasswordScreen/forget_password_screen.dart';
import '../views/screens/auth/setPasswordScreen/set_password_screen.dart';
import '../views/screens/auth/sign_in/sign_in_screen.dart';
import '../views/screens/auth/sign_up/sign_up_screen.dart';
import '../views/screens/auth/verifyEmailScreen/verify_email_screen.dart';
import '../views/screens/bottom_nav_bar/bottom_nav_bar.dart';
import '../views/screens/event_details/event_details_screen.dart';
import '../views/screens/home/home_screen.dart';

import '../views/screens/my_matches/my_matches_screen.dart';
import '../views/screens/my_scoresScreen/inner_widgets/line_chart.dart';
import '../views/screens/my_scoresScreen/scores_screen.dart';
import '../views/screens/notification/notification_screen.dart';
import '../views/screens/onboardingsScreen/onboardings_screen.dart';
import '../views/screens/profile/editprofileScreen/editprofile_screen.dart';
import '../views/screens/profile/profileScreen/profile_screen.dart';
import '../views/screens/registrationScreen/registration_screen.dart';

import '../views/screens/settings/aboutusScreen/aboutus_screen.dart';
import '../views/screens/settings/changepasswordScreen/changepassword_screen.dart';
import '../views/screens/settings/getOtpSceeen/get_otp_sceeen.dart';
import '../views/screens/settings/privacypolicyScreen/privacypolicy_screen.dart';
import '../views/screens/settings/setnewpasswordScreen/setnewpassword_screen.dart';
import '../views/screens/settings/settingsScreen/settings_screen.dart';
import '../views/screens/settings/termsconditionsScreen/termsconditions_screen.dart';
import '../views/screens/subscription/freetrialScreen/freetrial_screen.dart';
import '../views/screens/subscription/subscriptionScreen/subscription_screen.dart';

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
  static const String notificationScreen = "/NotificationScreen.dart";
  static const String settingsScreen = "/settings_screen.dart";
  static const String changepasswordScreen = "/changepassword_screen.dart";
  static const String setnewpasswordScreen = "/setnewpassword_screen.dart";
  static const String getOtpSceeen = "/get_otp_sceeen.dart";
  static const String privacypolicyScreen = "/privacypolicy_screen.dart";
  static const String termsconditionsScreen = "/termsconditions_screen.dart";
  static const String aboutusScreen = "/aboutus_screen.dart";
  static const String registrationScreen = "/registration_screen.dart";
  static const String freetrialScreen = "/freetrial_screen.dart";
  static const String subscriptionScreen = "/subscription_screen.dart";
  static const String eventDetailsScreen = "/EventDetailsScreen.dart";
  static const String scoresScreen = "/scores_screen.dart";
  static const String bottomNavBar = "/BottomNavBar.dart";
  static const String myMatchesScreen = "/MyMatchesScreen.dart";
  static const String lineChartScreen = "/LineChartScreen.dart";
  static const String matchScore="/match_score_screen";

  static List<GetPage> get routes => [
        GetPage(name: splashScreen, page: () => SplashScreen()),
        GetPage(name: onboardingsScreen, page: () => OnboardingsScreen()),
        GetPage(name: verifyEmailScreen, page: () => VerifyEmailScreen()),
        GetPage(name: setPasswordScreen, page: () => SetPasswordScreen()),
        GetPage(name: signInScreen, page: () => SignInScreen()),
        GetPage(name: forgetPasswordScreen, page: () => ForgetPasswordScreen()),
        GetPage(name: profileScreen, page: () => ProfileScreen()),
        GetPage(name: signUpScreen, page: () => SignUpScreen()),
        GetPage(name: editprofileScreen, page: () => EditprofileScreen()),
        GetPage(name: homeScreen, page: () => HomeScreen()),
        GetPage(name: notificationScreen, page: () => NotificationScreen()),
        GetPage(name: settingsScreen, page: () => SettingsScreen()),
        GetPage(name: changepasswordScreen, page: () => ChangepasswordScreen()),
        GetPage(name: setnewpasswordScreen, page: () => SetnewpasswordScreen()),
        GetPage(name: getOtpSceeen, page: () => GetOtpSceeen()),
        GetPage(name: privacypolicyScreen, page: () => PrivacypolicyScreen()),
        GetPage(
            name: termsconditionsScreen, page: () => TermsconditionsScreen()),
        GetPage(name: aboutusScreen, page: () => AboutusScreen()),
        GetPage(name: registrationScreen, page: () => RegistrationScreen()),
        GetPage(name: freetrialScreen, page: () => FreetrialScreen()),
        GetPage(name: subscriptionScreen, page: () => SubscriptionScreen()),
        GetPage(name: eventDetailsScreen, page: () => EventDetailsScreen()),
        GetPage(name: scoresScreen, page: () => ScoresScreen()),
        GetPage(name: bottomNavBar, page: () => BottomNavBar()),
        GetPage(name: myMatchesScreen, page: () => MyMatchesScreen()),
        GetPage(name: lineChartScreen, page: () => LineChart()),
        GetPage(name: matchScore, page: () => const MatchScore()),
      ];
}
