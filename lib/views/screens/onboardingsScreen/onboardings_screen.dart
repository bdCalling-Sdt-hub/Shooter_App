import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shooter_app/utils/app_colors.dart';
import 'package:shooter_app/utils/app_string.dart';
import 'package:shooter_app/utils/dimentions.dart';
import 'package:shooter_app/views/widgets/custom_button.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/app_images.dart';

class OnboardingsScreen extends StatelessWidget {
  const OnboardingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Stack(
          children: [
        Opacity(
          opacity: 0.6,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.onboardingsBg),
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
              CustomText(
                text: AppString.smallBore,
                maxline: 2,
                fontWeight: FontWeight.w400,
                fontsize: 32.h,
                fontName: 'Aldrich',
              ),
              SizedBox(height: 16.h),
              CustomText(
                text: AppString.exciting,
                fontWeight: FontWeight.w400,
                fontsize: 16.h,
                fontName: 'Aldrich',
              ),
              SizedBox(height: 36.h),
              CustomButton(
                color: AppColors.primaryColor,
                title: AppString.logIn,
                titlecolor: Colors.white,
                onpress: () {

                },
              ),
              SizedBox(height: 16.h),
              CustomButton(
                color: Colors.white,
                titlecolor: AppColors.primaryColor,
                title: AppString.signUp,
                onpress: () {
                  //Get.toNamed(AppRoutes.signUpScreen);
                },
              ),
              SizedBox(height: 66.h),
            ],
          ),
        ),
      ]),
    );
  }
}
