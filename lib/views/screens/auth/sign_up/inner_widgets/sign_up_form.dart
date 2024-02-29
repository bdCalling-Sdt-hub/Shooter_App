import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:shooter_app/routes/app_routes.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/dimentions.dart';

import '../../../../widgets/custom_button.dart';


class SignUpForm extends StatelessWidget {
  SignUpForm({
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

              SizedBox(
                // height: 56.h,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "User name",
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.borderColor))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                ),
              ),


              SizedBox(height: 16.h),

              ///--------------------------Email------------------------------------>
              SizedBox(
                // height: 56.h,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.borderColor))),
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
                // height: 56.h,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.borderColor)),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: SvgPicture.asset(
                          AppIcons.obscure_true,
                          width: 12.h,
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



              ///------------------------------------By creating an account, I accept the Terms & conditions and Privacy Policy text----------------->

              _ByCreating(),


              ///------------------------------------botton------------------------------>
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                onpress: () {
                  if(_formKey.currentState!.validate()){
                    Get.toNamed(AppRoutes.signInScreen);
                  }
                },
                title: "Sign Up",
                titlecolor: Colors.white,
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
                      text: 'Already have an account? ',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: Dimensions.fontSizeDefault.h,
                        color: Colors.white,
                        fontFamily: "Aldrich",
                      ),
                    ),
                    TextSpan(
                      text: 'Log In',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: Dimensions.fontSizeDefault.h,
                        color: AppColors.primaryColor,
                        fontFamily: "Aldrich",
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = (){
                     Get.toNamed(AppRoutes.signInScreen);
                    }
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}



_ByCreating(){
  return     Row(
    children: [
      SvgPicture.asset(AppIcons.check_box,height: 20.h,width: 20.w,),
      Padding(
        padding: EdgeInsets.only(top: 16.h),
        child: FittedBox(
          fit: BoxFit.cover,
          child: RichText(
            text: TextSpan(
              style:  TextStyle(
                fontSize: 14.0.h,
                height: 1.5,
                color: Colors.black,
                overflow: TextOverflow.ellipsis,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '   By creating an account, I accept the \n',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: Dimensions.fontSizeDefault.h,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.white,
                    fontFamily: "Aldrich",
                  ),
                ),
                TextSpan(
                  text: '   Terms & conditions',
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
                  text: 'Privacy Policy',
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
        ),
      ),
    ],
  );
}




