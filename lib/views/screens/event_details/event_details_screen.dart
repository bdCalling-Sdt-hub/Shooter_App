import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w, vertical: 18.h),
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
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

              SizedBox(height: 8.h),



              ///------------------------Description text------------------>
              CustomText(
                text: "Matches",
                color: AppColors.white,
                fontsize: Dimensions.fontSizeLarge.h,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start,
                top: 3.h,
              ),

              SizedBox(height: 20.h),



              SizedBox(
                height: (80.5 *  evensData.matches.length).toDouble(),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: evensData.matches.length,
                  itemBuilder: (context, index) {
                    var matchInfo = evensData.matches[index];
                    return Container(
                      padding: EdgeInsets.only(left: 12.w),
                      margin: EdgeInsets.only(bottom: 12.h),
                      decoration: BoxDecoration(
                          color: const Color(0xffB5B5B5).withOpacity(.30),
                        borderRadius: BorderRadius.circular(8.r)
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          height: 48.h,
                          width: 48.h,
                          clipBehavior: Clip.antiAlias,
                          decoration:   BoxDecoration(
                            border: Border.all(color: Colors.red,width: 0.5),
                            color: Colors.grey,
                            shape: BoxShape.circle
                          ),
                          child: Center(child: CustomText(text: '${index+1}',color: const Color(0xffbacFA1131),fontsize: 16.h)),
                        ),


                        title: CustomText(text: "${matchInfo.matchName}",textAlign:TextAlign.start,),
                         subtitle: CustomText(text: "${matchInfo.description}", textAlign: TextAlign.start,fontsize: 10.h,)
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 34.h),


              CustomButton(title: "Register", onpress: (){

                Get.toNamed(AppRoutes.registrationScreen, arguments: evensData.matches);
              })
            ],
          ),
        ),
      ),
    );
  }
}
