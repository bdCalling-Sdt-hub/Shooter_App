import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shooter_app/utils/app_images.dart';
import 'package:shooter_app/views/widgets/custom_matches_card.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_string.dart';
import '../../../utils/dimentions.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import 'inner_widgets/event_match_card.dart';

class EventDetailsScreen extends StatelessWidget {
   EventDetailsScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      ///--------------------------------app bar ----------------------------->
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
        title: CustomText(text: AppString.eventdetails,fontsize: Dimensions.fontSizeLarge,color: AppColors.white,fontWeight: FontWeight.w400,),
      ),




      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w),
        child: ListView(

          children: [

            ///------------------------------EEUFEES SHOOTING RANGE text----------------------------------->?
            CustomText(text: "EEUFEES SHOOTING RANGE",fontWeight: FontWeight.w400,fontsize: 20.h,textAlign: TextAlign.start,bottom: 12.h,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    SvgPicture.asset(AppIcons.locationMarker,height: 16.h,width: 16.w,color: AppColors.whiteB5B5B5,),
                    Flexible(
                      child: CustomText(
                        text:" Carl Osburn (USA)",
                        color: AppColors.whiteE8E8E8,
                        fontsize: Dimensions.fontSizeDefault.h,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),


              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    ///---------------------calender icon----------------------->
                    SvgPicture.asset(AppIcons.calander,height: 16.h,width: 16.w,color: AppColors.whiteB5B5B5,),

                    ///----------------------------date text------------------------->
                    CustomText(
                      text:" 16 Dec 2024",
                      color: AppColors.whiteE8E8E8,
                      fontsize: Dimensions.fontSizeDefault.h,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              )
            ],
          ),
            



            SizedBox(height: 12.h,),
            ///---------------------------------image----------------------------->
            Image.asset(AppImages.details_screen_image,width: 345.w,height: 180.h,),


            SizedBox(height: 12.h,),
            Row(
              children: [
                ///------------------------Started In: text------------------>
                CustomText(
                  text:"Started In: ",
                  color: AppColors.whiteE8E8E8,
                  fontsize: Dimensions.fontSizeDefault.h,
                  fontWeight: FontWeight.w400,
                ),

                ///------------------------20d : 14h : 24m text------------------>
                CustomText(
                  text:" 20d : 14h : 24m",
                  color: AppColors.white,
                  fontsize: Dimensions.fontSizeDefault.h,
                  fontWeight: FontWeight.w400,
                ),

              ],
            ),





            SizedBox(height: 8.h,),
            Row(
              children: [
                ///------------------------Closing date: text------------------>
                CustomText(
                  text:"Closing date: ",
                  color: AppColors.whiteE8E8E8,
                  fontsize: Dimensions.fontSizeDefault.h,
                  fontWeight: FontWeight.w400,
                ),

                ///------------------------16 Aug 2024 text------------------>
                CustomText(
                  text:" 16 Aug 2024",
                  color: AppColors.white,
                  fontsize: Dimensions.fontSizeDefault.h,
                  fontWeight: FontWeight.w400,
                ),

              ],
            ),




            ///------------------------Registration open text------------------>
            CustomText(
              text:" 16 Aug 2024",
              color: AppColors.white,
              fontsize: Dimensions.fontSizeSmall.h,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.start,
              top: 8.h,
              bottom: 12.h,
            ),



            ///------------------------Description text------------------>
            CustomText(
              text:"Description",
              color: AppColors.white,
              fontsize: Dimensions.fontSizeLarge.h,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.start,
              top: 8.h,
            ),



            ///------------------------Description text------------------>
            CustomText(
              text:"Lorem ipsum dolor sit amet consectetur. Ipsum faucibus non aenean velit sagittis egestas. Nunc amet facilisis scelerisque scelerisque nunc egestas faucibus neque ipsum. Fusce malesuada tempor tempus enim. ",
              color: AppColors.whiteE8E8E8,
              fontsize: Dimensions.fontSizeDefault.h,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.start,
              maxline: 10,
              top: 8.h,
              bottom: 8.h,
            ),




            ///------------------------Description all text------------------>
            CustomText(
              text:"SATRF and SATRA Rules will apply for all matches.",
              color: AppColors.whiteE8E8E8,
              fontsize: Dimensions.fontSizeDefault.h,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.start,
              maxline: 3,
              top: 8.h,
              bottom: 8.h,
            ),



            _matchSection(),

            SizedBox(height: 12.h)

          ],
        ),
      ),
    );
  }




  _matchSection(){
    return Column(
      children: [


        ///------------------------Matches text------------------>
        Align(
          alignment: Alignment.centerLeft,
          child: CustomText(
            text:"Matches",
            color: AppColors.white,
            fontsize: Dimensions.fontSizeLarge.h,
            fontWeight: FontWeight.w400,
            top: 8.h,
            bottom: 16.h,
          ),
        ),


        ///-----------------------------up coming match card----------------------->
        Container(
          height: 296.h,
          width: 350.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault.r),
              color: AppColors.white
          ),
          child: CustomMatchesCard(

            date : "12 \n Dec",
            image : "assets/images/upcomingmatchImage.png",
            time : "08.00 AM",
            genderText: "3x20 Shots \nProne,standing & kneeling ",
            description: "(First 200 of prone to count for 3P)",
            amount: "R 40-00 Per Entry",
            buttonText: "Register",

          ),
        ),


        SizedBox(height: 16.h,),


        ///-----------------------------up coming match card 1st----------------------->
        Container(
          width: 350.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault.r),
              color: AppColors.white
          ),
          child: EventMatchCard(
            date: "20\nDec",
            image : "assets/images/upcomingmatchImage.png",
            time: "11.00 AM",
            meter: "50m Prone",
            firstDetail: "First detail",
            score: "1x600",
            entryFree: "R 40-00 Per Entry",
            buttonText: "Register",
          ),
        ),



        SizedBox(height: 16.h,),

        ///-----------------------------up coming match card 2nd----------------------->
        Container(
          width: 350.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault.r),
              color: AppColors.white
          ),
          child: EventMatchCard(
            date: "20\nDec",
            image : "assets/images/upcomingmatchImage.png",
            time: "11.00 AM",
            peepAndTelescope: "(Peep and telescope)",
            meter: "50m Prone",
            firstDetail: "Male : 2 Classes",
            score: "1x600",
            entryFree: "R 40-00 Per Entry",
            buttonText: "Register",
          ),
        ),

      ],
    );
  }
}

