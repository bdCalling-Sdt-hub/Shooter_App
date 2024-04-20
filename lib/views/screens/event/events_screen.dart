import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shooter_app/controller/events_controller.dart';
import 'package:shooter_app/routes/app_routes.dart';
import 'package:shooter_app/utils/app_string.dart';
import 'package:shooter_app/utils/dimentions.dart';
import 'package:shooter_app/views/widgets/custom_event_card.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';

import '../../../utils/app_colors.dart';

class EventsScreen extends StatelessWidget {
   EventsScreen({super.key});


   EventsController _eventsController = Get.put(EventsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const SizedBox(),
        title:
        CustomText(
          text: AppString.events,
          fontsize: Dimensions.fontSizeLarge,
          color: AppColors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
      body: Obx(() {
       var eventsData =  _eventsController.evensModel.value.data;
        return ListView.builder(
          itemCount: eventsData?.length,
          itemBuilder: (context, index) {
            var events = eventsData![index];
            return Column(
              children: [
                index == 0 ? SizedBox(height: 12.h,) : SizedBox(),
                Container(
                  height: 262.h,
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeDefault.w),
                  child: CustomEventsCard(
                    image: "assets/images/upcomingmatchImage.png",
                    title: "${events.name}",
                    location: "${events.location}",
                    date: "12 \n Dec",
                    startDate: '${events.closingDate}',
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
        );
      }),
    );
  }
}

