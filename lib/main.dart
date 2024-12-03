import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shooter_app/helper/di.dart' as di;
import 'package:shooter_app/themes/themes.dart';
import 'firebase_options.dart';
import 'routes/app_routes.dart';
import 'views/screens/splashScreen/splash_screen.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  // Plugin must be initialized before using
  await FlutterDownloader.initialize(
      debug: true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl: true // option: set to false to disable working with http links (default: false)
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        title: 'Small Bore SA',
        theme: Themes().darkTheme,
        darkTheme: Themes().darkTheme,
        supportedLocales: const <Locale>[Locale('en', 'US'), Locale('zh', 'CN')],
        initialRoute: AppRoutes.splashScreen,
        getPages: AppRoutes.routes,
        home: const SplashScreen(),
      ),
      designSize: const Size(393, 852),
    );
  }
}
