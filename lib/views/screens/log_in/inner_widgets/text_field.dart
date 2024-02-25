import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/dimentions.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';
import '../../log_in/log_in_screen.dart';

class TextFields extends StatelessWidget {
  TextFields({
    super.key,
  });

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.r),
            topRight: Radius.circular(40.r),
          ),
          gradient: LinearGradient(
            colors: [
              const Color(0xFFFA1131).withOpacity(0.12),
              const Color(0xFF130D13).withOpacity(1),
            ],
             stops: const [0.0, 2.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ///--------------------------Email------------------------------------>
              SizedBox(
                height: 56.h,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.borderColor))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 16.h,
              ),

              ///--------------------------Password------------------------------------>
              SizedBox(
                height: 56.h,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.borderColor)),
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(8.0.r),
                        child: SvgPicture.asset(
                          AppIcons.obscure_true,
                          width: 12.w,
                          height: 12.h,
                          fit: BoxFit.contain,
                        ),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your Password";
                    }
                    return null;
                  },
                ),
              ),

              ///---------------------------------------forgot password--------------------------------->
              Align(
                  alignment: Alignment.centerRight,
                  child: CustomText(
                    text: "Forgot Password?",
                    fontsize: 16.h,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColor,
                    top: 16.h,
                    bottom: 16.h,
                  )),

              ///-------------------------------------Log In botton------------------------------->
              CustomButton(
                color: AppColors.primaryColor,
                onpress: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const SignUpScreen()));
                },
                title: "Log In",
                titlecolor: Colors.white,
              ),

              ///--------------------------------or login with text--------------------------------->
              CustomText(
                text: "Or Login with",
                fontsize: Dimensions.fontSizeDefault.h,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteE8E8E8,
                top: 16.h,
                bottom: 16.h,
              ),

              ///---------------------------------------google and facebook image------------------------------------------------>
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                        color: AppColors.fieldColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radiusDefault),
                        border: Border.all(color: const Color(0xFFFD92A0))),
                    child: Center(
                        child: SvgPicture.asset(
                      AppIcons.google,
                      width: 24.w,
                      height: 24.h,
                    )),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                        color: AppColors.fieldColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radiusDefault),
                        border: Border.all(color: const Color(0xFFFD92A0))),
                    child: Center(
                        child: SvgPicture.asset(
                      AppIcons.facebook,
                      width: 24.w,
                      height: 24.h,
                    )),
                  )
                ],
              ),

              SizedBox(
                height: 21.h,
              ),

              ///------------------------------Don’t have an account? Sign up ------------------------>
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Don’t have an account? ',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: Dimensions.fontSizeDefault.h,
                        color: Colors.white,
                        fontFamily: "Aldrich",
                      ),
                    ),
                    TextSpan(
                      text: ' Sign up',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: Dimensions.fontSizeDefault.h,
                        color: AppColors.primaryColor,
                        fontFamily: "Aldrich",
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
// onPressed: () {
// if (_formKey.currentState.validate()) {
// // Form is valid, proceed with sign up logic
// // For demonstration, let's just print the entered values
// print('Email: ${_emailController.text}');
// print('Password: ${_passwordController.text}');
// // You can implement your sign-up logic here
// }
// },
