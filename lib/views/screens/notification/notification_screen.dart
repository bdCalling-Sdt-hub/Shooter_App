import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shooter_app/controller/notification_controller.dart';
import 'package:shooter_app/views/widgets/custom_loader.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_string.dart';
import '../../../utils/dimentions.dart';
import '../../widgets/custom_text.dart';
import 'package:timeago/timeago.dart' as TimeAgo;

class NotificationScreen extends StatefulWidget {
   NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotificationController _notificationController = Get.put(NotificationController());


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
        _notificationController.loadMore();
        print("load more true");
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///-----------------------------------app bar section-------------------------->
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          textAlign: TextAlign.start,
          text: AppString.notification,
          fontsize: Dimensions.fontSizeExtraLarge.h,
          fontWeight: FontWeight.w400,
          color: AppColors.white,
        ),
      ),

      ///-----------------------------------body section-------------------------->
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 15),
        child: Column(
          children: [

            ///-----------------------notification------------------------>

            Expanded(
              child: Obx(()=>
              _notificationController.notificationLoading.value ? const CustomLoader() :
                  _notificationController.notificationsList.isEmpty ? const CustomText(text: "No notifications yet",) :
                RefreshIndicator(
                  onRefresh: ()async{
                    _notificationController.notificationsList.refresh();
                  },
                  child: ListView.builder(
                    controller: _scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: _notificationController.notificationsList.length+1,
                    itemBuilder: (context, index) {

                      if(index < _notificationController.notificationsList.length){
                        var notifications = _notificationController.notificationsList[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: _Notification('${notifications.message}' , notifications.createdAt!),
                        );
                      }else if(index >= _notificationController.totalResult){
                        return null;
                      }else{
                       return const CustomLoader();
                      }

                    },
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  _Notification(String title, DateTime time) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 10.h,
                width: 10.w,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.red),
              ),
              Container(
                margin: EdgeInsets.only(left: 8.w, right: 7.w),
                padding: EdgeInsets.all(7.r),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xffFFE7EA)),
                child: SvgPicture.asset(
                  AppIcons.bell_icon,
                  color: AppColors.primaryColor,
                ),
              )
            ],
          ),
          Expanded(
            // Expanded widget to allow the text to take up available space
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: Dimensions.fontSizeLarge.h,
                      color: AppColors.white,
                      fontFamily: "Aldrich",
                      height: 1.5),
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    top: 2.h,

                    text: TimeAgo.format(time),
                    fontsize: Dimensions.fontSizeSmall.h,
                    fontWeight: FontWeight.w400,
                    color: const Color(
                      0xFF8C8C8C,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
