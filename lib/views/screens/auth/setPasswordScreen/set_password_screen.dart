import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shooter_app/views/widgets/custom_text_field.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimentions.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';

class SetPasswordScreen extends StatelessWidget {
  SetPasswordScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        backgroundColor: Colors.black,
        body: Stack(children: [
          //================================> Background Image and Back Arrow Section <=======================
          Opacity(
            opacity: 0.5,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.onboardingsBg),
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
                  text: AppString.setPassword,
                  fontWeight: FontWeight.w400,
                  fontsize: 18.h,
                  fontName: 'Aldrich',
                ),
                SizedBox(height: 12.h),
                CustomText(
                  text: AppString.yourEmail,
                  fontWeight: FontWeight.w400,
                  fontsize: 16.h,
                  fontName: 'Aldrich',
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
          hintText: AppString.setPassword,
          sufixicons: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(
              AppIcons.obscure_true,
              width: 12.h,
              height: 12.h,
              fit: BoxFit.contain,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter your password";
            }
            return null;
          },
        ),
        SizedBox(height: 16.h),
        CustomTextField(
          contenpaddingHorizontal: 12.w,
          contenpaddingVertical: 16.h,
          hintText: AppString.confirmPassword,
          sufixicons: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(
              AppIcons.obscure_true,
              width: 12.h,
              height: 12.h,
              fit: BoxFit.contain,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please Re-enter your password";
            }
            return null;
          },
        ),
        SizedBox(height: 44.h),
        CustomButton(
          color: AppColors.primaryColor,
          title: AppString.setPassword,
          titlecolor: Colors.white,
          onpress: () {
            if (_formKey.currentState!.validate()) {
              Get.toNamed(AppRoutes.signUpScreen);
            }
          },
        ),
        SizedBox(height: 248.h),
      ],
    );
  }
}
