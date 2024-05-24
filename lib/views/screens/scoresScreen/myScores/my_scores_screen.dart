import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shooter_app/helper/time_format.dart';
import 'package:shooter_app/utils/app_colors.dart';
import 'package:shooter_app/utils/app_icons.dart';
import '../../../../controller/scores_controller.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimentions.dart';
import '../../../widgets/custom_loader.dart';
import '../../../widgets/custom_text.dart';
import 'inner_widgets/line_chart.dart';

class MyScoresScreen extends StatefulWidget {
  const MyScoresScreen({super.key});

  @override
  State<MyScoresScreen> createState() => _MyScoresScreenState();
}

class _MyScoresScreenState extends State<MyScoresScreen> {
  final ScoresController _scoresController = Get.put(ScoresController());
  bool isComplete = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: CustomText(
          text: 'My Scores',
          fontsize: 18.h,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24.h),
            // _TableSection(),
            Column(
              children: [
                ///---------------------------------two bottom------------------------------>
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

                          ///---------------------------Scores botton----------------------->
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
                                text: AppString.scores,
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

                          ///---------------------------Overview botton----------------------->
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
                                text: AppString.overview,
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
              ],
            ),

            ///---------------------table section----------------------------->
            isComplete
                ? _TableSection()
                : LineChart(
                    chartData: _scoresController.myScroesList,
                  ),
          ],
        ),
      ),
    );
  }

  ///--------------------------row text-------------------------->
  _rowText(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.w),
      child: CustomText(
        fontsize: 12.h,
        text: title,
        maxline: 2,
      ),
    );
  }

  ///---------------------------------table section------------------------------->

  _TableSection() {
    return Obx(
      () => _scoresController.myScroesList.value.isEmpty
          ? Container(
          height: 560.h,
            child: const Center(
                child: CustomText(
                  text: "No date found!",
                ),
              ),
          )
          : Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        _rowText(AppString.date),
                        _rowText(AppString.event),
                        _rowText(AppString.match),
                        _rowText(AppString.scores),
                      ],
                    )),
                Table(
                    border: TableBorder.all(color: Colors.black26),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: List.generate(
                        _scoresController.myScroesList.length, (index) {
                      var matchData = _scoresController.myScroesList[index];
                      print("===============>... $matchData");
                      return TableRow(
                          decoration: const BoxDecoration(
                            color: Color(0xff5B5455),
                          ),
                          children: [
                            _rowText(TimeFormatHelper.formatDate(
                                DateTime.parse('${matchData["matchDate"]}'))),
                            _rowText("${matchData["eventName"]}"),
                            _rowText("${matchData["matchName"]}"),
                            _rowText("${matchData["score"]}"),
                          ]);
                    })),
              ],
            ),
    );
  }
}
