import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shooter_app/utils/app_colors.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimentions.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';

class FreetrialScreen extends StatelessWidget {
  const FreetrialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        backgroundColor: Colors.black,
        body: Stack(children: [
          //================================> Background Image and Close Icon Section <=======================
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
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 34.h),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    alignment: Alignment.centerLeft,
                    icon: Icon(
                      Icons.close,
                      color: AppColors.primaryColor,
                    ),
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
                  text: AppString.welcomeBore,
                  maxline: 2,
                  fontsize: 24.sp,
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: AppString.currentlyYou,
                  maxline: 2,
                  fontsize: 16.sp,
                ),
                SizedBox(height: 44.h),
                //================================> Continue Button Section <=======================
                CustomButton(
                  title: AppString.continueS,
                  onpress: () {
                    Get.toNamed(AppRoutes.subscriptionScreen);
                  },
                ),
                SizedBox(height: 94.h),
              ],
            ),
          ),
        ]));
    ;
  }
}
