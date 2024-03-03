import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shooter_app/helper/di.dart' as di;
import 'package:shooter_app/themes/themes.dart';

import 'routes/app_routes.dart';

import 'views/screens/splashScreen/splash_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => MyApp(), // Wrap your app
  //   ),
  // );
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        title: 'shooter app',
        theme: Themes().darkTheme,

        darkTheme: Themes().darkTheme,

        initialRoute: AppRoutes.splashScreen,
        getPages: AppRoutes.routes,
        home: const SplashScreen(),
      ),
      designSize: const Size(393, 852),
    );
  }
}
