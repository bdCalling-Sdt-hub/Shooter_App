import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shooter_app/utils/dimentions.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';

import '../../../../utils/app_colors.dart';

class UpComingMatchesListView extends StatelessWidget {
  const UpComingMatchesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      child:  ListView.builder(
         scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              width: 345.w,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                color: AppColors.white
              ),
              child: Column(
                children: [

                  Stack(
                    children: [
                      Image.asset("assets/images/upcomingmatchImage.png"),
                      Positioned(
                        top: 8.h,
                        left: 8.w,
                        child: Container(
                          padding: EdgeInsets.all(8.r),
                          color: AppColors.white,
                          child: CustomText(text: "12 \n Dec", color: AppColors.primaryColor,fontsize: 10.h,fontWeight: FontWeight.w400,),
                        ),
                      )

                    ],
                  ),



                  Row(
                    children: [
                      CustomText(text: "3 Position", color: AppColors.backgroundColor,fontsize: Dimensions.fontSizeDefault,fontWeight: FontWeight.w400,),
                      CustomText(text: "08.00 AM", color: AppColors.backgroundColor,fontsize: Dimensions.fontSizeDefault,fontWeight: FontWeight.w400,),
                    ],
                  )


                ],
              ),
            );

          },

      ),
    );
  }
}
