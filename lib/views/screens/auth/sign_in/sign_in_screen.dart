import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shooter_app/utils/app_images.dart';
import 'package:shooter_app/utils/app_string.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';
import 'package:shooter_app/views/widgets/custom_text_field.dart';
import 'inner_widgets/sign_in_from.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController _textEditingController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,

      ///-----------------------body sction--------------------------->
      body: Stack(
       // clipBehavior: Clip.none,
        children: [

          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: const AssetImage(AppImages.backgroundImg),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3),
                BlendMode.srcOver,
              ),
            )),
          ),
          SingleChildScrollView(

            child: Column(
              children: [
                SizedBox(
                  height: 138.h,
                ),

                ///-----------------------------logo image----------------------------------->
                Center(
                    child: Image.asset(
                      AppImages.appLogo,
                      width: 144.w,
                      height: 144.h,
                    )),


                ///---------------------------sign up to continue text------------------------>
                SizedBox(
                  height: 16.h,
                ),
                CustomText(
                    text: AppString.signInContinue, fontsize: 20.h, top: 16.h),

                SizedBox(
                  height: 66.h,
                ),
                ///----------------------all text field section------------------------------>
                SignInForm(formKey: _formKey),

              ],
            ),
          )
        ],
      ),
    );
  }
  _bgImage(BuildContext context) {
    return SizedBox(
      height:MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(AppImages.backgroundImg,fit: BoxFit.fill,),
    );
  }
}



