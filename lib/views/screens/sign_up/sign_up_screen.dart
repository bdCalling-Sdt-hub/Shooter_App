import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shooter_app/utils/app_colors.dart';
import 'package:shooter_app/utils/app_images.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(



      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 152.h,),

          Image.asset(AppImages.appLogo,width: 144.w,height: 144.h,),


          CustomText(text: "Sign up to continue!",fontsize: 20.h,fontWeight: FontWeight.w400,color: AppColors.whiteE8E8E8,),
        ],
      ),
    );
  }
}
