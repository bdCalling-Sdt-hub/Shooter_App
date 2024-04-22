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

class MatchesScreen extends StatelessWidget {
   MatchesScreen({super.key});

  final MatchController _matchController = Get.put(MatchController());

     final ScrollController _scrollController = ScrollController();



  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _matchController.loadMore();
        print("load more true");
      }
    });
    print("======> match controller ${_matchController.matchModel.runtimeType}");
    return Scaffold(



      appBar: AppBar(
        leading: const SizedBox(),
        centerTitle: true,
        title: CustomText(text: AppString.matches,fontsize: Dimensions.fontSizeLarge,color: AppColors.white,fontWeight: FontWeight.w400,),
      ),




      body: Obx(() {
        var matchData = _matchController.matchModel.value;
        switch(_matchController.rxRequestStatus.value){
          case Status.loading : return const CustomLoader();
          case Status.internetError : return NoInternetScreen(onTap: () { _matchController.getMatchs(); },);
          case Status.error : return GeneralErrorScreen(onTap: () { _matchController.getMatchs(); },);
          case Status.completed : return Padding(
              padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w),
              child:  ListView.builder(
                controller: _scrollController,
                itemCount: matchData.length+1,
                itemBuilder: (context, index) {


                  if(index < matchData.length){
                    var match = matchData[index];
                    return Column(
                      children: [
                        index == 0? SizedBox(height: 24.h,) : const SizedBox(),
                        Container(
                          height: 316.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radiusDefault.r),
                              color: AppColors.white
                          ),
                          child: CustomMatchesCard(
                            gender: match.gender,
                            date : match.matchDate,
                            image : "${match.image?.publicFileUrl}",
                            time : "${match.time}",
                            positions: "3x20 Shots \nProne,standing & kneeling ",
                            description: "(First 200 of prone to count for 3P)",
                            entryFree: "R ${match.fee} Per Entry",
                            buttonText: "Register",
                            onTap: (){Get.toNamed(AppRoutes.registrationScreen, parameters: {'matchId' : "${match.id}"});},
                          ),
                        ),


                        SizedBox(height: 16.h,)
                      ],
                    );
                  }else if(index >= _matchController.totalResult){
                  return  null;
                } else{
                    return const CustomLoader();
                  }


                },
              )
          );
        }
      }),

    );
  }
}



