import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shooter_app/utils/dimentions.dart';
import 'package:shooter_app/views/widgets/custom_button.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';

class UpComingMatchesListView extends StatelessWidget {
  const UpComingMatchesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 340.h,
      height: 315.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {



          return Container(
            margin: const EdgeInsets.only(right: 5, left: 5),
            width: 350.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault.r),
                color: AppColors.white
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(12.r),
                  child: Stack(
                    children: [

                      ///---------------------------------image and date comtainer---------------------->
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radiusDefault.r),
                        ),
                          child: Image.asset("assets/images/upcomingmatchImage.png",height: 115.h,)),
                      Positioned(
                        top: 8.h,
                        left: 8.w,
                        child: Container(
                          padding: EdgeInsets.all(8.r),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                            borderRadius: BorderRadius.circular(4.r)
                          ),
                          child: CustomText(
                            text: "12 \n Dec",
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
                  margin: EdgeInsets.only(left: 12.w, right: 12, top: 8.h),
                  child: Column(
                    children: [
                      ///-----------------------3 position and time text---------------------->
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
                                  margin: EdgeInsets.only(bottom: 5.h,right: 5),
                                  child: SvgPicture.asset(AppIcons.clock,width: 12.w,height: 15.h,)),
                              CustomText(
                                text: "08.00 AM",
                                color: AppColors.backgroundColor,
                                fontsize: Dimensions.fontSizeDefault,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ],
                      ),

                      ///---------------------------------Male/Female : 3x20 Shots text------------------------------>
                      Align(
                          alignment: Alignment.centerLeft,
                          child: CustomText(
                            text: "Male/Female : 3x20 Shots",
                            color: AppColors.backgroundColor,
                            fontsize: Dimensions.fontSizeSmall.h,
                            fontWeight: FontWeight.w400,
                            top: 5.h,
                          )),



                      ///--------------------------------(First 200 of prone to count for 3P) text------------------------------>
                      Align(
                          alignment: Alignment.centerLeft,
                          child: CustomText(
                            text: "Prone,standing & kneeling ",
                            color: AppColors.backgroundColor,
                            fontsize: Dimensions.fontSizeSmall.h,
                            fontWeight: FontWeight.w400,
                            top: 5.h,
                          )),





                      ///---------------------------------Prone,standing & kneeling  text------------------------------>
                      Align(
                          alignment: Alignment.centerLeft,
                          child: CustomText(
                            text: "(First 200 of prone to count for 3P)",
                            color: AppColors.backgroundColor,
                            fontsize: Dimensions.fontSizeSmall.h,
                            fontWeight: FontWeight.w400,
                            top: 5.h,
                          )),




                      SizedBox(height: 10.h,),

                      ///-----------------------Registration fee :  R 40-00 Per Entry---------------------->
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Registration fee :",
                            color: AppColors.backgroundColor,
                            fontsize: Dimensions.fontSizeDefault.h,
                            fontWeight: FontWeight.w400,
                          ),
                          CustomText(
                            text: "R 40-00 Per Entry",
                            color: AppColors.backgroundColor,
                            fontsize: Dimensions.fontSizeDefault.h,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      
                      

                      SizedBox(height: 12.h,),
                      
                      
                      ///---------------------------botton----------------------------------->
                      CustomButton(title: "Register", onpress: (){}, titlecolor: AppColors.white)
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
