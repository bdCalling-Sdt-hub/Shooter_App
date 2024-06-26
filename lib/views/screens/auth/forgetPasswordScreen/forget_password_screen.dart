 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shooter_app/controller/auth_controller.dart';
import 'package:shooter_app/utils/app_images.dart';
import 'package:shooter_app/views/widgets/custom_text_field.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimentions.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  final _authController = Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // extendBody: true,
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
                        child: _formFieldSection(),
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
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          contenpaddingHorizontal: 12.w,
          contenpaddingVertical: 16.h,
          hintText: AppString.email,
         isEmail: true,
        ),
        SizedBox(height: 44.h),
        Obx(()=>
           CustomButton(
            title: AppString.sendOTP,
            loading: _authController.forgotLoading.value,
            titlecolor: Colors.white,
            onpress: () {
              if (_formKey.currentState!.validate()) {
                _authController.forgotPassword(_emailController.text.trim());
              }
            },
          ),
        ),
        SizedBox(height: 248.h),
      ],
    );
  }
}
