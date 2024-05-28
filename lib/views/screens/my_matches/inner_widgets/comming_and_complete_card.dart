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
  final MyCompleteMatchController myCompleteMatch = Get.put(MyCompleteMatchController());
  final MyUpComingEventsController _myUpComingEventsController = Get.put(MyUpComingEventsController());
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
        _myUpComingEventsController.loadMore();
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
            return  myCompleteMatch.myCompleteMatchModel.isEmpty
                    ? const Center(child: CustomText(text: 'No data found!'))
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: myCompleteMatch.myCompleteMatchModel.length,
                        itemBuilder: (context, index) {
                          var myCompletedData = myCompleteMatch.myCompleteMatchModel[index];
                          return Padding(
                            padding:  EdgeInsets.only(bottom: 16.h),
                            child: CustomMatchesCard(
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
                            ),
                          );

                        },
                      );
          })

        ///------------------------------upcoming event------------------------------->

        : Obx(() {
            return _myUpComingEventsController.myEventsLoading.value
                ? const Center(child: CustomText(text: 'No data found'))
                : _myUpComingEventsController.myEvensLists.isEmpty
                    ? const Center(child: CustomText(text: 'No data found!'))
                    : RefreshIndicator(
                        onRefresh: () async {
                          await _myUpComingEventsController.myEvensLists;
                        },
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          controller: _scrollController,
                          itemCount: _myUpComingEventsController.myEvensLists.length + 1,
                          itemBuilder: (context, index) {
                            if (index < _myUpComingEventsController.myEvensLists.length) {
                              var events = _myUpComingEventsController.myEvensLists[index];
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
                            } else if (index >= _myUpComingEventsController.totalResult) {
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




