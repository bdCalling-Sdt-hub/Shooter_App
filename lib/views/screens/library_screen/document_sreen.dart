import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/dimentions.dart';
import '../../widgets/custom_text.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const CustomText(text: "Documents"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeDefault.w,
            vertical: Dimensions.paddingSizeDefault.h),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: CustomText(
                      text: "Sagor Ahamed",
                      fontsize: 12.h,
                      textAlign: TextAlign.start,
                    ),
                    subtitle: CustomText(
                      text: " developer",
                      fontsize: 9.h,
                      textAlign: TextAlign.start,
                    ),
                    trailing: Container(
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
                    leading: Image.network(
                      "https://www.oxfordwebstudio.com/user/pages/06.da-li-znate/sta-je-pdf/sta-je-pdf.jpg",
                      height: 42.h,
                      width: 33.w,
                      fit: BoxFit.cover,
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
