import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shooter_app/helper/time_format.dart';
import 'package:shooter_app/routes/app_routes.dart';
import 'package:shooter_app/service/api_constant.dart';
import 'package:shooter_app/utils/app_images.dart';

import '../../../../controller/data_controller.dart';
import '../../../../controller/home_controller.dart';
import '../../../../controller/profileController.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimentions.dart';
import '../../../widgets/custom_text.dart';

class HomeScreenAppBar extends StatelessWidget {
   HomeScreenAppBar({
    super.key,
  });

   final HomeController _homeController = Get.put(HomeController());
   final ProfileController _profileController = Get.put(ProfileController());
   final dataController = Get.put(DataController());


  @override
  Widget build(BuildContext context) {
    _profileController.getProfileData();
    dataController.getData();
    debugPrint(" user name ${dataController.image.value}");
    return Obx(() {
   //   var profileData = _profileController.profileModel.value.data?.attributes;
      return Row(
        children: [
          ///---------------------profile image------------------------>

        _profileController.profileModel.value.data?.attributes?.image?.publicFileUrl == null?
          CircleAvatar(
            radius: 20.r,
            backgroundImage:  const AssetImage(AppImages.profileImg)
          ) : CircleAvatar(
            radius: 20.r,
            backgroundImage:  NetworkImage("${ApiConstant.imageBaseUrl}/${_profileController.profileModel.value.data?.attributes?.image?.publicFileUrl}")
        ),



          SizedBox(
            width: 12.w,
          ),

          ///---------------------------hello (profile name)----------------------->
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(
                      text: AppString.hello,
                      fontsize: Dimensions.fontSizeDefault.h,
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteB5B5B5,
                    ),
                    SvgPicture.asset(
                      AppIcons.handEmoji,
                      width: 12.w,
                      height: 11.h,
                    )
                  ],
                ),
                CustomText(
                  text: dataController.name.value ?? '',
                  fontsize: 20.h,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                  top: 8.h,
                )
              ],
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.notificationScreen);
            },
            child: Badge(
                backgroundColor: AppColors.primaryColor,
                smallSize: 10,
                child: SvgPicture.asset(
                  AppIcons.bell_icon,
                  height: 32.h,
                  width: 32.w,
                )),
          ),
          SizedBox(
            width: 5.w,
          ),
          GestureDetector(
            onTap: (){
              _homeController.scaffoldKey.currentState!.openEndDrawer();
            },
            child: Padding(
              padding: EdgeInsets.only(left: 8.w, right: 8.w),
              child: SvgPicture.asset(
                AppIcons.menu,
                height: 32.h,
                width: 32.w,
              ),
            ),
          ),
        ],
      );
    });
  }
}
