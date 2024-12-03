import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shooter_app/controller/auth_controller.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimentions.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/pin_code_text_field.dart';


class VerifyEmailScreen extends StatelessWidget {
   VerifyEmailScreen({super.key});

  final TextEditingController pinCodeCtrl=TextEditingController();

  final _authController = Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          //================================> Background Image and Back Arrow Section <=======================
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
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    alignment: Alignment.centerLeft,
                    icon: const Icon(Icons.arrow_back),
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
                  text: AppString.verifyEmail,
                  fontsize: 20.h,
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: AppString.weHaveSent,
                  fontsize: 16.h,
                ),
                SizedBox(height: 16.h),
                //================================> PinCodeField Section <=======================
                 CustomPinCodeTextField(
                  textEditingController:pinCodeCtrl,
                ),
                SizedBox(height: 16.h),
                Obx(()=>
                   Row(
                    children: [
                      CustomText(
                        text: AppString.didntGet,
                        fontsize: 16.h,
                      ),
                      const Spacer(),
                      _authController.resendOtpLoading.value?const SizedBox(height: 15,width: 15,child: CircularProgressIndicator(color: Colors.red,),):
                      InkWell(
                        onTap: (){
                          _authController.resendOtp(Get.parameters['email']!);
                          pinCodeCtrl.clear();
                        },
                        child: CustomText(
                          color: AppColors.primaryColor,
                          text: AppString.resend,
                          decoration: TextDecoration.underline,
                          fontsize: 16.h,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 44.h),
                //================================> VerifyEmail Button <=======================
                Obx(()=>
                   CustomButton(
                     loading: _authController.verifyLoading.value,
                     title: AppString.verifyEmail,
                     onpress: () {
                      _authController.verifyEmail(Get.parameters, pinCodeCtrl.text);
                      pinCodeCtrl.clear();
                    },
                  ),
                ),
                SizedBox(height: 248.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
