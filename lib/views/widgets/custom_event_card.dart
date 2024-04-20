
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shooter_app/views/widgets/time_count_down.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_icons.dart';
import '../../utils/dimentions.dart';
import 'custom_button.dart';
import 'custom_text.dart';

class CustomEventsCard extends StatelessWidget {
  const CustomEventsCard({
    super.key,this.date, this.image, this.location, this.title, this.startDate, this.onTap
  });

  final String? date;
  final String? image;
  final String? location;
  final String? title;
  final String? startDate;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault.r),
          color: AppColors.white
      ),
      child: Column(
        children: [
          ///---------------------------------image and date card---------------------->
          Padding(
            padding: EdgeInsets.all(12.r),
            child: Stack(
              children: [

                ///---------------------------------image ---------------------->
                Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radiusDefault.r),
                    ),
                    child: Image.asset(image??"",height: 115.h,width: 321.w,fit: BoxFit.fill,)),
                ///--------------------------------- Date card---------------------->

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
                      text: date??"",
                      color: AppColors.primaryColor,
                      fontsize: 10.h,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 12.w, right: 12, top: 8.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text:title??"",
                      color: AppColors.backgroundColor,
                      fontsize: Dimensions.fontSizeDefault.h,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(height: 5.h,),
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.locationMarker,height: 12.h,width: 12.w,),
                        Flexible(
                          child: CustomText(
                            text:location??"",
                            color: AppColors.backgroundColor,
                            fontsize: Dimensions.fontSizeExtraSmall.h,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),

                  ],
                )),
                SizedBox(width: 10.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    ///-----------------------EEUFEES SHOOTING RANGE text---------------------->
                    CustomText(
                      text: "Started In:",
                      color: AppColors.backgroundColor,
                      fontsize: 10.h,
                      fontWeight: FontWeight.w400,
                    ),

                    SizedBox(height: 5.h,),

                    TimeCountDown(dateLine: DateTime.parse("$startDate"))
                    // CustomText(
                    //   text: TimeCountDown(dateLine: startDate,),
                    //   color: AppColors.backgroundColor,
                    //   fontsize: Dimensions.fontSizeSmall.h,
                    //   fontWeight: FontWeight.w400,
                    // ),


                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:12.w
            ),
            child: CustomButton(title: "See Details",height:40.h,fontSize: 12.h, onpress:onTap??(){}, titlecolor: AppColors.white),
          ),


        ],
      ),
    );
  }
}