import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shooter_app/routes/app_routes.dart';
import 'package:shooter_app/utils/app_string.dart';
import 'package:shooter_app/utils/dimentions.dart';
import 'package:shooter_app/views/widgets/custom_event_card.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';

import '../../../utils/app_colors.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: SizedBox(),
        title: CustomText(
          text: AppString.events,
          fontsize: Dimensions.fontSizeLarge,
          color: AppColors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 255.h,
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeDefault.w),
                child: CustomEventsCard(
                  image: "assets/images/upcomingmatchImage.png",
                  title: "EEUFEES SHOOTING RANGE",
                  location: "Carl Osburn (USA)",
                  date: "12 \n Dec",
                  startDate: "20d : 14h : 24m",
                  onTap: () {
                    Get.toNamed(AppRoutes.eventDetailsScreen,);
                  },
                ),
              ),
              SizedBox(
                height: 16.h,
              )
            ],
          );
        },
      ),
    );
  }
}
