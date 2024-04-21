import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shooter_app/routes/app_routes.dart';
import 'package:shooter_app/utils/dimentions.dart';
import '../../../../controller/match_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../widgets/custom_matches_card.dart';


class UpComingMatchesListView extends StatelessWidget {
   UpComingMatchesListView({super.key});
  final MatchController _matchController = Get.put(MatchController());

  @override
  Widget build(BuildContext context) {
    _matchController.getUpComingMatchs();
    return Container(
      height: 315.h,
      child: Obx(() {

        _matchController.upComingMatchModel.value;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _matchController.upComingMatchModel.value.data?.attributes?.length,
            itemBuilder: (context, index) {
              var matchData = _matchController.upComingMatchModel.value.data?.attributes?[index];
              return Container(
                margin: EdgeInsets.only(
                    left: index == 0 ? Dimensions.paddingSizeDefault.w : 5.w,
                    right: index == 5 - 1 ? Dimensions.paddingSizeDefault.w : 5
                        .w),
                width: 350.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        Dimensions.radiusDefault.r),
                    color: AppColors.white
                ),
                child: CustomMatchesCard(
                  gender: matchData?.gender,
                  date: matchData?.matchDate,
                  image: "assets/images/upcomingmatchImage.png",
                  time: "${matchData?.time}" ?? "",
                  positions: "3x20 Shots \nProne,standing & kneeling ",
                  description: "(First 200 of prone to count for 3P)",
                  entryFree: "R ${matchData?.fee} Per Entry",
                  buttonText: "Register",
                  onTap: () {
                    Get.toNamed(AppRoutes.registrationScreen);
                  },
                ),
              );
            },
          );
      }),
    );
  }
}

