import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///-------------------------------app bar section-------------------------->

      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: ()async{
            _homeController.getAllData();
          },
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///-----------------app bar------------------------->
                    HomeScreenAppBar(),

                    ///----------------------------pick a date time text---------------------->
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
                      readOnly: true,
                      controller: _homeController.pickDateController,
                      contenpaddingHorizontal: 10,
                      contenpaddingVertical: 0,
                      hintText: "MM/DD/YYYY",
                      sufixicons: IconButton(
                          onPressed: () {
                            _homeController.selectDate(context);
                          },
                          icon: SvgPicture.asset(AppIcons.calander,width: 24.w,height: 24.h,)),
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
                       UpComingMatchesListView(),

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
                       UpComingEventsListView(),

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
      ),
    );
  }
}
