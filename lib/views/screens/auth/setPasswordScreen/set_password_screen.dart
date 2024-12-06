import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shooter_app/controller/auth_controller.dart';
import 'package:shooter_app/views/widgets/custom_text_field.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_constants.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimentions.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';

class SetPasswordScreen extends StatelessWidget {
  SetPasswordScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _setPassController = TextEditingController();
  final _confirmPassController = TextEditingController();
  final _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(children: [
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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeDefault),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //================================> Body Strings Section <=======================
                  SizedBox(height: 284.h),
                  CustomText(
                    text: AppString.setPassword,
                    fontsize: 18.h,
                  ),
                  SizedBox(height: 12.h),
                  CustomText(
                    text: AppString.yourEmail,
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
        ]));
  }

  //================================>TextFormField Section <=======================
  _formFieldSection() {
    return Column(
      children: [
        SizedBox(height: 16.h),
        CustomTextField(
          controller: _setPassController,
          contenpaddingHorizontal: 12.w,
          contenpaddingVertical: 16.h,
          hintText: AppString.setPassword,
          isPassword: true,
        ),
        SizedBox(height: 16.h),
        CustomTextField(
          controller: _confirmPassController,
          contenpaddingHorizontal: 12.w,
          contenpaddingVertical: 16.h,
          hintText: AppString.confirmPassword,
          isPassword: true,
          validator: (value){
            bool data = AppConstants.passwordValidator.hasMatch(value);
            if (value.isEmpty) {
              return "Please enter ${AppString.confirmPassword}";
            } else if (!data) {
              return "Insecure password detected.";
            }else if(_setPassController.text != value){
                return "Password did not match.";
            }
            return null;
          },
        ),
        SizedBox(height: 44.h),
        Obx(()=>
           CustomButton(
             loading: _authController.setPasswordLoading.value,
            title: AppString.setPassword,
            onpress: () {
              if (_formKey.currentState!.validate()) {
                _authController.setPassword(
                    Get.arguments, _confirmPassController.text);
              }
            },
          ),
        ),
        SizedBox(height: 200.h),
      ],
    );
  }
}
