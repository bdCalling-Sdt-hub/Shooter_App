import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shooter_app/utils/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 242.h),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Opacity(
                opacity: 0.6,
                child: Image.asset(
                  AppImages.splashBg,
                  fit: BoxFit.cover,
                  height: 610.h,
                  width: 393.w,
                ),
              ),
              Positioned(
                top: -160.h,
                right: 50.w,
                left: 50.w,
                child: SizedBox(
                  width: 200.w,
                  height: 200.h,
                  child: Image.asset(AppImages.appLogo),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
