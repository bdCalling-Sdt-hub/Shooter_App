import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:shooter_app/controller/auth_controller.dart';
import 'package:shooter_app/routes/app_routes.dart';
import 'package:shooter_app/utils/app_string.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/dimentions.dart';

import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_text_field.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({
    super.key,
  });

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _authController = Get.put(AuthController());

  var isCheck = false.obs;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      opacity: 0.1,
      blur: 10,
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(40.r), topLeft: Radius.circular(42.r)),
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeDefault,
            vertical: Dimensions.paddingSizeDefault),
        decoration: BoxDecoration(
          border: Border(
              top: BorderSide(width: 2.w, color: AppColors.primaryColor)),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.r),
            topRight: Radius.circular(40.r),
          ),
          gradient: LinearGradient(
            colors: [
              const Color(0xFFFA1131).withOpacity(.12),
              const Color(0xFF130D13).withOpacity(1),
            ],
            stops: const [0.0, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ///--------------------------user name------------------------------------>

              CustomTextField(
                controller: _authController.userNameController,
                contenpaddingHorizontal: 12.w,
                contenpaddingVertical: 16.h,
                hintText: AppString.userName,
                filColor: AppColors.fieldColor,
              ),

              SizedBox(height: 16.h),

              ///--------------------------Email------------------------------------>
              CustomTextField(
                controller: _authController.emailSignupCtrl,
                contenpaddingHorizontal: 12.w,
                contenpaddingVertical: 16.h,
                hintText: AppString.email,
                filColor: AppColors.fieldColor,
                isEmail: true,
              ),

              SizedBox(height: 16.h),

              ///--------------------------Password------------------------------------>
              CustomTextField(
                controller: _authController.passSignupCtrl,
                contenpaddingHorizontal: 12.w,
                contenpaddingVertical: 16.h,
                hintText: AppString.password,
                filColor: AppColors.fieldColor,
                isPassword: true,
              ),

              ///------------------------------------By creating an account, I accept the Terms & conditions and Privacy Policy text----------------->
              SizedBox(
                height: 15.h,
              ),
              _byCreating(),

              ///------------------------------------botton------------------------------>
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                onpress: () {
                  if(isCheck.value){
                    if (_formKey.currentState!.validate()) {
                      Get.offAllNamed(AppRoutes.bottomNavBar);
                    }
                  }
                },
                title: AppString.signUp,
              ),

              SizedBox(
                height: 20.h,
              ),

              ///------------------------------Already have an account? ------------------------>
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: AppString.alreadyHave,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: Dimensions.fontSizeDefault.h,
                        color: Colors.white,
                        fontFamily: "Aldrich",
                      ),
                    ),
                    TextSpan(
                        text: AppString.logIn,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: Dimensions.fontSizeDefault.h,
                          color: AppColors.primaryColor,
                          fontFamily: "Aldrich",
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.back();
                          }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _byCreating() {
    return Obx(() => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCheckbox(
                value: isCheck.value,
                onChanged: (value) {
                  isCheck.value = value!;
                }),
            Expanded(
                child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 14.0.h,
                  color: Colors.black,
                  overflow: TextOverflow.ellipsis,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: AppString.byCreating,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: Dimensions.fontSizeDefault.h,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.white,
                      fontFamily: "Aldrich",
                    ),
                  ),
                  TextSpan(
                    text: AppString.termsConditionsS,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis,
                      fontSize: Dimensions.fontSizeDefault.h,
                      color: AppColors.primaryColor,
                      fontFamily: "Aldrich",
                    ),
                  ),
                  TextSpan(
                    text: ' and ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: Dimensions.fontSizeDefault.h,
                      color: Colors.white,
                      fontFamily: "Aldrich",
                    ),
                  ),
                  TextSpan(
                    text: AppString.privacyPolicyS,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: Dimensions.fontSizeDefault.h,
                      color: AppColors.primaryColor,
                      fontFamily: "Aldrich",
                    ),
                  ),
                ],
              ),
              //    // ),
            ))
          ],
        ));
  }
}

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onChanged != null) {
          onChanged!(!value);
        }
      },
      child: Container(
        width: 18.0, // Adjust size as needed
        height: 18.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: value ? AppColors.primaryColor : Colors.transparent,
          border: Border.all(width: 2.0, color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: value
            ? const Icon(
                Icons.check,
                size: 15.0,
                color: Colors.black,
              )
            : null,
      ),
    );
  }
}
