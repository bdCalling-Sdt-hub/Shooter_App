import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shooter_app/controller/my_match_controller.dart';
import 'package:shooter_app/service/api_constant.dart';
import 'package:shooter_app/views/widgets/custom_loader.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';

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
            return _matchController.myCompletedMatchLoading.value
                ? const Center(child: CustomLoader())
                : _matchController.myCompletedMatchModel.isEmpty
                    ? const Center(child: CustomText(text: 'No data found!'))
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount:
                            _matchController.myCompletedMatchModel.length,
                        itemBuilder: (context, index) {
                          var myCompletedData =
                              _matchController.myCompletedMatchModel[index];
                          return Column(
                            children: [
                              Container(
                                height: 297.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radiusDefault.r),
                                    color: AppColors.white),
                                child: CustomMatchesCard(
                                  date: myCompletedData.match?.matchDate,
                                  image:"${myCompletedData.match?.image?.publicFileUrl}",
                                  matchName: myCompletedData.match?.matchName,
                                  eventName: myCompletedData.match?.event,
                                  time: "${myCompletedData.match?.time}",
                                  gender: myCompletedData.gender,
                                  prone: "${myCompletedData.match?.prone}",
                                  buttonText: "See scores",
                                  onTap: () {
                                    Get.toNamed(AppRoutes.scoresScreen);
                                  },
                                ),
                              ),
                              SizedBox(height: 16.h)
                            ],
                          );
                        },
                      );
          })

        ///------------------------------upcoming match------------------------------->

        : Obx(() {
            return _matchController.myMatchLoading.value
                ? const Center(child: CustomLoader())
                : _matchController.myCompletedMatchModel.isEmpty
                    ? const Center(child: CustomText(text: 'No data found!'))
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: _matchController.myMatchModel.length,
                        itemBuilder: (context, index) {
                          var myMatchData =
                              _matchController.myMatchModel[index];
                          return Column(
                            children: [
                              Container(
                                height: 269.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radiusDefault.r),
                                    color: AppColors.white),
                                child: CustomMatchesCard(
                                  date: myMatchData.match?.matchDate,
                                  image: '${myMatchData.match?.image?.publicFileUrl}',
                                  matchName: '${myMatchData.match?.matchName}',
                                  eventName: '${myMatchData.match?.event}',
                                  time: "${myMatchData.match?.time}",
                                  gender: myMatchData.gender,
                                  prone: '${myMatchData.match?.prone}',
                                  entryFree:
                                      myMatchData.match?.registrationStatus,
                                  onTap: () {},
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
