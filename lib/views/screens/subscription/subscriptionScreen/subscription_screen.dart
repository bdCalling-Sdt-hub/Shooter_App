// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:shooter_app/controller/registration_controller.dart';
// import 'package:shooter_app/controller/subscription_controller.dart';
// import 'package:shooter_app/views/widgets/custom_loader.dart';
// import '../../../../utils/app_colors.dart';
// import '../../../../utils/app_images.dart';
// import '../../../../utils/app_string.dart';
// import '../../../../utils/dimentions.dart';
// import '../../../widgets/custom_button.dart';
// import '../../../widgets/custom_text.dart';
//
// class SubscriptionScreen extends StatefulWidget {
//   const SubscriptionScreen({super.key});
//
//   @override
//   State<SubscriptionScreen> createState() => _SubscriptionScreenState();
// }
//
// class _SubscriptionScreenState extends State<SubscriptionScreen> {
//   final SubscriptionController _subscriptionController =
//       Get.put(SubscriptionController());
//   final RegistrationController _registrationController =
//       Get.put(RegistrationController());
//   DateTime now = DateTime.now();
//   String startDate = '${DateTime.now()}';
//
//   String? entDate;
//
//   @override
//   Widget build(BuildContext context) {
//     if (_subscriptionController.selectedIndex.value == 0) {
//       _subscriptionController.subscriptionName.value = 'standard';
//       entDate = "${now.add(const Duration(days: 180))}";
//     } else {
//       _subscriptionController.subscriptionName.value = 'premium';
//       entDate = "${now.add(const Duration(days: 360))}";
//     }
//
//     print(
//         "===>selected index ${_subscriptionController.selectedIndex.value} and ${_subscriptionController.subscriptionName.value}");
//
//     print("now $now and endDate ${now.add(Duration(days: 10))}");
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         extendBody: true,
//         backgroundColor: Colors.black,
//         body: Stack(children: [
//           //================================> Background Image and Close Icon Section <=======================
//           Opacity(
//             opacity: 0.3,
//             child: Container(
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage(AppImages.backgroundImg),
//                     fit: BoxFit.cover),
//               ),
//             ),
//           ),
//           // Padding(
//           //   padding: EdgeInsets.symmetric(horizontal: 5.w),
//           //   child: Column(
//           //     mainAxisAlignment: MainAxisAlignment.start,
//           //     children: [
//           //       SizedBox(height: 34.h),
//           //       Align(
//           //         alignment: Alignment.topRight,
//           //         child: IconButton(
//           //           alignment: Alignment.centerLeft,
//           //           icon: Icon(
//           //             Icons.close,
//           //             color: AppColors.primaryColor,
//           //           ),
//           //           onPressed: () {
//           //             Get.back();
//           //           },
//           //         ),
//           //       ),
//           //     ],
//           //   ),
//           // ),
//           Padding(
//             padding: const EdgeInsets.symmetric(
//                 horizontal: Dimensions.paddingSizeDefault),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 //================================> Body Strings Section <=======================
//
//                 const Spacer(),
//                 CustomText(
//                   text: AppString.youHave,
//                   fontsize: 16.sp,
//                 ),
//                 SizedBox(height: 12.h),
//                 CustomText(
//                   text: AppString.pleaseBuy,
//                   maxline: 2,
//                   fontsize: 24.sp,
//                 ),
//                 SizedBox(height: 35.h),
//
//                 Obx(() {
//                   return Center(
//                     child: SizedBox(
//                       height: 140.h,
//                       child: _subscriptionController.subscriptionLoading.value
//                           ? CustomLoader()
//                           : Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: List.generate(
//                                   _subscriptionController
//                                       .subsCriptionData.length, (index) {
//                                 var data = _subscriptionController
//                                     .subsCriptionData[index];
//                                 return GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       _subscriptionController
//                                           .selectedIndex.value = index;
//                                     });
//                                   },
//                                   child: SubscriptionCard(
//                                     description: data.description??"",
//                                     name: data.name??"",
//                                     duration: '${data.duration}',
//                                     price: '${data.price}',
//                                     isSelected: index ==
//                                         _subscriptionController
//                                             .selectedIndex.value,
//                                   ),
//                                 );
//                               }),
//                             ),
//                     ),
//                   );
//                 }),
//
//                 SizedBox(height: 45.h),
//                 //================================> Purchase Subscription Button Section <=======================
//                 Obx(
//                   () => CustomButton(
//                     title: AppString.purchaseSubscription,
//                     loading: _subscriptionController.submitFormLoading.value,
//                     onpress: () {
//                       _subscriptionController.submitForm(
//                           context,
//                           '${_subscriptionController.subsCriptionData[_subscriptionController.selectedIndex.value].price}',
//                           '${_subscriptionController.subsCriptionData[_subscriptionController.selectedIndex.value].type}',
//                           startDate,
//                           entDate);
//                       // _subscriptionController.buySubscription(startDate, entDate);
//                       //Get.toNamed(AppRoutes.signUpScreen);
//                       print(
//                           "===================>${_subscriptionController.subsCriptionData[_subscriptionController.selectedIndex.value].type}");
//                       print(
//                           "===================>${_subscriptionController.subsCriptionData[_subscriptionController.selectedIndex.value].price}");
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 94.h),
//               ],
//             ),
//           ),
//         ]));
//   }
// }
//
// class SubscriptionCard extends StatelessWidget {
//   final String? duration;
//   final String? price;
//   final String name;
//   final String description;
//   final bool isSelected;
//   final VoidCallback? onTap;
//
//   const SubscriptionCard(
//       {super.key,
//       this.duration,
//       this.price,
//       required this.description,
//       required this.name,
//       required this.isSelected,
//       this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12.r),
//             color: AppColors.fieldColor,
//             border: Border.all(
//                 width: 1.w,
//                 color: isSelected ? AppColors.primaryColor : Colors.white38)),
//         child: Center(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CustomText(text: '$duration Months', fontsize: 14.h),
//                 SizedBox(height: 12.h),
//                 CustomText(text: "Rand $price/$description", fontsize: 16.h),
//                 SizedBox(height: 12.h),
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
