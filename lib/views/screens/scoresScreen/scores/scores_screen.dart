import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shooter_app/utils/app_string.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/dimentions.dart';
import '../../../widgets/custom_text.dart';

class ScoresScreen extends StatelessWidget {
  const ScoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 24.h,
          ),
          //=====================> Table section <==============================
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: _TableSection(),
          )
        ],
      ),
    );
  }
  //=====================> Row Text <==============================
  _rowText(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 16.w),
      child: CustomText(
        text: title,
        maxline: 2,
      ),
    );
  }
  //=====================> Table method <==============================
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
                  _rowText(AppString.clasS),
                  _rowText(AppString.playerName),
                  _rowText(AppString.club),
                  _rowText(AppString.scores),
                ]),
            TableRow(
                decoration: const BoxDecoration(
                  color: Color(0xff5B5455),
                ),
                children: [
                  _rowText('A'),
                  _rowText('Arnold Bailie'),
                  _rowText('Linden'),
                  _rowText('596'),
                ]),
            TableRow(
                decoration: const BoxDecoration(
                  color: Color(0xff5B5455),
                ),
                children: [
                  _rowText('B'),
                  _rowText('Chantelle Botha '),
                  _rowText('Linden'),
                  _rowText('596'),
                ]),
            TableRow(
                decoration: const BoxDecoration(
                  color: Color(0xff5B5455),
                ),
                children: [
                  _rowText('C'),
                  _rowText('Isabella Cilliers'),
                  _rowText('Linden'),
                  _rowText('596'),
                ]),
            TableRow(
                decoration: const BoxDecoration(
                  color: Color(0xff5B5455),
                ),
                children: [
                  _rowText('D'),
                  _rowText('Bernard Laferla'),
                  _rowText('Linden'),
                  _rowText('596'),
                ]),
            TableRow(
                decoration: const BoxDecoration(
                  color: Color(0xff5B5455),
                ),
                children: [
                  _rowText('E'),
                  _rowText('Albert Louw'),
                  _rowText('Linden'),
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
                  _rowText('F'),
                  _rowText('Anita Dean'),
                  _rowText('Linden'),
                  _rowText('596'),
                ]),
          ],
        )
      ],
    );
  }
}
