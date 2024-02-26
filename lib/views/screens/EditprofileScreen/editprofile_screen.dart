import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shooter_app/views/widgets/custom_text_field.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_string.dart';
import '../../widgets/custom_text.dart';

class EditprofileScreen extends StatelessWidget {
  const EditprofileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: CustomText(
          text: AppString.editProfile,
          fontName: 'Aldrich',
          fontsize: 18.h,
          fontWeight: FontWeight.w400,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 22.h),
            Center(
              child: Stack(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    width: 100.w,
                    height: 100.h,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Image.asset(
                      AppImages.profileImg,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: SvgPicture.asset(AppIcons.groupEdit))
                ],
              ),
            ),
            SizedBox(height: 24.h),
            CustomTextField(
              contenpaddingHorizontal: 12.w,
              contenpaddingVertical: 16.h,
              hintText: 'Enter your name',
              prifixicon: _prefixIcon(AppIcons.user),),
            SizedBox(height: 16.h),
            CustomTextField(
              contenpaddingHorizontal: 12.w,
              contenpaddingVertical: 16.h,
              hintText: 'Enter your date of birth',
              prifixicon: _prefixIcon(AppIcons.cake),
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              contenpaddingHorizontal: 12.w,
              contenpaddingVertical: 16.h,
              hintText: 'Enter your email',
              prifixicon:  _prefixIcon(AppIcons.mail),
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              contenpaddingHorizontal: 12.w,
              contenpaddingVertical: 16.h,
              hintText: '(406) 555-0120',
              prifixicon: _prefixIcon(AppIcons.phone),
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              contenpaddingHorizontal: 12.w,
              contenpaddingVertical: 16.h,
              hintText: "Enter your location",
              prifixicon: _prefixIcon(AppIcons.location,),),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }

  _prefixIcon(String icon) {
    return Padding(
              padding:  EdgeInsets.only(left:8.w,right: 16.w
              ),
              child: SvgPicture.asset(
                icon,
                fit: BoxFit.contain,
                color: Colors.white,
              ),
            );
  }
}
