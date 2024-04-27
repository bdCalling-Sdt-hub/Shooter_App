import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shooter_app/routes/app_routes.dart';
import 'package:shooter_app/service/api_constant.dart';
import '../../../../../controller/profileController.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_images.dart';
import '../../../../widgets/custom_text.dart';

class TopContainerSection extends StatelessWidget {
  final String? name;
  final String? subScription;
  final String? image;

   TopContainerSection({
    super.key,
    this.name,
    this.subScription,
    this.image
  });

  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    var profileData = _profileController.profileModel.value.data?.attributes?.image;
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
                  child: profileData?.publicFileUrl == null  ? Image.asset(
                    AppImages.profileImg,
                    fit: BoxFit.cover,
                  ): CachedNetworkImage(imageUrl: "${ApiConstant.imageBaseUrl}/${profileData?.publicFileUrl}",fit: BoxFit.cover,)
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
                  text: subScription == '' || subScription == null ? "Free member" : '$subScription',
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
