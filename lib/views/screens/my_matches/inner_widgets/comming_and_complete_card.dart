import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shooter_app/controller/my_event_controller.dart';
import 'package:shooter_app/views/widgets/custom_loader.dart';
import 'package:shooter_app/views/widgets/custom_matches_card.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';
import '../../../../controller/my_complete_match_controller.dart';
import '../../../../routes/app_routes.dart';
import '../../../widgets/custom_event_card.dart';

class CommingAndCompleteCard extends StatefulWidget {
  bool? iscomplete;

  CommingAndCompleteCard({super.key, this.iscomplete});

  @override
  State<CommingAndCompleteCard> createState() => _CommingAndCompleteCardState();
}

class _CommingAndCompleteCardState extends State<CommingAndCompleteCard> {
  final MyCompleteMatchController myUpcomingEvents = Get.put(MyCompleteMatchController());
  final MyUpComingEventsController _eventsController = Get.put(MyUpComingEventsController());

  final ScrollController _scrollController = ScrollController();

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
    return widget.iscomplete == false
        ?

        ///------------------------------complete match------------------------------->
        Obx(() {
            return myUpcomingEvents.myCompletMatchLoading.value
                ? const Center(child: CustomLoader())
                : myUpcomingEvents.myCompleteMatchModel.isEmpty
                    ? const Center(child: CustomText(text: 'No data found!'))
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: myUpcomingEvents.myCompleteMatchModel.length,
                        itemBuilder: (context, index) {
                          var myCompletedData = myUpcomingEvents.myCompleteMatchModel[index];
                          return
                            Container(
                              padding: EdgeInsets.only(left: 12.w),
                              margin: EdgeInsets.only(bottom: 12.h),
                              decoration: BoxDecoration(
                                  color: const Color(0xffB5B5B5).withOpacity(.30),
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: Container(
                                    height: 48.h,
                                    width: 48.h,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.red, width: 0.5),
                                        color: Colors.grey,
                                        shape: BoxShape.circle),
                                    child: Center(
                                        child: CustomText(
                                            text: '${index + 1}',
                                            color: const Color(0xffbacFA1131),
                                            fontsize: 16.h)),
                                  ),

                                  title: CustomText(
                                    text: "${myCompletedData.matchName}",
                                    textAlign: TextAlign.start,
                                  ),
                                  subtitle: CustomText(text: "${myCompletedData.description}", textAlign: TextAlign.start,fontsize: 10.h,)
                              ),
                            );
                        },
                      );
          })

        ///------------------------------upcoming event------------------------------->

        : Obx(() {
            return _eventsController.myEventsLoading.value
                ? const Center(child: CustomText(text: 'No data found!'))
                : _eventsController.myEvensLists.isEmpty
                    ? const Center(child: CustomText(text: 'No data found!'))
                    : RefreshIndicator(
                        onRefresh: () async {
                          await _eventsController.myEvensLists;
                        },
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          controller: _scrollController,
                          itemCount: _eventsController.myEvensLists.length + 1,
                          itemBuilder: (context, index) {
                            if (index < _eventsController.myEvensLists.length) {
                              var events = _eventsController.myEvensLists[index];
                              return Column(
                                children: [
                                  index == 0
                                      ? SizedBox(
                                          height: 12.h,
                                        )
                                      : const SizedBox(),
                                  Container(
                                    height: 300.h,
                                    child: CustomEventsCard(
                                      image: '${events.event?.image?.publicFileUrl}',
                                      title: events.event?.eventName,
                                      location: events.event?.location,
                                      eventDate: events.event?.eventDate,
                                      registerClosingDate: events.event?.closeDate,
                                      btnName: "Registration Completed",
                                      // events.closeDate,
                                      onTap: () {}
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  )
                                ],
                              );
                            } else if (index >= _eventsController.totalResult) {
                              return null;
                            } else {
                              return const CustomLoader();
                            }
                          },
                        ),
                      );
          });
  }
}




