import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shooter_app/controller/scores_controller.dart';
import 'package:shooter_app/utils/app_string.dart';
import '../../../../utils/app_colors.dart';
import '../../../widgets/custom_text.dart';

class ScoresScreen extends StatelessWidget {
  ScoresScreen({super.key});
  final ScoresController _scoresController = Get.put(ScoresController());

  @override
  Widget build(BuildContext context) {
    _scoresController.getScores('${Get.parameters['id']}');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: CustomText(
          text: AppString.scores,
          fontsize: 18.h,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24.h),
            //=====================> Table section <==============================
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: _TableSection(),
            )
          ],
        ),
      ),
    );
  }

  //=====================> Row Text <==============================
  _rowText(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 16.w),
      child: CustomText(
        text: title,
        fontsize: 13.h,
        maxline: 1,
      ),
    );
  }

  //=====================> Table method <==============================
  _TableSection() {
    return Obx(
      () => _scoresController.scoresLoading.value
          ? const Center(child: CustomText(text: "Match score coming soon"))
          : Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r)),
                    ),
                    child: Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          _rowText(AppString.clasS),SizedBox(width: 5.w),
                          _rowText(AppString.playerName),SizedBox(width: 25.w),
                          _rowText(AppString.club),SizedBox(width: 25.w),
                          _rowText(AppString.scores),
                        ],
                      ),
                    )),
                Table(
                  columnWidths: const {
                    0 : FractionColumnWidth(0.16),
                    1 : FractionColumnWidth(0.35),
                    2 : FractionColumnWidth(0.30),
                    3 : FractionColumnWidth(0.20),
                  },
                    border: TableBorder.all(color: Colors.black26),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: List.generate(
                        _scoresController.scoresModel.length, (index) {
                      var matchData = _scoresController.scoresModel[index];

                      print("=====================>.. $matchData");
                      return TableRow(
                          decoration: const BoxDecoration(
                            color: Color(0xff5B5455),
                          ),
                          children: [
                            _rowText("${matchData["Class"]}"),
                            _rowText("${matchData["Name"]}"),
                            _rowText("${matchData["Club"]}"),
                            _rowText("${matchData["Score"]}"),
                          ]);
                    })),
              ],
            ),
    );
  }
}
