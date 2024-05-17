// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import '../../../utils/app_colors.dart';
// import '../../../utils/app_string.dart';
// import '../../../utils/dimentions.dart';
// import '../../widgets/custom_matches_card.dart';
// import '../../widgets/custom_text.dart';
// import 'inner_widgets/comming_and_complete_card.dart';
//
// class MyMatchesScreen extends StatefulWidget {
//   MyMatchesScreen({Key? key});
//
//   @override
//   State<MyMatchesScreen> createState() => _MyMatchesScreenState();
// }
//
// class _MyMatchesScreenState extends State<MyMatchesScreen> {
//   bool isComplete = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       ///-----------------------------app bar----------------------------------->
//       appBar: AppBar(
//         centerTitle: true,
//         title: CustomText(
//           text: 'My Matches',
//           fontsize: Dimensions.fontSizeLarge.h,
//         ),
//       ),
//
//       ///-----------------------------------body-------------------->
//       body: Padding(
//         padding:
//             EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w),
//         child: Column(
//           children: [
//             SizedBox(height: 24.h,),
//             Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                   color: Colors.red,
//                   borderRadius:
//                       BorderRadius.circular(Dimensions.radiusDefault.r),
//                   border: Border.all(color: AppColors.primaryColor)),
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 1,
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           isComplete = true;
//                         });
//                       },
//
//                       ///---------------------------up coming botton----------------------->
//                       child: Container(
//                         height: 44.h,
//                         decoration: BoxDecoration(
//                             color: isComplete
//                                 ? AppColors.primaryColor
//                                 : AppColors.white,
//                             borderRadius: BorderRadius.only(
//                                 bottomLeft: Radius.circular(8.r),
//                                 topLeft: Radius.circular(8.r))),
//                         child: Center(
//                           child: CustomText(
//                             text: AppString.upcoming,
//                             fontsize: Dimensions.fontSizeLarge.h,
//                             color: isComplete
//                                 ? AppColors.white
//                                 : AppColors.primaryColor,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 1,
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           isComplete = false;
//                         });
//                       },
//
//                       ///--------------------------- complete botton----------------------->
//                       child: Container(
//                         height: 44.h,
//                         decoration: BoxDecoration(
//                             color: isComplete
//                                 ? AppColors.white
//                                 : AppColors.primaryColor,
//                             borderRadius: BorderRadius.only(
//                                 bottomRight: Radius.circular(8.r),
//                                 topRight: Radius.circular(8.r))),
//                         child: Center(
//                           child: CustomText(
//                             text: AppString.completed,
//                             fontsize: Dimensions.fontSizeLarge.h,
//                             color: isComplete
//                                 ? AppColors.primaryColor
//                                 : AppColors.white,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 24.h,
//             ),
//             Expanded(child: CommingAndCompleteCard(iscomplete: isComplete)),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
