import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimentions.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';

class SubscriptionScreen extends StatefulWidget {
  SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  List  subsCriptionData = [
    {
      'duration': '6',
      'price': '1200',
    },
    {
      'duration': '12',
      'price': '1200',
    },
  ];

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    print("===========================================================>selected index $selectedIndex");
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        backgroundColor: Colors.black,
        body: Stack(children: [
          //================================> Background Image and Close Icon Section <=======================
          Opacity(
            opacity: 0.3,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.backgroundImg),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 34.h),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    alignment: Alignment.centerLeft,
                    icon: Icon(
                      Icons.close,
                      color: AppColors.primaryColor,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeDefault),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //================================> Body Strings Section <=======================

                 const Spacer(),
                CustomText(
                  text: AppString.youHave,
                  fontsize: 16.sp,
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: AppString.pleaseBuy,
                  maxline: 2,
                  fontsize: 24.sp,
                ),
                SizedBox(height: 35.h),

               Center(
                 child: SizedBox(
                      height: 140.h,
                      child: ListView.builder(
                             physics: const NeverScrollableScrollPhysics(),
                             scrollDirection: Axis.horizontal,
                              itemCount: subsCriptionData.length,
                              itemBuilder: (context, index) {
                               var data = subsCriptionData[index];
                                return Padding(
                                  padding:  EdgeInsets.only(right: subsCriptionData[index] == 1 ? 0 : 10.w),
                                  child: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                    child: SubscriptionCard(
                                      duration: data['duration'],
                                      price: data['price'],
                                      isSelected:index == selectedIndex,
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
               ),

                SizedBox(height: 45.h),
                //================================> Purchase Subscription Button Section <=======================
                CustomButton(
                  title: AppString.purchaseSubscription,
                  onpress: () {
                    //Get.toNamed(AppRoutes.signUpScreen);
                  },
                ),
                SizedBox(height: 94.h),
              ],
            ),
          ),
        ]));
  }
}

class SubscriptionCard extends StatelessWidget {
  final String? duration;
  final String? price;
  final bool isSelected;
  final VoidCallback? onTap;

  const SubscriptionCard({
    super.key,
    this.duration,
    this.price,
    required  this.isSelected,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColors.fieldColor,
            border: Border.all(width: 1.w, color: isSelected ?  AppColors.primaryColor : Colors.black )),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
          child: Column(
            children: [
              CustomText(text: '$duration Months', fontsize: 14.h),
              SizedBox(height: 12.h),
              CustomText(text: "Rand $price/Month", fontsize: 16.h),
              SizedBox(height: 12.h),
              CustomText(
                text: AppString.days10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
