

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimentions.dart';
import '../../../widgets/custom_text.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ///---------------------profile image------------------------>
            CircleAvatar(
              radius: 20.r,
              backgroundImage:
              const AssetImage("assets/images/profile_Image.png"),
            ),

            ///---------------------------hello (profile name)----------------------->
            Container(
              margin: EdgeInsets.only(left: 10.w),
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
                    text: AppString.arnold,
                    fontsize: 20.h,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                    top: 8.h,
                  )
                ],
              ),
            ),
          ],
        ),

        ///----------------------------bell and menu icons--------------------------->
        Row(
          children: [
            Badge(
                smallSize: 10,
                child: SvgPicture.asset(
                  AppIcons.bell_icon,
                  height: 32.h,
                  width: 32.w,
                )),


            Container(
              margin: EdgeInsets.only(left: 8.w),
              child: SvgPicture.asset(
                AppIcons.menu,
                height: 32.h,
                width: 32.w,
              ),
            )
          ],
        )
      ],
    );
  }
}
