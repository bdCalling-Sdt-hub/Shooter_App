import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimentions.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        backgroundColor: Colors.black,
        body: Stack(children: [
          //================================> Background Image and Close Icon Section <=======================
          Opacity(
            opacity: 0.5,
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
                  text: AppString.youHave,
                  fontsize: 16.sp,
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: AppString.pleaseBuy,
                  maxline: 2,
                  fontsize: 24.sp,
                ),
                SizedBox(height: 35.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: AppColors.fieldColor,
                          border: Border.all(
                              width: 1.w, color: AppColors.primaryColor)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 12.h),
                        child: Column(
                          children: [
                            CustomText(
                                text: AppString.months12, fontsize: 16.sp),
                            SizedBox(height: 12.h),
                            CustomText(
                                text: AppString.rand120, fontsize: 18.sp),
                            SizedBox(height: 12.h),
                            CustomText(
                              text: AppString.days10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: AppColors.fieldColor,
                          border:
                              Border.all(width: 1.w, color: AppColors.white)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 12.h),
                        child: Column(
                          children: [
                            CustomText(
                                text: AppString.months6, fontsize: 16.sp),
                            SizedBox(height: 12.h),
                            CustomText(text: AppString.rand80, fontsize: 18.sp),
                            SizedBox(height: 12.h),
                            CustomText(
                              text: AppString.days10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 45.h),
                //================================> Purchase Subscription Button Section <=======================
                CustomButton(
                  title: AppString.purchaseSubscription,
                  onpress: () {
                    //Get.toNamed(AppRoutes.signUpScreen);
                  },
                ),
                SizedBox(height: 94.h),
              ],
            ),
          ),
        ]));
  }
}
