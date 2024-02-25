import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shooter_app/themes/themes.dart';
import 'package:shooter_app/views/screens/sign_up/sign_up_screen.dart';


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
        home: SignUpScreen(),
      ),
      designSize: const Size(393, 852),
    );
  }
}
