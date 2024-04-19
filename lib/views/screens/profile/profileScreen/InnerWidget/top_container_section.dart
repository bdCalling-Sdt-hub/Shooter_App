import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shooter_app/routes/app_routes.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_images.dart';
import '../../../../widgets/custom_text.dart';

class TopContainerSection extends StatelessWidget {
  final String? name;
  const TopContainerSection({
    super.key,
    this.name
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  text: name == null ? "Name" : '$name',
                  fontsize: 24.sp,
                ),
                IconButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.editprofileScreen);
                    },
                    icon: SvgPicture.asset(
                      AppIcons.edit,
                    )),
              ],
            ),
            const Divider(color: Colors.red),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppIcons.crown),
                SizedBox(width: 16.w),
                CustomText(
                  text: 'Premium Member',
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
