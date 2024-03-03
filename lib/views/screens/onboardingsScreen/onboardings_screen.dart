import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shooter_app/routes/app_routes.dart';
import 'package:shooter_app/utils/app_colors.dart';
import 'package:shooter_app/utils/app_string.dart';
import 'package:shooter_app/utils/dimentions.dart';
import 'package:shooter_app/views/widgets/custom_button.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';
import '../../../utils/app_images.dart';

class OnboardingsScreen extends StatelessWidget {
  const OnboardingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Opacity(
          opacity: 0.3,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.backgroundImg),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeDefault),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                AppString.smallBore,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28.sp, fontFamily: 'Aldrich'),
              ),

              SizedBox(height: 16.h),
              Text(
                AppString.exciting,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 14.sp, fontFamily: 'Aldrich'),
              ),
              SizedBox(height: 24.h),
              CustomButton(
                title: AppString.getStarted,
                onpress: () {
                  Get.offAllNamed(AppRoutes.signInScreen);
                },
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ]),
    );
  }
}
