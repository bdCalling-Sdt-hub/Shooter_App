import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shooter_app/utils/app_images.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_string.dart';
import '../../../utils/dimentions.dart';
import '../../widgets/custom_text.dart';

class EventDetailsScreen extends StatelessWidget {
   EventDetailsScreen({super.key});


  @override
  Widget build(BuildContext context) {

    Map<String, dynamic> arguments = Get.arguments;


    return Scaffold(
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

            CustomText(text: "${arguments["title"]}",fontWeight: FontWeight.w400,fontsize: 20.h,textAlign: TextAlign.start,bottom: 12.h,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    SvgPicture.asset(AppIcons.locationMarker,height: 16.h,width: 16.w,color: AppColors.whiteB5B5B5,),
                    Flexible(
                      child: CustomText(
                        text:" ${arguments["location"]}",
                        color: AppColors.whiteE8E8E8,
                        fontsize: Dimensions.fontSizeDefault.h,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),


              Expanded(
                child: Row(
                  children: [
                    SvgPicture.asset(AppIcons.calander,height: 16.h,width: 16.w,color: AppColors.whiteB5B5B5,),
                    CustomText(
                      text:" ${arguments["date"]}",
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
            
            Image.asset(AppImages.details_screen_image,width: 345.w,height: 180.h,)




          ],
        ),
      ),
    );
  }
}
