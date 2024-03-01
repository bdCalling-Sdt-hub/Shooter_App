import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shooter_app/utils/app_colors.dart';
import 'package:shooter_app/utils/app_images.dart';
import 'package:shooter_app/utils/app_string.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';
import 'inner_widgets/sign_in_from.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,

      ///-----------------------body sction--------------------------->
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: const AssetImage(AppImages.backgroundImg),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.srcOver,
          ),
        )),
        child: Column(
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
                text: AppString.signInContinue, fontsize: 20.h, top: 16.h),

            const Spacer(),

            ///----------------------all text field section------------------------------>
            SignInForm(formKey: _formKey)
          ],
        ),
      ),
    );
  }
}
