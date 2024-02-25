import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:shooter_app/utils/app_colors.dart';
import 'package:shooter_app/utils/app_images.dart';
import 'package:shooter_app/utils/dimentions.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';

import 'inner_widgets/text_field_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///-----------------------body sction--------------------------->
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/sign_up_bgImage.png"),
        )),
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
              text: "Sign up to continue!",
              fontsize: 20.h,
              fontWeight: FontWeight.w400,
              color: AppColors.whiteE8E8E8,
              top: 16.h,
              bottom: 66.h,
            ),

            Spacer(),

            ///----------------------all text field section------------------------------>
            TextFieldWidget()
          ],
        ),
      ),
    );
  }
}
