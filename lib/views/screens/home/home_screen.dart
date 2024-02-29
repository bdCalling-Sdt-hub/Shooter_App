import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shooter_app/controller/home_controller.dart';
import 'package:shooter_app/utils/app_icons.dart';
import 'package:shooter_app/utils/app_string.dart';
import 'package:shooter_app/utils/dimentions.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';
import 'package:shooter_app/views/widgets/custom_text_field.dart';
import '../../../utils/app_colors.dart';
import 'inner_widgets/homescreen_app_bar.dart';
import 'inner_widgets/up_comiing_events_listview.dart';
import 'inner_widgets/up_coming_matches_listview.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final _pickDateController = TextEditingController();

  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///-------------------------------app bar section-------------------------->

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///-----------------app bar------------------------->
                  HomeScreenAppBar(),

                  ///----------------------------picka date time text---------------------->
                  CustomText(
                    textAlign: TextAlign.start,
                    text: AppString.pickadate,
                    fontsize: Dimensions.fontSizeExtraLarge.h,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                    top: 20.h,
                    bottom: 12.h,
                  ),

                  ///-------------------------date time form------------------------>
                  CustomTextField(
                    controller: _pickDateController,
                    contenpaddingHorizontal: 10,
                    contenpaddingVertical: 0,
                    hintText: "02/20/2024",
                    sufixicons: IconButton(
                        onPressed: () {
                          _selectDate(context);
                        },
                        icon: SvgPicture.asset(AppIcons.calander)),
                  ),

                  SizedBox(
                    height: 10.h,
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///------------------------up Coming Matches text-------------------->
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: CustomText(
                        textAlign: TextAlign.start,
                        text: AppString.upcomingMatches,
                        fontsize: Dimensions.fontSizeExtraLarge.h,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                        bottom: 16.h,
                        top: 10.h,
                      ),
                    ),
                    const UpComingMatchesListView(),

                    ///------------------------up Coming Matches text-------------------->
                    Container(
                      margin: EdgeInsets.only(left: 20.w),
                      child: CustomText(
                        textAlign: TextAlign.start,
                        text: AppString.upcomingEvents,
                        fontsize: Dimensions.fontSizeExtraLarge.h,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white,
                        top: 20.h,
                        bottom: 12.h,
                      ),
                    ),

                    ///------------------------up Coming Events text-------------------->
                    const UpComingEventsListView(),

                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
            )
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
