import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shooter_app/controller/events_controller.dart';
import 'package:shooter_app/utils/dimentions.dart';
import 'package:shooter_app/views/widgets/custom_button.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';

import '../../../../controller/home_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../widgets/custom_event_card.dart';

class UpComingEventsListView extends StatelessWidget {
   UpComingEventsListView({super.key});


   final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.h,
      child: Obx(() {
        return _homeController.upComingEvensList.isEmpty?const Center(child: Text("No data found!"),) :ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _homeController.upComingEvensList.length,
          itemBuilder: (context, index) {
            var evensData = _homeController.upComingEvensList[index];
            return  Padding(
              padding:  EdgeInsets.only(left:index==0?Dimensions.paddingSizeDefault.w:5.w ,right:index ==5-1?Dimensions.paddingSizeDefault.w:5.w ),
              child: CustomEventsCard(
                image: '${evensData.image.destination}/${evensData.image.filename}',
                title: evensData.name,
                location: evensData.location,
                date: evensData.closingDate,
                startDate: "${evensData.closingDate}",
                onTap: (){

                },
              ),
            );
          },
        );
      }),
    );
  }
}


