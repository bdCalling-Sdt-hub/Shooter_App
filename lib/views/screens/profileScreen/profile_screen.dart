import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shooter_app/utils/app_string.dart';
import '../../../utils/app_icons.dart';
import '../../widgets/custom_list_tile.dart';
import '../../widgets/custom_text.dart';
import 'InnerWidget/top_container_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: CustomText(
          text: AppString.profile,
          fontName: 'Aldrich',
          fontsize: 18.h,
          fontWeight: FontWeight.w400,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27.w),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            //==================================> TopContainer Section <=================================
            TopContainerSection(),

            //==================================> CustomContainer Section <=================================

            SizedBox(height: 24.h),
            CustomListTile(
                title: 'Arnold Bailie', prefixIcon: SvgPicture.asset(AppIcons.user,color: Colors.white,)),
            SizedBox(height: 16.h),
            CustomListTile(
                title: '20-01-1996', prefixIcon: SvgPicture.asset(AppIcons.cake, color: Colors.white)),
            SizedBox(height: 16.h),
            CustomListTile(
                title: 'arnold.07@gmail.com', prefixIcon: SvgPicture.asset(AppIcons.mail, color: Colors.white)),
            SizedBox(height: 16.h),
            CustomListTile(
                title: '(406) 555-0120', prefixIcon: SvgPicture.asset(AppIcons.phone, color: Colors.white)),
            SizedBox(height: 16.h),
            CustomListTile(
                title: '2972 Westheimer Rd. Santa Ana, Illinois 85486 ',
                prefixIcon: SvgPicture.asset(AppIcons.location, color: Colors.white)),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
