import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shooter_app/utils/dimentions.dart';
import 'package:shooter_app/views/widgets/custom_button.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../widgets/custom_event_card.dart';

class UpComingEventsListView extends StatelessWidget {
  const UpComingEventsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return  Padding(
            padding:  EdgeInsets.only(left:index==0?Dimensions.paddingSizeDefault.w:5.w ,right:index ==5-1?Dimensions.paddingSizeDefault.w:5.w ),
            child: CustomEventsCard(
              image:"assets/images/upcomingmatchImage.png",
              title: "EEUFEES SHOOTING RANGE",
              location: "Carl Osburn (USA)",
              // date: D,
              // startDate: "20d : 14h : 24m",
              onTap: (){

              },
            ),
          );
        },
      ),
    );
  }
}


