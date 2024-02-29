import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_string.dart';
import '../../../utils/dimentions.dart';
import '../../widgets/custom_matches_card.dart';
import '../../widgets/custom_text.dart';

class MyMatchesScreen extends StatefulWidget {
  MyMatchesScreen({Key? key});

  @override
  State<MyMatchesScreen> createState() => _MyMatchesScreenState();
}

class _MyMatchesScreenState extends State<MyMatchesScreen> {
  bool isComplete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///-----------------------------app bar----------------------------------->
      appBar: AppBar(

        ///---------------------------bace arrow--------------------------->
        leading: Padding(
          padding: EdgeInsets.all(20.r),
          child: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: SvgPicture.asset(
              "assets/icons/back_arrow.svg",
              width: 14.w,
              height: 14.h,
            ),
          ),
        ),
        centerTitle: true,
        title: CustomText(
          text: AppString.matches,
          fontsize: Dimensions.fontSizeLarge.h,
        ),
      ),

      ///-----------------------------------body-------------------->
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w),
        child: Column(
          children: [
            SizedBox(height: 24.h,),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius:
                      BorderRadius.circular(Dimensions.radiusDefault.r),
                  border: Border.all(color: AppColors.primaryColor)),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isComplete = true;
                        });
                      },

                      ///---------------------------up comming botton----------------------->
                      child: Container(
                        height: 44.h,
                        decoration: BoxDecoration(
                            color: isComplete
                                ? AppColors.primaryColor
                                : AppColors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.r),
                                topLeft: Radius.circular(8.r))),
                        child: Center(
                          child: CustomText(
                            text: AppString.upcoming,
                            fontsize: Dimensions.fontSizeLarge.h,
                            color: isComplete
                                ? AppColors.white
                                : AppColors.primaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isComplete = false;
                        });
                      },

                      ///---------------------------up complete botton----------------------->
                      child: Container(
                        height: 44.h,
                        decoration: BoxDecoration(
                            color: isComplete
                                ? AppColors.white
                                : AppColors.primaryColor,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(8.r),
                                topRight: Radius.circular(8.r))),
                        child: Center(
                          child: CustomText(
                            text: AppString.completed,
                            fontsize: Dimensions.fontSizeLarge.h,
                            color: isComplete
                                ? AppColors.primaryColor
                                : AppColors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Expanded(child: CommingAndCompleteCard(iscomplete: isComplete)),
          ],
        ),
      ),
    );
  }
}

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
                  height: 281.h,
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
                  height: 244.h,
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
                  height: 16.h,
                )
              ],
            );
          },
        );
  }
}
