import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shooter_app/controller/auth_controller.dart';
import 'package:shooter_app/controller/profileController.dart';
import 'package:shooter_app/helper/time_format.dart';
import 'package:shooter_app/utils/app_string.dart';
import 'package:shooter_app/views/widgets/custom_loader.dart';
import 'package:shooter_app/views/widgets/no_internet_screen.dart';
import '../../../../helper/birthday_time.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_constants.dart';
import '../../../../utils/app_icons.dart';
import '../../../widgets/custom_list_tile.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/genaral_error_screen.dart';
import 'InnerWidget/top_container_section.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
final AuthController _authController = Get.put(AuthController());
  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    _profileController.getProfileData();
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
      body: Obx(() {
        var profileData =_profileController.profileModel.value.data?.attributes;
        print('=========================> $profileData');
        switch (_profileController.rxRequestStatus.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return NoInternetScreen(
              onTap: () {
                _profileController.getProfileData();
              },
            );
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                _profileController.getProfileData();
              },
            );
          case Status.completed:
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.w),
              child: Column(
                children: [
                  SizedBox(height: 24.h),
                  //==================================> TopContainer Section <=================================
                  TopContainerSection(
                    name: "${profileData?.name}",
                    subScription: "${profileData?.subscription}",
                    image: "${profileData?.image?.publicFileUrl}",
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _customContainer(
                        AppString.clasS,
                        profileData?.userClass == null ||
                                profileData?.userClass == ""
                            ? "Name"
                            : '${profileData?.userClass}',
                      ),
                      _customContainer(
                        AppString.club,
                        profileData?.club == null || profileData?.club == ""
                            ? "Name"
                            : "${profileData?.club}",
                      ),
                    ],
                  ),

                  //==================================> CustomContainer Section <=================================

                  ///======================= name=======================>
                  SizedBox(height: 24.h),
                  CustomListTile(
                      title: '${profileData?.name}',
                      prefixIcon: _prefixIcon(AppIcons.user)),
                  SizedBox(height: 16.h),

                  ///=======================date of birth=======================>
                  CustomListTile(
                      title: profileData?.dateOfBirth == null
                          ? "Date of birth"
                          //: "${profileData?.dateOfBirth.toString()}",
                          : BirthdayTimeFormatHelper.formatDate(profileData!.dateOfBirth!),
                      prefixIcon: _prefixIcon(AppIcons.calander)),
                  SizedBox(height: 16.h),

                  ///======================= email=======================>
                  CustomListTile(
                      title: '${profileData?.email}',
                      prefixIcon: _prefixIcon(AppIcons.mail)),
                  SizedBox(height: 16.h),

                  ///======================= phone number=======================>
                  CustomListTile(
                      title:
                          profileData?.phone == null || profileData?.phone == ''
                              ? "(000) 000-0000"
                              : '${profileData?.phone}',
                      prefixIcon: _prefixIcon(
                        AppIcons.phone,
                      )),
                  SizedBox(height: 16.h),

                  ///======================= address=======================>
                  CustomListTile(
                    title: profileData?.address == null ||
                            profileData?.address == ''
                        ? "Address"
                        : '${profileData?.address}',
                    prefixIcon: _prefixIcon(AppIcons.locationMarker),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            );
        }
      }),
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
