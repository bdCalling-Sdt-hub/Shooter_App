import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shooter_app/utils/app_images.dart';
import 'package:shooter_app/views/widgets/custom_text_field.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimentions.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // extendBody: true,
        body: Stack(children: [
          //================================> Background Image and Back Arrow Section <=======================
          Opacity(
            opacity: 0.4,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.onboardingsBg),
                    fit: BoxFit.cover),
              ),
            ),
          ),

          Column(
            children: [
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
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeDefault),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 208.h,
                      ),
                      //================================> Body Strings Section <=======================
                      CustomText(
                        text: AppString.forgetPassword,
                        fontsize: 18.h,
                      ),
                      SizedBox(height: 12.h),
                      CustomText(
                        text: AppString.pleaseEnter,
                        fontsize: 16.h,
                      ),
                      SizedBox(height: 16.h),

                      //================================>TextFormField Method <=======================

                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            _formFieldSection(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ]));
  }

  //================================>TextFormField Section <=======================
  _formFieldSection() {
    return Column(
      children: [
        SizedBox(height: 16.h),
        CustomTextField(
          contenpaddingHorizontal: 12.w,
          contenpaddingVertical: 16.h,
          hintText: AppString.email,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter your email";
            }
            return null;
          },
        ),
        SizedBox(height: 44.h),
        CustomButton(
          title: AppString.sendOTP,
          titlecolor: Colors.white,
          onpress: () {
            if (_formKey.currentState!.validate()) {
              Get.toNamed(AppRoutes.verifyEmailScreen);
            }
          },
        ),
        SizedBox(height: 248.h),
      ],
    );
  }
}
