import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shooter_app/utils/app_colors.dart';
import 'package:shooter_app/utils/app_icons.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimentions.dart';
import '../../../widgets/custom_text.dart';
import 'inner_widgets/line_chart.dart';


class MyScoresScreen extends StatefulWidget {
  const MyScoresScreen({super.key});

  @override
  State<MyScoresScreen> createState() => _MyScoresScreenState();
}

class _MyScoresScreenState extends State<MyScoresScreen> {
  var _pickDateController = TextEditingController();
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 24.h,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
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

                ///------------------------------date time pick from------------------->
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 140.w,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radiusDefault.r)),
                    child: TextField(
                      controller: _pickDateController,
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.h,vertical: 1.h),
                          hintText: "Feb 02-2024",
                          hintStyle: TextStyle(
                              fontSize: 12.h,
                              fontWeight: FontWeight.w400,
                              color: AppColors.whiteE8E8E8),
                          suffixIcon: IconButton(
                            onPressed: () {
                              _selectDate(context);
                            },
                            icon: SvgPicture.asset(
                              AppIcons.calander,
                              width: 12.w,
                              height: 12.h,
                              color: AppColors.white,
                              fit: BoxFit.contain,
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 16.h,
          ),

          ///---------------------table section----------------------------->
          isComplete
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: _TableSection(),
                )
              : LineChart(),
        ],
      ),
    );
  }

  ///--------------------------------calender------------------------------:>
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      print('Selected date: $pickedDate');
      // Do something with the selected date
    }
  }

  ///--------------------------row text-------------------------->
  _rowText(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.w),
      child: CustomText(
        text: title,
        maxline: 2,
      ),
    );
  }

  ///---------------------------------table section------------------------------->
  _TableSection() {
    return Column(
      children: [
        Table(
          border: TableBorder.all(color: Colors.black26),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.r),
                      topRight: Radius.circular(8.r)),
                ),
                children: [
                  _rowText(AppString.date),
                  _rowText(AppString.event),
                  _rowText(AppString.match),
                  _rowText(AppString.scores),
                ]),
            TableRow(
                decoration: const BoxDecoration(
                  color: Color(0xff5B5455),
                ),
                children: [
                  _rowText('01-03-2024'),
                  _rowText('Event 1'),
                  _rowText('Match 1'),
                  _rowText('596'),
                ]),
            TableRow(
                decoration: const BoxDecoration(
                  color: Color(0xff5B5455),
                ),
                children: [
                  _rowText('01-03-2024'),
                  _rowText('Event 1'),
                  _rowText('Match 1'),
                  _rowText('596'),
                ]),
            TableRow(
                decoration: const BoxDecoration(
                  color: Color(0xff5B5455),
                ),
                children: [
                  _rowText('01-03-2024'),
                  _rowText('Event 1'),
                  _rowText('Match 1'),
                  _rowText('596'),
                ]),
            TableRow(
                decoration: const BoxDecoration(
                  color: Color(0xff5B5455),
                ),
                children: [
                  _rowText('01-03-2024'),
                  _rowText('Event 1'),
                  _rowText('Match 1'),
                  _rowText('596'),
                ]),
            TableRow(
                decoration: const BoxDecoration(
                  color: Color(0xff5B5455),
                ),
                children: [
                  _rowText('01-03-2024'),
                  _rowText('Event 1'),
                  _rowText('Match 1'),
                  _rowText('596'),
                ]),
            TableRow(
                decoration: BoxDecoration(
                  color: const Color(0xff5B5455),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.r),
                      bottomRight: Radius.circular(8.r)),
                ),
                children: [
                  _rowText('01-03-2024'),
                  _rowText('Event 1'),
                  _rowText('Match 1'),
                  _rowText('596'),
                ]),
          ],
        )
      ],
    );
  }
}
