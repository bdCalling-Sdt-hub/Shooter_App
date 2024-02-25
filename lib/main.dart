import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooter_app/themes/themes.dart';

import 'routes/app_routes.dart';
import 'views/screens/splashScreen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'shooter app',
        theme: Themes().lightTheme,
        darkTheme: Themes().darkTheme,
        initialRoute: AppRoutes.splashScreen,
        getPages: AppRoutes.routes,
        home: SplashScreen());
  }
}
