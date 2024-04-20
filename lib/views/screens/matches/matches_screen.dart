import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_string.dart';
import '../../../utils/dimentions.dart';
import '../../widgets/custom_matches_card.dart';
import '../../widgets/custom_text.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(



      appBar: AppBar(
        leading: const SizedBox(),
        centerTitle: true,
        title: CustomText(text: AppString.matches,fontsize: Dimensions.fontSizeLarge,color: AppColors.white,fontWeight: FontWeight.w400,),
      ),




      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w),
        child:  ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return  Column(
              children: [
                index == 0? SizedBox(height: 24.h,) : SizedBox(),
                Container(
                  height: 316.h,
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
                    onTap: (){Get.toNamed(AppRoutes.registrationScreen);},
                  ),
                ),


                SizedBox(height: 16.h,)
              ],
            );

          },
        )
      ),

    );
  }
}
