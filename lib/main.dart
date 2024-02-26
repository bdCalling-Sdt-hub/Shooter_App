import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shooter_app/themes/themes.dart';
import 'routes/app_routes.dart';
import 'views/screens/EditprofileScreen/editprofile_screen.dart';
import 'views/screens/auth/forgetPasswordScreen/forget_password_screen.dart';
import 'views/screens/onboardingsScreen/onboardings_screen.dart';
import 'views/screens/profileScreen/profile_screen.dart';
import 'views/screens/splashScreen/splash_screen.dart';

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
        initialRoute: AppRoutes.forgetPasswordScreen,
        getPages: AppRoutes.routes,
        home: ForgetPasswordScreen(),
      ),
      designSize: const Size(393, 852),
    );
  }
}
