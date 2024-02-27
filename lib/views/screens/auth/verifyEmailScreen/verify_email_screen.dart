import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimentions.dart';

import '../../../widgets/custom_button.dart';
import 'InnerWidget/pin_code_field.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          //================================> Background Image and Back Arrow Section <=======================
          Opacity(
            opacity: 0.5,
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
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 34.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    alignment: Alignment.centerLeft,
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeDefault),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //================================> Body Strings Section <=======================

                const Spacer(),
                CustomText(
                  text: AppString.verifyEmail,
                  fontsize: 20.h,
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: AppString.weHaveSent,
                  fontsize: 16.h,
                ),
                SizedBox(height: 16.h),
                //================================> PinCodeField Section <=======================
                const PinCodeField(),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    CustomText(
                      text: AppString.didntGet,
                      fontsize: 16.h,
                    ),
                    const Spacer(),
                    CustomText(
                      color: AppColors.primaryColor,
                      text: AppString.resend,
                      fontsize: 16.h,
                    ),
                  ],
                ),
                SizedBox(height: 44.h),
                //================================> VerifyEmail Button <=======================
                CustomButton(
                  title: AppString.verifyEmail,
                  onpress: () {
                    Get.toNamed(AppRoutes.setPasswordScreen);
                  },
                ),
                SizedBox(height: 248.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
