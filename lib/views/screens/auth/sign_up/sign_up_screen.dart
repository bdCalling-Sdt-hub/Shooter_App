import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shooter_app/utils/app_colors.dart';
import 'package:shooter_app/utils/app_images.dart';
import 'package:shooter_app/utils/app_string.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';

import 'inner_widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,

      ///-----------------------body sction--------------------------->
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: const AssetImage(AppImages.backgroundImg),
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3),
                      BlendMode.srcOver,
                    ))),

          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 152.h,
                ),

                ///-----------------------------logo image----------------------------------->
                Center(
                    child: Image.asset(
                      AppImages.appLogo,
                      width: 144.w,
                      height: 144.h,
                    )),

                ///---------------------------sign up to continue text------------------------>
                CustomText(
                  text: AppString.signUpContinue,
                  fontsize: 20.h,
                  top: 16.h,
                ),
                SizedBox(
                  height: 113.h,
                ),


                ///----------------------all text field section------------------------------>
                SignUpForm()
              ],
            ),
          )
        ],
      ),
    );
  }
}
