import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shooter_app/routes/app_routes.dart';
import 'package:shooter_app/utils/app_colors.dart';
import 'package:shooter_app/utils/app_icons.dart';
import 'package:shooter_app/utils/dimentions.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';

import '../../../utils/app_string.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const SizedBox(),
        title: CustomText(
          text: AppString.library,
          fontsize: Dimensions.fontSizeLarge,
          color: AppColors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(height: 136.h),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _LibraryContainer(AppIcons.galary, 'Photo', () {
                    Get.toNamed(AppRoutes.photosScreen);
                  }),
                  _LibraryContainer(
                      AppIcons.documentIcons, 'Document', () {
                    Get.toNamed(AppRoutes.documentScreen);
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _LibraryContainer(String icon, name, VoidCallback ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 164.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.primaryColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 54.h),
          child: Column(
            children: [
              SvgPicture.asset(
                icon,
                height: 48.h,
                width: 48.w,
                fit: BoxFit.cover,
              ),
              CustomText(text: "$name", fontsize: 16.h, top: 4.h)
            ],
          ),
        ),
      ),
    );
  }
}
