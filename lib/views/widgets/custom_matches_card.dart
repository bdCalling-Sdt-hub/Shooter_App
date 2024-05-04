import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shooter_app/helper/time_format.dart';
import 'package:shooter_app/routes/app_routes.dart';
import 'package:shooter_app/service/api_constant.dart';
import 'package:shooter_app/utils/app_images.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_icons.dart';
import '../../utils/dimentions.dart';
import 'custom_button.dart';
import 'custom_text.dart';

class CustomMatchesCard extends StatelessWidget {
  final DateTime? date;
  final String? image;
  final String? time;
  final String? positions;
  final String? prone;
  final String? entryFree;
  final String? buttonText;
  final String? gender;
  final String? matchName;
  final String? eventName;
  final Function() onTap;

   CustomMatchesCard(
      {this.date,
      this.image,
      this.time,
      this.positions,
      this.prone,
      this.entryFree,
      this.gender,
        this.matchName,
        this.eventName,
      required this.onTap,
      this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(12.r),
          child: Stack(
            children: [
              ///---------------------------------image and date container---------------------->
              Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radiusDefault.r),
                  ),
                  child: image == null || image == ''
                      ? Image.asset(
                          "${AppImages.backgroundImg}",
                          height: 115.h,
                          width: 321.w,
                          fit: BoxFit.fill,
                        )
                      : CachedNetworkImage(
                          imageUrl: '${ApiConstant.imageBaseUrl}/$image',
                    height: 115.h,
                    width: 321.w,
                    fit: BoxFit.fill,
                  )),
              Positioned(
                top: 8.h,
                left: 8.w,
                child: Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(4.r)),
                  child: CustomText(
                    text: TimeFormatHelper.dateMountFormat(date!),
                    color: AppColors.primaryColor,
                    fontsize: 10.h,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 12.w,
            right: 12.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              ///-----------------------name---------------------->
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomText(
                      text: 'Event Name: $eventName' ?? '',
                      color: AppColors.backgroundColor,
                      fontsize: Dimensions.fontSizeDefault.h,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.start,
                    
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 5.h, right: 5.w),
                          child: SvgPicture.asset(
                            AppIcons.clock,
                            width: 12.w,
                            height: 15.h,
                          )),

                      ///---------------------time text----------------------><
                      CustomText(
                        text: TimeFormatHelper.timeWithAMPM(time!),
                        color: AppColors.backgroundColor,
                        fontsize: Dimensions.fontSizeDefault.h,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),


              CustomText(
                top: 5.h,
                text: 'Match Name: $matchName' ?? '',
                color: AppColors.backgroundColor,
                fontsize: Dimensions.fontSizeDefault.h,
                fontWeight: FontWeight.w400,
              ),


              ///--------------------------------- gender Text------------------------------>
              Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: "Gender: ${gender!.toLowerCase() == 'both' ? 'Male/Female' : gender}",
                    color: AppColors.backgroundColor,
                    fontsize: Dimensions.fontSizeSmall.h,
                    textHeight: 1.3.h,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.left,
                    top: 5.h,
                  )),

              ///---------------------------------prone text------------------------------>
              Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: "Prone: $prone",
                    color: AppColors.backgroundColor,
                    fontsize: Dimensions.fontSizeSmall.h,
                    fontWeight: FontWeight.w400,
                    top: 5.h,
                  )),

              SizedBox(
                height: 10.h,
              ),

              ///-----------------------amount ---------------------->

              entryFree == null
                  ? const SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "Registration fee :",
                          color: AppColors.backgroundColor,
                          fontsize: Dimensions.fontSizeDefault.h,
                          fontWeight: FontWeight.w400,
                        ),
                        CustomText(
                          text: entryFree ?? "",
                          color: AppColors.backgroundColor,
                          fontsize: Dimensions.fontSizeDefault.h,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),

              SizedBox(
                height: 16.h,
              ),

              ///---------------------------botton----------------------------------->
              buttonText == null
                  ? const SizedBox()
                  : CustomButton(
                      title: "$buttonText",
                      height: 40.h,
                      fontSize: 12.h,
                      onpress: onTap,
                      //     onpress:(){
                      //   Get.toNamed(AppRoutes.registrationScreen);
                      // },
                      titlecolor: AppColors.white),

            ],
          ),
        )
      ],
    );
  }
}
