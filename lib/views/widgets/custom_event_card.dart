import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shooter_app/helper/time_format.dart';
import 'package:shooter_app/service/api_constant.dart';
import 'package:shooter_app/utils/app_images.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_icons.dart';
import '../../utils/dimentions.dart';
import 'custom_button.dart';
import 'custom_text.dart';

class CustomEventsCard extends StatelessWidget {
  const  CustomEventsCard({
    super.key,
    this.eventDate,
    this.image,
    this.btnName,
    this.registationComplete,
    this.location,
    this.title,
    this.registerClosingDate,
    this.onTap,
  });

  final DateTime? eventDate;
  final String? image;
  final String? registationComplete;
  final String? location;
  final String? title;
  final String? btnName;
  final DateTime? registerClosingDate;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 350.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault.r),
          color: Colors.black,
          border: Border.all(color: Colors.grey.withOpacity(.6), width: .5)),
      child: Column(
        children: [
          ///---------------------------------image and date card---------------------->
          Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radiusDefault.r),
                    topRight: Radius.circular(Dimensions.radiusDefault.r)),
              ),
              child: image == '' || image == null
                  ? Image.asset(
                      AppImages.backgroundImg,
                      height: 115.h,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    )
                  : CachedNetworkImage(
                      imageUrl: '${ApiConstant.imageBaseUrl}/$image' ?? "",
                      key: UniqueKey(),
                      height: 115.h,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    )),

          Padding(
            padding: EdgeInsets.only(left: 12.w, right: 12, top: 16.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Event Name: $title',
                      color: AppColors.white,
                      fontsize: Dimensions.fontSizeDefault.h,
                      fontWeight: FontWeight.w400,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.locationMarker,
                          color: Colors.white,
                          height: 12.h,
                          width: 12.w,
                        ),
                        Flexible(
                          child: CustomText(
                            text: " $location" ?? "",
                            color: AppColors.white,
                            fontsize: Dimensions.fontSizeExtraSmall.h,
                            fontWeight: FontWeight.w400,
                            top: 2.h,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          ),

          SizedBox(height: 10.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///-----------------------Register Closing date:---------------------->
                    CustomText(
                      text: "Register Closing date:",
                      color: AppColors.whiteB5B5B5,
                      fontsize: 10.h,
                      fontWeight: FontWeight.w400,
                    ),

                    SizedBox(height: 5.h),

                    // TimeCountDown(dateLine: DateTime.parse("$startDate"))
                    CustomText(
                      text: TimeFormatHelper.formatDate(registerClosingDate!),
                      color: AppColors.white,
                      fontsize: Dimensions.fontSizeSmall.h,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ///----------------------Date of Event:---------------------->
                    CustomText(
                      text: "Date of Event:",
                      color: AppColors.whiteB5B5B5,
                      fontsize: 10.h,
                      fontWeight: FontWeight.w400,
                    ),

                    SizedBox(
                      height: 5.h,

                    ),

                    CustomText(
                      text: TimeFormatHelper.formatDate(eventDate!),
                      color: AppColors.white,
                      fontsize: Dimensions.fontSizeSmall.h,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 18.h),
          registationComplete != null ? Align(
              alignment: Alignment.centerLeft,
              child: CustomText(text: "Registration status : $registationComplete",left: 12.w,fontWeight: FontWeight.w500, fontsize: 12.h)) :
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: CustomButton(
                title: btnName ?? "See Details",
                height: 40.h,
                fontSize: 12.h,
                onpress: onTap ?? () {},
                titlecolor: AppColors.white),
          ),
          SizedBox(height: 10.h)
        ],
      ),
    );
  }
}
