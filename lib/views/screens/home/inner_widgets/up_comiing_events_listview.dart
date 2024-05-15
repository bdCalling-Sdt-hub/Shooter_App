import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shooter_app/utils/dimentions.dart';
import 'package:shooter_app/views/widgets/custom_loader.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';
import '../../../../controller/home_controller.dart';
import '../../../../routes/app_routes.dart';
import '../../../widgets/custom_event_card.dart';

class UpComingEventsListView extends StatelessWidget {
  UpComingEventsListView({super.key});

  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {

    _homeController.getUpComingEvents();
    return Obx(() {
      _homeController.upComingEvensList;
      return _homeController.eventLoading.value
          ? const CustomLoader()
          : _homeController.upComingEvensList.isEmpty
              ? const Center(
                  child: CustomText(
                  text: "No data found!",
                ))
              : ListView.builder(
                  // scrollDirection: Axis.horizontal,
                  itemCount:  _homeController.upComingEvensList.length,
                  itemBuilder: (context, index) {
                    var evensData = _homeController.upComingEvensList[index];
                    return Padding(
                      padding: EdgeInsets.only(
                          left:  Dimensions.paddingSizeDefault.w,
                          right: Dimensions.paddingSizeDefault.w),
                      child: CustomEventsCard(
                        image: '${evensData.image?.publicFileUrl}',
                        title: evensData.eventName,
                        location: evensData.location,
                        eventDate: evensData.eventDate,
                        registerClosingDate: evensData.closeDate,
                        onTap: () {
                          Get.toNamed(AppRoutes.eventDetailsScreen,
                              arguments: evensData);
                        },
                      ),
                    );
                  },
                );
    });
  }
}
