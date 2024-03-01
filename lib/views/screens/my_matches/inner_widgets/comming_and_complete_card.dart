
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/dimentions.dart';
import '../../../widgets/custom_matches_card.dart';

class CommingAndCompleteCard extends StatelessWidget {
  bool? iscomplete;

  CommingAndCompleteCard({super.key, this.iscomplete});

  @override
  Widget build(BuildContext context) {
    return iscomplete == false
        ?

    ///------------------------------complete match------------------------------->
    ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              height: 297.h,
              decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(Dimensions.radiusDefault.r),
                  color: AppColors.white),
              child: CustomMatchesCard(
                date: "12 \n Dec",
                image: "assets/images/upcomingmatchImage.png",
                time: "08.00 AM",
                genderText: "3x20 Shots \nProne,standing & kneeling ",
                description: "(First 200 of prone to count for 3P)",
                buttonText: "See scores",
              ),
            ),
            SizedBox(
              height: 16.h,
            )
          ],
        );
      },
    )


    ///------------------------------upcoming match------------------------------->

        : ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              height: 269.h,
              decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(Dimensions.radiusDefault.r),
                  color: AppColors.white),
              child: CustomMatchesCard(
                date: "12 \n Dec",
                image: "assets/images/upcomingmatchImage.png",
                time: "08.00 AM",
                genderText: "3x20 Shots \nProne,standing & kneeling ",
                description: "(First 200 of prone to count for 3P)",
                amount: "Completed",
                // buttonText: "See scores",
              ),
            ),
            SizedBox(
              height: 10.h,
            )
          ],
        );
      },
    );
  }
}
