import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shooter_app/utils/app_icons.dart';
import 'package:shooter_app/utils/app_string.dart';
import 'package:shooter_app/utils/dimentions.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';

import '../../../utils/app_colors.dart';
import 'inner_widgets/homescreen_app_bar.dart';
import 'inner_widgets/up_coming_matches_listview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///-------------------------------app bar section-------------------------->

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20.h),
        child: ListView(
          children:  [


            ///-----------------app bar------------------------->
            const HomeScreenAppBar(),



            CustomText(
              textAlign: TextAlign.start,
              text: AppString.pickadate,
              fontsize: Dimensions.fontSizeExtraLarge.h,
              fontWeight: FontWeight.w400,
              color: AppColors.white,
              top: 31.h,
            ),





            CustomText(
              textAlign: TextAlign.start,
              text: AppString.upcomingMatches,
              fontsize: Dimensions.fontSizeExtraLarge.h,
              fontWeight: FontWeight.w400,
              color: AppColors.white,
              top: 31.h,
            ),





            UpComingMatchesListView()

          ],
        ),
      ),
    );
  }


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
}

