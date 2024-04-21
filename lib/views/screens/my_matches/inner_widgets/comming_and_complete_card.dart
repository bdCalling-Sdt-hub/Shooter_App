
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shooter_app/controller/my_match_controller.dart';
import 'package:shooter_app/views/widgets/custom_loader.dart';

import '../../../../routes/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/dimentions.dart';
import '../../../widgets/custom_matches_card.dart';

class CommingAndCompleteCard extends StatelessWidget {
  bool? iscomplete;

  CommingAndCompleteCard({super.key, this.iscomplete});


 final MyMatchController _matchController = Get.put(MyMatchController());

  @override
  Widget build(BuildContext context) {
    return iscomplete == false
        ?

    ///------------------------------complete match------------------------------->
    Obx(() {
      return     ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _matchController.myMatchModel.length,
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
                  date: DateTime.now(),
                  image: "assets/images/upcomingmatchImage.png",
                  time: "08.00 AM",
                  positions: "3x20 Shots \nProne,standing & kneeling ",
                  description: "(First 200 of prone to count for 3P)",
                  buttonText: "See scores",
                  onTap: (){Get.toNamed(AppRoutes.scoresScreen);},
                ),
              ),
              SizedBox(
                height: 16.h,
              )
            ],
          );
        },
      );

    })

    ///------------------------------upcoming match------------------------------->

        : Obx(() {
          return _matchController.myMatchModel.isEmpty || _matchController.myMatchLoading.value ? const Center(child: CustomLoader()) : ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: _matchController.myMatchModel.length,
            itemBuilder: (context, index) {
              var myMatchData = _matchController.myMatchModel[index];
              return Column(
                children: [
                  Container(
                    height: 269.h,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(Dimensions.radiusDefault.r),
                        color: AppColors.white),
                    child: CustomMatchesCard(
                      date: myMatchData.match?.matchDate,
                      image: "assets/images/upcomingmatchImage.png",
                      time: "${myMatchData.match?.time}",
                      gender: myMatchData.gender,
                      positions: "3x20 Shots \nProne,standing & kneeling ",
                      description: "(First 200 of prone to count for 3P)",
                      entryFree:myMatchData.match?.registrationStatus,
                      onTap: (){},
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
    });
  }
}
