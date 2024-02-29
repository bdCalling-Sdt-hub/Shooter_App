import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shooter_app/themes/themes.dart';
import 'routes/app_routes.dart';
import 'views/screens/onboardingsScreen/onboardings_screen.dart';
import 'views/screens/profile/editprofileScreen/editprofile_screen.dart';
import 'views/screens/splashScreen/splash_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );

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
         initialRoute: AppRoutes.editprofileScreen,
        getPages: AppRoutes.routes,
        home: EditprofileScreen(),
      ),
      designSize: const Size(393, 852),
    );
  }
}

