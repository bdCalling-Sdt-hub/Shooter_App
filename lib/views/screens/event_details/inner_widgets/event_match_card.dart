//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:shooter_app/routes/app_routes.dart';
//
// import '../../../../utils/app_colors.dart';
// import '../../../../utils/app_icons.dart';
// import '../../../../utils/dimentions.dart';
// import '../../../widgets/custom_button.dart';
// import '../../../widgets/custom_text.dart';
//
// class EventMatchCard extends StatelessWidget {
//
//   final String? date;
//   final String? image;
//   final String? time;
//   final String? firstDetail;
//   final String? meter;
//   final String? score;
//   final String? peepAndTelescope;
//   final String? entryFree;
//   final String? buttonText;
//
//   EventMatchCard({
//     this.date,
//     this.image,
//     this.time,
//     this.peepAndTelescope,
//     this.meter,
//     this.entryFree,
//     this.firstDetail,
//     this.score,
//     this.buttonText});
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           margin: EdgeInsets.all(12.r),
//
//           child: Stack(
//             children: [
//
//               ///---------------------------------image and date comtainer---------------------->
//               Container(
//                   clipBehavior: Clip.antiAlias,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(Dimensions.radiusDefault.r),
//                   ),
//                   child: Image.asset("$image",height: 115.h, width:  321.w,fit: BoxFit.fill,)),
//               Positioned(
//                 top: 8.h,
//                 left: 8.w,
//                 child: Container(
//                   padding: EdgeInsets.all(8.r),
//                   decoration: BoxDecoration(
//                       color: AppColors.white,
//                       borderRadius: BorderRadius.circular(4.r)
//                   ),
//                   child: CustomText(
//                     text: "$date",
//                     color: AppColors.primaryColor,
//                     fontsize: 10.h,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//
//         Container(
//           margin: EdgeInsets.only(left: 12.w, right: 12, top: 8.h),
//           child: Column(
//             children: [
//               ///-----------------------meter text---------------------->
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   CustomText(
//                     text: "$meter",
//                     color: AppColors.backgroundColor,
//                     fontsize: Dimensions.fontSizeDefault.h,
//                     fontWeight: FontWeight.w400,
//                   ),
//                   Row(
//                     children: [
//
//                       Container(
//                           margin: EdgeInsets.only(bottom: 5.h,right: 5),
//                           child: SvgPicture.asset(AppIcons.clock,width: 12.w,height: 15.h,)),
//
//
//                       ///---------------------time text----------------------><
//                       CustomText(
//                         text: "$time",
//                         color: AppColors.backgroundColor,
//                         fontsize: Dimensions.fontSizeDefault,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//
//               ///---------------------------------Male : genderText------------------------------>
//               Align(
//                   alignment: Alignment.centerLeft,
//                   child: CustomText(
//                     text: "$firstDetail",
//                     color: AppColors.backgroundColor,
//                     fontsize: Dimensions.fontSizeSmall.h,
//                     fontWeight: FontWeight.w400,
//                     top: 5.h,
//                   )),
//
//               ///---------------------------------score  text------------------------------>
//               Align(
//                   alignment: Alignment.centerLeft,
//                   child: CustomText(
//                     text: "$score",
//                     color: AppColors.backgroundColor,
//                     fontsize: Dimensions.fontSizeSmall.h,
//                     fontWeight: FontWeight.w400,
//                     top: 5.h,
//                   )),
//
//
//               peepAndTelescope == null ? SizedBox(height: 30.h,) :    Align(
//                 alignment: Alignment.centerLeft,
//                 child: CustomText(
//                   text: "$peepAndTelescope",
//                   color: const Color(0xFF414141),
//                   fontsize: Dimensions.fontSizeExtraSmall.h,
//                   fontWeight: FontWeight.w400,
//                   top: 8.h,
//                   bottom: 12.h,
//                 ),
//               ),
//
//               ///-----------------------amount ---------------------->
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   CustomText(
//                     text: "Registration fee :",
//                     color: AppColors.backgroundColor,
//                     fontsize: Dimensions.fontSizeSmall.h,
//                     fontWeight: FontWeight.w400,
//                   ),
//                   CustomText(
//                     text: "$entryFree",
//                     color: AppColors.backgroundColor,
//                     fontsize: Dimensions.fontSizeSmall.h,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ],
//               ),
//
//               SizedBox(height: 12.h,),
//
//               ///---------------------------botton----------------------------------->
//               CustomButton(title: "$buttonText",height:40.h,fontSize: 12.h, onpress:(){Get.toNamed(AppRoutes.registrationScreen);}, titlecolor: AppColors.white),
//
//
//               SizedBox(height: 12.h,)
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
//
