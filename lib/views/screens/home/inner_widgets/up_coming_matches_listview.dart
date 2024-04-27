import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shooter_app/routes/app_routes.dart';
import 'package:shooter_app/utils/dimentions.dart';
import 'package:shooter_app/views/widgets/custom_loader.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';
import '../../../../controller/home_controller.dart';
import '../../../../controller/match_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../widgets/custom_matches_card.dart';

class UpComingMatchesListView extends StatelessWidget {
  UpComingMatchesListView({super.key});
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    _homeController.getUpComingMatchs();
    return SizedBox(
      height: 325.h,
      child: Obx(() {
        _homeController.upComingMatchList;
        return _homeController.matchLoading.value
            ? const CustomLoader()
            : _homeController.upComingMatchList.isEmpty
                ? const Center(
                    child: CustomText(
                      text: "No data found!",
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _homeController.upComingMatchList.length,
                    itemBuilder: (context, index) {
                      var matchData = _homeController.upComingMatchList[index];
                      return Container(
                        margin: EdgeInsets.only(
                            left: index == 0
                                ? Dimensions.paddingSizeDefault.w
                                : 5.w,
                            right: index == 5 - 1
                                ? Dimensions.paddingSizeDefault.w
                                : 5.w),
                        width: 350.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Dimensions.radiusDefault.r),
                            color: AppColors.white),
                        child: CustomMatchesCard(
                          eventName: matchData.event,
                          matchName: matchData.matchName,
                          gender: matchData.gender,
                          date: matchData.matchDate,
                          image: "${matchData.image?.publicFileUrl}",
                          time: "${matchData.time}" ?? "",
                          prone: matchData.prone,
                          entryFree: "R ${matchData.fee} Per Entry",
                          buttonText: "Register",
                          onTap: () {
                            Get.toNamed(AppRoutes.registrationScreen,
                                parameters: {'matchId': '${matchData.id}'});
                          },
                        ),
                      );
                    },
                  );
      }),
    );
  }
}
