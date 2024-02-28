import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shooter_app/utils/dimentions.dart';
import '../../../../utils/app_colors.dart';
import '../../../widgets/custom_matches_card.dart';

class UpComingMatchesListView extends StatelessWidget {
  const UpComingMatchesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 294.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {


          return Container(
            margin: EdgeInsets.only(left:index==0?Dimensions.paddingSizeDefault.w:5.w ,right:index ==5-1?Dimensions.paddingSizeDefault.w:5.w ),
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
          );
        },
      ),
    );
  }
}

