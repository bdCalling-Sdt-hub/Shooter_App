import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shooter_app/helper/time_format.dart';
import 'package:shooter_app/routes/app_routes.dart';
import 'package:shooter_app/service/api_constant.dart';
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
  final String? description;
  final String? entryFree;
  final String? buttonText;
  final String? gender;
  final Function() onTap;

  CustomMatchesCard(
      {this.date,
      this.image,
      this.time,
      this.positions,
      this.description,
      this.entryFree,
      this.gender,
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
              ///---------------------------------image and date comtainer---------------------->
              Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radiusDefault.r),
                  ),
                  child: image == null || image == ''
                      ? Image.asset(
                          "$image",
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
            children: [
              ///-----------------------3 position and text---------------------->
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "3 Position",
                    color: AppColors.backgroundColor,
                    fontsize: Dimensions.fontSizeDefault.h,
                    fontWeight: FontWeight.w400,
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
                        text: TimeFormatHelper.timeFormat(date!),
                        color: AppColors.backgroundColor,
                        fontsize: Dimensions.fontSizeDefault.h,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),

              ///---------------------------------Male/Female : genderText------------------------------>
              Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: "${gender} : $positions",
                    color: AppColors.backgroundColor,
                    fontsize: Dimensions.fontSizeSmall.h,
                    textHeight: 1.3.h,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.left,
                    top: 5.h,
                  )),

              ///---------------------------------desciption  text------------------------------>
              Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: "$description",
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
                  ? SizedBox()
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
                  ? SizedBox()
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
