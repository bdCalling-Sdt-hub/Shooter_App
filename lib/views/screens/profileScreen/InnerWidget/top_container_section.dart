import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_images.dart';
import '../../../widgets/custom_text.dart';

class TopContainerSection extends StatelessWidget {
  const TopContainerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342.w,
      height: 141.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  width: 70.w,
                  height: 70.h,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Image.asset(
                    AppImages.profileImg,
                    fit: BoxFit.cover,
                  ),
                ),
                CustomText(
                  text: 'Arnold Bailie',
                  fontName: 'Aldrich',
                  fontWeight: FontWeight.w400,
                  fontsize: 24.h,
                ),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      AppIcons.edit,
                    )),
              ],
            ),
            const Divider(color: Colors.red),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(AppIcons.crown),
                CustomText(
                  text: 'Premium Member',
                  fontName: 'Aldrich',
                  fontWeight: FontWeight.w400,
                  fontsize: 18.h,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
