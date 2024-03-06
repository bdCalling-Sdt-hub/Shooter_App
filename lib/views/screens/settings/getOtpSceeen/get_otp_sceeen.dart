import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shooter_app/views/widgets/pin_code_text_field.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimentions.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';


class GetOtpSceeen extends StatelessWidget {
  const GetOtpSceeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: CustomText(
          text: AppString.verifyEmail,
          fontsize: 18.h,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeDefault),
        child: Column(
          children: [
            //================================> Body Strings Section <=======================
            CustomText(
              text: AppString.weHaveSent,
              fontsize: 16.h,
            ),
            SizedBox(height: 16.h),
            //================================> PinCodeField Section <=======================
            const CustomPinCodeTextField(),
            SizedBox(height: 16.h),
            Row(
              children: [
                CustomText(
                  text: AppString.didntGet,
                  fontsize: 16.h,
                ),
                const Spacer(),
                CustomText(
                  color: AppColors.primaryColor,
                  text: AppString.resend,
                  fontsize: 16.h,
                ),
              ],
            ),
            const Spacer(),
            //================================> VerifyEmail Button <=======================
            CustomButton(
              title: AppString.verify,
              onpress: () {
                Get.toNamed(AppRoutes.setnewpasswordScreen);
              },
            ),
            SizedBox(height: 69.h),
          ],
        ),
      ),
    );
  }
}
