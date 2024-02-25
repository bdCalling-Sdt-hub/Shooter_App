import 'package:flutter/material.dart';
import 'package:shooter_app/utils/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            width: 200,
            height:200,
            child: Image.asset(AppImages.appLogo),
          ),
          Image.asset(AppImages.splashBg),
        ],
      ),
    );
  }
}
