import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shooter_app/helper/time_format.dart';
import 'package:shooter_app/service/api_constant.dart';
import 'package:shooter_app/views/widgets/custom_button.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_string.dart';
import '../../../utils/dimentions.dart';
import '../../widgets/custom_text.dart';

class EventDetailsScreen extends StatelessWidget {
  EventDetailsScreen({super.key});


  var evensData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///--------------------------------app bar ----------------------------->
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: AppString.eventdetails,
          fontsize: Dimensions.fontSizeLarge,
          color: AppColors.white,
          fontWeight: FontWeight.w400,
        ),
      ),

      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w, vertical: 18.h),
        child: ListView(
          children: [
            ///---------------------------------image----------------------------->
            Container(
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
              child: CachedNetworkImage(
                imageUrl:
                    "${ApiConstant.imageBaseUrl}/${evensData.image?.publicFileUrl}",
                width: 345.w,
                fit: BoxFit.cover,
                height: 180.h,
              ),
            ),

            ///====================event name======================>
            CustomText(
              text: 'Event Name: ${evensData.eventName}',
              color: AppColors.white,
              fontsize: Dimensions.fontSizeDefault.h,
              fontWeight: FontWeight.w400,
              top: 24.h,
              bottom: 16.h,
              textAlign: TextAlign.start,
            ),

            ///=====================location======================>
            Row(
              children: [
                SvgPicture.asset(
                  AppIcons.locationMarker,
                  color: Colors.white,
                  height: 16.h,
                  width: 16.w,
                ),
                Flexible(
                  child: CustomText(
                    text: " ${evensData.location}" ?? "",
                    color: AppColors.white,
                    fontsize: Dimensions.fontSizeDefault.h,
                    fontWeight: FontWeight.w400,
                    top: 2.h,
                  ),
                ),
              ],
            ),

            SizedBox(height: 8.h),

            Row(
              children: [
                ///---------------------calender icon----------------------->
                SvgPicture.asset(
                  AppIcons.clock,
                  height: 16.h,
                  width: 16.w,
                  color: AppColors.whiteB5B5B5,
                ),

                ///----------------------------date text------------------------->
                CustomText(
                  text:
                      " ${TimeFormatHelper.formatDate(evensData.eventDate)}",
                  color: AppColors.whiteE8E8E8,
                  fontsize: Dimensions.fontSizeDefault.h,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),

            SizedBox(height: 8.h),

            Row(
              children: [
                ///------------------------Register Closing Date------------------>
                CustomText(
                  text: "Register Closing date:",
                  color: AppColors.whiteE8E8E8,
                  fontsize: Dimensions.fontSizeDefault.h,
                  fontWeight: FontWeight.w400,
                ),

                ///------------------------time count down------------------>
                // TimeCountDown(
                //   dateLine: evensData.startedDate,
                //   textColor: Colors.white,
                // )
                CustomText(
                  text: TimeFormatHelper.formatDate(evensData.eventDate),
                  color: AppColors.white,
                  fontsize: Dimensions.fontSizeDefault.h,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),

            SizedBox(
              height: 8.h
            ),
            Row(
              children: [
                ///------------------------Closing date: text------------------>
                CustomText(
                  text: "Date of Event:",
                  color: AppColors.whiteE8E8E8,
                  fontsize: Dimensions.fontSizeDefault.h,
                  fontWeight: FontWeight.w400,
                ),

                ///------------------------16 Aug 2024 text------------------>
                CustomText(
                  text: " ${TimeFormatHelper.formatDate(evensData.closeDate)}",
                  color: AppColors.white,
                  fontsize: Dimensions.fontSizeDefault.h,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),

            SizedBox(height: 8.h),
            Row(
              children: [
                ///------------------------ Entry Fee------------------>
                CustomText(
                  text: "Entry Fee:",
                  color: AppColors.whiteE8E8E8,
                  fontsize: Dimensions.fontSizeDefault.h,
                  fontWeight: FontWeight.w400,
                ),

                ///------------------------16 Aug 2024 text------------------>
                CustomText(
                  text: ' ${evensData.fee}',
                  color: AppColors.white,
                  fontsize: Dimensions.fontSizeDefault.h,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),


            ///------------------------Description text------------------>
            CustomText(
              text: "Description",
              color: AppColors.white,
              fontsize: Dimensions.fontSizeLarge.h,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.start,
              bottom: 8.h,
              top: 24.h
            ),

            ///------------------------Description text------------------>
            SizedBox(
              // color: AppColors.backgroundColor,
              child: Html(
                shrinkWrap: true,
                data: evensData.description,
              ),
            ),

            // Flexible(child: _matchSection()),

            SizedBox(height: 12.h),
            
            
            CustomButton(title: "Register", onpress: (){
              Get.toNamed(AppRoutes.registrationScreen);
            })
          ],
        ),
      ),
    );
  }
}
