import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shooter_app/controller/match_controller.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/app_string.dart';
import '../../../utils/dimentions.dart';
import '../../widgets/custom_loader.dart';
import '../../widgets/custom_matches_card.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/genaral_error_screen.dart';
import '../../widgets/no_internet_screen.dart';

class MatchesScreen extends StatefulWidget {
  MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  final MatchController _matchController = Get.put(MatchController());

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
        _matchController.loadMore();
        print("load more true");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        centerTitle: true,
        title: CustomText(
          text: AppString.matches,
          fontsize: Dimensions.fontSizeLarge,
          color: AppColors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
      body: Obx(() {
        var matchData = _matchController.matchModel.value;
        switch (_matchController.rxRequestStatus.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return NoInternetScreen(
              onTap: () {
                _matchController.getMatchs();
              },
            );
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                _matchController.getMatchs();
              },
            );
          case Status.completed:
            return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeDefault.w),
                child: RefreshIndicator(
                  onRefresh: () async {
                    await _matchController.getMatchs();
                  },
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: _matchController.matchModel.length + 1,
                    itemBuilder: (context, index) {
                      if (index < _matchController.matchModel.length) {
                        var match = _matchController.matchModel[index];
                        return Column(
                          children: [
                            index == 0
                                ? SizedBox(
                                    height: 24.h,
                                  )
                                : const SizedBox(),
                            Container(
                              height: 330.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radiusDefault.r),
                                  color: AppColors.white),
                              child: CustomMatchesCard(
                                gender: match.gender,
                                date: match.matchDate,
                                image: "${match.image?.publicFileUrl}",
                                time: "${match.time}",
                                eventName: match.event,
                                matchName: match.matchName,
                                prone: match.prone,
                                entryFree: "R ${match.fee} Per Entry",
                                buttonText: "Register",
                                onTap: () {
                                  Get.toNamed(AppRoutes.registrationScreen,
                                      parameters: {
                                        'matchId': "${match.id}",
                                        'price': '${match.fee}',
                                        'matchName' : '${ match.matchName}'
                                      });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            )
                          ],
                        );
                      } else if (index >= _matchController.totalResult) {
                        return null;
                      } else {
                        return const CustomLoader();
                      }
                    },
                  ),
                ));
        }
      }),
    );
  }
}
