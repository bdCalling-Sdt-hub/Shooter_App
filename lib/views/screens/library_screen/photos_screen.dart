import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shooter_app/utils/app_colors.dart';
import 'package:shooter_app/utils/dimentions.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';

import '../../../utils/app_icons.dart';

class PhotosScreen extends StatelessWidget {
  const PhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const CustomText(text: "Photos"),centerTitle: true,),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeDefault.w,
            vertical: Dimensions.paddingSizeDefault.h),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                    childAspectRatio: 0.901),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: GridTile(
                      footer: Container(
                        color: const Color(0xffFFE7EA).withOpacity(.20),
                        child: Padding(
                          padding: EdgeInsets.all(5.r),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                    text: "12.12.2024",
                                    fontsize: 10.h,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xffFA1131)),
                                CustomText(
                                    text: "SHOOTING RANGE",
                                    fontsize: 12.h,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white)
                              ],
                            ),
                          ),
                        ),
                      ),
                      child:  Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                          "https://assets-global.website-files.com/654366841809b5be271c8358/659efd7c0732620f1ac6a1d6_why_flutter_is_the_future_of_app_development%20(1).webp",
                        ),fit: BoxFit.cover)),

                        child:  Center(
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(color: AppColors.primaryColor)
                              ),
                              child: Padding(
                                padding:  EdgeInsets.all(8.r),
                                child: SvgPicture.asset(AppIcons.downloadIcon,color: AppColors.primaryColor),
                              )),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
