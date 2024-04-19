import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shooter_app/controller/profileController.dart';
import 'package:shooter_app/utils/app_string.dart';
import 'package:shooter_app/views/widgets/custom_loader.dart';
import 'package:shooter_app/views/widgets/no_internet_screen.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_constants.dart';
import '../../../../utils/app_icons.dart';
import '../../../widgets/custom_list_tile.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/genaral_error_screen.dart';
import 'InnerWidget/top_container_section.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});

  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: const SizedBox(),
        title: CustomText(
          text: AppString.profile,
          fontName: 'Aldrich',
          fontsize: 18.h,
          fontWeight: FontWeight.w400,
        ),
        centerTitle: true,
      ),
      body: Obx((){
        var profileData = _profileController.profileModel.value.data?.attributes;

        print('=========================> $profileData');
        switch(_profileController.rxRequestStatus.value){
          case Status.loading : return const CustomLoader();
          case Status.internetError : return NoInternetScreen(onTap: () { _profileController.getProfileData(); },);
          case Status.error : return GeneralErrorScreen(onTap: () { _profileController.getProfileData(); },);
          case Status.completed : return Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.w),
            child: Column(
              children: [
                SizedBox(height: 24.h),
                //==================================> TopContainer Section <=================================
                TopContainerSection(
                  name: "${profileData?.name}",
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _customContainer(
                      AppString.clasS,
                      '${profileData?.userClass}',
                    ),
                    _customContainer(
                      AppString.club,
                      "${profileData?.club}",
                    ),
                  ],
                ),

                //==================================> CustomContainer Section <=================================

                SizedBox(height: 24.h),
                CustomListTile(
                    title: '${profileData?.name}', prefixIcon: _prefixIcon(AppIcons.user)),
                SizedBox(height: 16.h),
                CustomListTile(
                    title: '${profileData?.dateOfBirth}', prefixIcon: _prefixIcon(AppIcons.cake)),
                SizedBox(height: 16.h),
                CustomListTile(
                    title: 'arnold.07@gmail.com',
                    prefixIcon: _prefixIcon(AppIcons.mail)),
                SizedBox(height: 16.h),
                CustomListTile(
                    title: '(406) 555-0120',
                    prefixIcon: _prefixIcon(
                      AppIcons.phone,
                    )),
                SizedBox(height: 16.h),
                CustomListTile(
                  title: '2972 Westheimer Rd. Santa Ana, Illinois 85486 ',
                  prefixIcon: _prefixIcon(AppIcons.locationMarker),
                ),
                SizedBox(height: 16.h),
              ],
            ),
          );
        }
  } ),
    );
  }
//===========================================> CustomContainer Section <=================================

  _customContainer(String name, String title) {
    return Container(
      width: 165.w,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColors.fieldColor,
          border: Border.all(width: 1.w, color: AppColors.primaryColor)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 9.h),
        child: Column(
          children: [
            CustomText(
              text: name,
            ),
            CustomText(
              text: title,
            ),
          ],
        ),
      ),
    );
  }

  _prefixIcon(String icon) {
    return SvgPicture.asset(icon, color: Colors.white);
  }
}
