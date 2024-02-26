import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';
import 'custom_text.dart';

class LocationContainer extends StatelessWidget {
  final String title;
  final IconData? prefixIcon;
  final IconData? sufixIcon;
  const LocationContainer({
    super.key,
    required this.title,
    this.prefixIcon,
    this.sufixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345.w,
      height: 80.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColors.greyColor,
          border: Border.all(width: 1.w, color: AppColors.primaryColor)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(prefixIcon, size: 24.w),
            SizedBox(width: 16.w),
            CustomText(
              maxline: 2,
              textAlign: TextAlign.left,
              text: title,
              fontsize: 16.h,
              fontWeight: FontWeight.w400,
              fontName: 'Aldrich',
            ),
            const Spacer(),
            Icon(sufixIcon, size: 24.w),
          ],
        ),
      ),
    );
  }
}
