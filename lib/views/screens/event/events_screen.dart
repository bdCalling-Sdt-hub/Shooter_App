import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shooter_app/controller/events_controller.dart';
import 'package:shooter_app/routes/app_routes.dart';
import 'package:shooter_app/service/api_constant.dart';
import 'package:shooter_app/utils/app_string.dart';
import 'package:shooter_app/utils/dimentions.dart';
import 'package:shooter_app/views/widgets/custom_event_card.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../widgets/custom_loader.dart';
import '../../widgets/genaral_error_screen.dart';
import '../../widgets/no_internet_screen.dart';

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
       var eventsData =  _eventsController.evensModel.value;
       switch(_eventsController.rxRequestStatus.value){
         case Status.loading : return const CustomLoader();
         case Status.internetError : return NoInternetScreen(onTap: () { _eventsController.getEvents(); },);
         case Status.error : return GeneralErrorScreen(onTap: () { _eventsController.getEvents(); },);
         case Status.completed : return
           ListView.builder(
             itemCount: eventsData.length,
             itemBuilder: (context, index) {
               var events = eventsData[index];
               return Column(
                 children: [
                   index == 0 ? SizedBox(height: 12.h,) : const SizedBox(),
                   Container(
                     height: 262.h,
                     padding: EdgeInsets.symmetric(
                         horizontal: Dimensions.paddingSizeDefault.w),
                     child: CustomEventsCard(
                       image: "${events.image?.publicFileUrl}",
                       title: "${events.name}",
                       location: "${events.location}",
                       date: events.closingDate,
                       startDate: '${events.closingDate}',
                       onTap: () {
                         Get.toNamed(AppRoutes.eventDetailsScreen, arguments : events);
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

       }
      }),
    );
  }
}
