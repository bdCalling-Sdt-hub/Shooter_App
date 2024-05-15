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
import '../../../utils/app_constants.dart';
import '../../widgets/custom_loader.dart';
import '../../widgets/genaral_error_screen.dart';
import '../../widgets/no_internet_screen.dart';

class EventsScreen extends StatefulWidget {
   EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
   final EventsController _eventsController = Get.put(EventsController());



   ScrollController _scrollController = ScrollController();

   @override
   void initState() {
     super.initState();
     _addScrollListener();
   }

   @override
   void dispose() {
     _scrollController.dispose();
     super.dispose();
   }

   void _addScrollListener() {
     _scrollController.addListener(() {
       if (_scrollController.position.pixels ==
           _scrollController.position.maxScrollExtent) {
         _eventsController.loadMore();
         print("load more true");
       }
     });
   }



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
       var eventsData =  _eventsController.evensLists.value;
       switch(_eventsController.rxRequestStatus.value){
         case Status.loading : return const CustomLoader();
         case Status.internetError : return NoInternetScreen(onTap: () { _eventsController.getEvents(); },);
         case Status.error : return GeneralErrorScreen(onTap: () { _eventsController.getEvents(); },);
         case Status.completed : return
           RefreshIndicator(
             onRefresh: ()async{
               await _eventsController.evensLists;
             },
             child: ListView.builder(
               physics: const AlwaysScrollableScrollPhysics(),
               controller: _scrollController,
               itemCount: eventsData.length+1,
               itemBuilder: (context, index) {

                 if(index < _eventsController.evensLists.length){
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
                           location: " ${events.location}",
                           eventDate: events.startedDate,
                           registerClosingDate: events.startedDate,
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
                 }else if(index >= _eventsController.totalResult){
                   return null;
                 }else{
                  return const CustomLoader();
                 }
               },
             ),
           );

       }
      }),
    );
  }
}
