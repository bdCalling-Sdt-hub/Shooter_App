import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_string.dart';
import '../../../utils/dimentions.dart';
import '../../widgets/custom_button.dart';
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
                //================================> Body Strings Section <=======================

                const Spacer(),
                CustomText(
                  text: AppString.verifyEmail,
                  fontWeight: FontWeight.w400,
                  fontsize: 20.h,
                  fontName: 'Aldrich',
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: AppString.weHaveSent,
                  fontWeight: FontWeight.w400,
                  fontsize: 16.h,
                  fontName: 'Aldrich',
                ),
                SizedBox(height: 16.h),
                //================================> PinCodeField Section <=======================
                const PinCodeField(),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    CustomText(
                      text: AppString.didntGet,
                      fontWeight: FontWeight.w400,
                      fontsize: 16.h,
                      fontName: 'Aldrich',
                    ),
                    const Spacer(),
                    CustomText(
                      color: AppColors.primaryColor,
                      text: AppString.resend,
                      fontWeight: FontWeight.w400,
                      fontsize: 16.h,
                      fontName: 'Aldrich',
                    ),
                  ],
                ),
                SizedBox(height: 44.h),
                //================================> VerifyEmail Button <=======================
                CustomButton(
                  color: AppColors.primaryColor,
                  title: AppString.verifyEmail,
                  titlecolor: Colors.white,
                  onpress: () {},
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
