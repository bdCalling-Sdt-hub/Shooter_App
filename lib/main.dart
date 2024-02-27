import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shooter_app/themes/themes.dart';
import 'package:shooter_app/views/screens/auth/verifyEmailScreen/verify_email_screen.dart';
import 'package:shooter_app/views/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:shooter_app/views/screens/home/home_screen.dart';
import 'package:shooter_app/views/screens/notification/notification_screen.dart';
import 'package:shooter_app/views/screens/settings/settingsScreen/settings_screen.dart';
import 'routes/app_routes.dart';
import 'views/screens/auth/forgetPasswordScreen/forget_password_screen.dart';
import 'views/screens/onboardingsScreen/onboardings_screen.dart';
import 'views/screens/registrationScreen/registration_screen.dart';
import 'views/screens/splashScreen/splash_screen.dart';
import 'views/screens/subscription/freetrialScreen/freetrial_screen.dart';
import 'views/screens/subscription/subscriptionScreen/subscription_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'shooter app',
        theme: Themes().darkTheme,
        darkTheme: Themes().darkTheme,

        // initialRoute: AppRoutes.notificationScreen,
        getPages: AppRoutes.routes,
        home: SettingsScreen(),
      ),
      designSize: const Size(393, 852),
    );
  }
}

