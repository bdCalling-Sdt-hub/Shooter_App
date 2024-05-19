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
                          return CustomMatchesCard(
                             image: myCompletedData.eventDetails?.image?.publicFileUrl,
                             date: DateTime.now(),
                             time:  "${myCompletedData.eventDetails?.eventTime}",
                             onTap: (){
                               Get.toNamed(AppRoutes.scoresScreen, parameters: {
                                 'id' : '${myCompletedData.id}'
                               });
                             },
                            entryFree: "${myCompletedData.registrationStatus}",
                            buttonText: "see score",
                            eventName: "${myCompletedData.eventDetails?.eventName}",
                            matchName: '${myCompletedData.matchName}',
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
                                      registationComplete: "${events.eventRegisterStatus}",
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




