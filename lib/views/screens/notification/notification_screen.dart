import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_string.dart';
import '../../../utils/dimentions.dart';
import '../../widgets/custom_text.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///-----------------------------------app bar section-------------------------->
      appBar: AppBar(



        leading: Padding(
          padding: EdgeInsets.all(20.r),


          child: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: SvgPicture.asset(
              "assets/icons/back_arrow.svg",
              width: 14.w,
              height: 14.h,
            ),
          ),
        ),
        centerTitle: true,



        title: CustomText(
          textAlign: TextAlign.start,
          text: AppString.notification,
          fontsize: Dimensions.fontSizeExtraLarge.h,
          fontWeight: FontWeight.w400,
          color: AppColors.white,
        ),
      ),

      ///-----------------------------------body section-------------------------->
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 15),
        child: Column(
          children: [

            ///-----------------------notification------------------------>
            _Notification(),
            SizedBox(height: 12.h,),
            _Notification(),
            SizedBox(height: 12.h,),
            _Notification(),
          ],
        ),
      ),
    );
  }



  _Notification() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 10.h,
                width: 10.w,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.red),
              ),
              Container(
                margin: EdgeInsets.only(left: 8.w, right: 7.w),
                padding: EdgeInsets.all(7.r),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xffFFE7EA)),
                child: SvgPicture.asset(
                  AppIcons.bell_icon,
                  color: AppColors.primaryColor,
                ),
              )
            ],
          ),
          Expanded(
            // Expanded widget to allow the text to take up available space
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "You have a new match in 2 Aug 2024",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: Dimensions.fontSizeLarge.h,
                      color: AppColors.white,
                      fontFamily: "Aldrich",
                      height: 1.5),
                ),

                // CustomText(
                //   maxline: 10,
                //   text: "You have a new match in 2 Aug 2024",
                //   fontsize: Dimensions.fontSizeLarge.h,
                //   fontWeight: FontWeight.w400,
                //   color: AppColors.white,
                //   textAlign: TextAlign.start,
                //
                // ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    top: 2.h,

                    text: "2 hours ago",
                    fontsize: Dimensions.fontSizeSmall.h,
                    fontWeight: FontWeight.w400,
                    color: const Color(
                      0xFF8C8C8C,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
