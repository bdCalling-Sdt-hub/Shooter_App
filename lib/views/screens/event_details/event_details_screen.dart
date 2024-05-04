import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shooter_app/controller/match_controller.dart';
import 'package:shooter_app/helper/time_format.dart';
import 'package:shooter_app/service/api_constant.dart';
import 'package:shooter_app/utils/app_images.dart';
import 'package:shooter_app/views/widgets/custom_loader.dart';
import 'package:shooter_app/views/widgets/custom_matches_card.dart';
import 'package:shooter_app/views/widgets/time_count_down.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_string.dart';
import '../../../utils/dimentions.dart';
import '../../widgets/custom_text.dart';

class EventDetailsScreen extends StatelessWidget {
  EventDetailsScreen({super.key});

  final MatchController _matchController = Get.put(MatchController());

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

      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w),
        child: ListView(
          children: [
            ///------------------------------even name----------------------------------->?
            CustomText(
              text: "${evensData.name}",
              fontWeight: FontWeight.w400,
              fontsize: 20.h,
              textAlign: TextAlign.start,
              bottom: 12.h,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.locationMarker,
                        height: 16.h,
                        width: 16.w,
                        color: AppColors.whiteB5B5B5,
                      ),
                      Flexible(
                        child: CustomText(
                          text: " ${evensData.location}",
                          color: AppColors.whiteE8E8E8,
                          fontsize: Dimensions.fontSizeDefault.h,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      ///---------------------calender icon----------------------->
                      SvgPicture.asset(
                        AppIcons.calander,
                        height: 16.h,
                        width: 16.w,
                        color: AppColors.whiteB5B5B5,
                      ),

                      ///----------------------------date text------------------------->
                      CustomText(
                        text:
                            " ${TimeFormatHelper.formatDate(evensData.startedDate)}",
                        color: AppColors.whiteE8E8E8,
                        fontsize: Dimensions.fontSizeDefault.h,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                )
              ],
            ),

            SizedBox(
              height: 12.h,
            ),

            ///---------------------------------image----------------------------->
            CachedNetworkImage(
              imageUrl:
                  "${ApiConstant.imageBaseUrl}/${evensData.image?.publicFileUrl}",
              width: 345.w,
              height: 180.h,
            ),

            SizedBox(
              height: 12.h,
            ),
            Row(
              children: [
                ///------------------------Started In: text------------------>
                CustomText(
                  text: "Started In: ",
                  color: AppColors.whiteE8E8E8,
                  fontsize: Dimensions.fontSizeDefault.h,
                  fontWeight: FontWeight.w400,
                ),

                ///------------------------time count down------------------>
                TimeCountDown(
                  dateLine: evensData.startedDate,
                  textColor: Colors.white,
                )
                // CustomText(
                //   text:" 20d : 14h : 24m",
                //   color: AppColors.white,
                //   fontsize: Dimensions.fontSizeDefault.h,
                //   fontWeight: FontWeight.w400,
                // ),
              ],
            ),

            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                ///------------------------Closing date: text------------------>
                CustomText(
                  text: "Closing date: ",
                  color: AppColors.whiteE8E8E8,
                  fontsize: Dimensions.fontSizeDefault.h,
                  fontWeight: FontWeight.w400,
                ),

                ///------------------------16 Aug 2024 text------------------>
                CustomText(
                  text:
                      " ${TimeFormatHelper.formatDate(evensData.closingDate)}",
                  color: AppColors.white,
                  fontsize: Dimensions.fontSizeDefault.h,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),

            //
            // ///------------------------Registration open text------------------>
            // CustomText(
            //   text:" 16 Aug 2024",
            //   color: AppColors.white,
            //   fontsize: Dimensions.fontSizeSmall.h,
            //   fontWeight: FontWeight.w400,
            //   textAlign: TextAlign.start,
            //   top: 8.h,
            //   bottom: 12.h,
            // ),
            //

            ///------------------------Description text------------------>
            CustomText(
              text: "Description",
              color: AppColors.white,
              fontsize: Dimensions.fontSizeLarge.h,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.start,
              top: 3.h,
            ),

            ///------------------------Description text------------------>
            SizedBox(
              // color: AppColors.backgroundColor,
              child: Html(
                shrinkWrap: true,
                data: evensData.description,
              ),
            ),

            Flexible(child: _matchSection()),

            SizedBox(height: 12.h)
          ],
        ),
      ),
    );
  }

  _matchSection() {
    return Column(
      children: [
        ///------------------------Matches text------------------>
        Align(
          alignment: Alignment.centerLeft,
          child: CustomText(
            text: "Matches",
            color: AppColors.white,
            fontsize: Dimensions.fontSizeLarge.h,
            fontWeight: FontWeight.w400,
            top: 8.h,
            bottom: 16.h,
          ),
        ),

        ///-----------------------------up coming match card----------------------->

        SizedBox(
          child: Obx(() {
            return _matchController.matchModel.isEmpty
                ? const CustomText(text: "No data found")
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _matchController.matchModel.length,
                    itemBuilder: (context, index) {
                      var match = _matchController.matchModel[index];
                      if (match.event == evensData.name) {
                        print("=============call here");
                        return Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: Container(
                            height: 330.h,
                            width: 350.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radiusDefault.r),
                                color: AppColors.white),
                            child: CustomMatchesCard(
                              date: DateTime.now(),
                              image: "${match.image?.publicFileUrl}",
                              time: match.time,
                              gender: match.gender,
                              matchName: match.matchName,
                              eventName: match.event,
                              prone: match.prone,
                              entryFree: "R ${match.fee} Per Entry",
                              buttonText: "Register",
                              onTap: () {
                                Get.toNamed(AppRoutes.registrationScreen,
                                    parameters: {
                                      'matchId': '${match.id}',
                                      'price': '${match.fee}',
                                      'matchName': '${match.matchName}'
                                    });
                              },
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox(); // Return an empty SizedBox if no match found
                      }
                    },
                  );
          }),
        ),
      ],
    );
  }
}
