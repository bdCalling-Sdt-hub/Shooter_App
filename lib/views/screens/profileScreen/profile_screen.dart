import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shooter_app/utils/app_string.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/location_container.dart';
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
            const CustomContainer(
                title: 'Arnold Bailie', prefixIcon: Icons.person_outline),
            SizedBox(height: 16.h),
            const CustomContainer(
                title: '20-01-1996', prefixIcon: Icons.cake_outlined),
            SizedBox(height: 16.h),
            const CustomContainer(
                title: 'arnold.07@gmail.com', prefixIcon: Icons.mail_outline),
            SizedBox(height: 16.h),
            const CustomContainer(
                title: '(406) 555-0120', prefixIcon: Icons.call_rounded),
            SizedBox(height: 16.h),
            const LocationContainer(
                title: '2972 Westheimer Rd. Santa Ana, \nIllinois 85486 ',
                prefixIcon: Icons.location_on_outlined),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
