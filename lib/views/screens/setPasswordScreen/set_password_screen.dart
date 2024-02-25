import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_string.dart';
import '../../../utils/dimentions.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';

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
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeDefault),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                //================================>TextFormField Section <=======================

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),

                      SizedBox(
                        height: 56.h,
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: AppString.setPassword,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.borderColor))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your password";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),

                      SizedBox(
                        height: 56.h,
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: AppString.confirmPassword,
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.borderColor)),
                              suffixIcon: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: SvgPicture.asset(
                                  AppIcons.obscure_true,
                                  width: 12.h,
                                  height: 12.h,
                                  fit: BoxFit.contain,
                                ),
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Re-enter your Password";
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox(height: 44.h),
                      //================================> SetPassword Button <=======================
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
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
