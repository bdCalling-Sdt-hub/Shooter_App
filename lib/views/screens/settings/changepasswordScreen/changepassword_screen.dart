import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shooter_app/utils/app_colors.dart';
import 'package:shooter_app/views/widgets/custom_text_field.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimentions.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';

class ChangepasswordScreen extends StatelessWidget {
  ChangepasswordScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _currentPassController = TextEditingController();
  final _setPassController = TextEditingController();
  final _newPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: CustomText(
          text: AppString.changePassword,
          fontsize: 18.h,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeDefault),
          child: Column(
            children: [
              SizedBox(height: 24.h),
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
    );
  }

  //================================>TextFormField Section <=======================
  _formFieldSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomTextField(
          controller: _currentPassController,
          contenpaddingHorizontal: 12.w,
          contenpaddingVertical: 16.h,
          hintText: AppString.currentPassword,
          sufixicons: _sufixIcon(AppIcons.obscure_true),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "please enter your current password";
            }
            return null;
          },
        ),
        SizedBox(height: 16.h),
        CustomTextField(
          controller: _setPassController,
          contenpaddingHorizontal: 12.w,
          contenpaddingVertical: 16.h,
          hintText: AppString.setPassword,
          sufixicons: _sufixIcon(AppIcons.obscure_true),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "please set new password";
            }
            return null;
          },
        ),
        SizedBox(height: 16.h),
        CustomTextField(
          controller: _newPassController,
          contenpaddingHorizontal: 12.w,
          contenpaddingVertical: 16.h,
          hintText: AppString.setnewPassword,
          sufixicons: _sufixIcon(AppIcons.obscure_true),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "please re-enter new password";
            }
            return null;
          },
        ),
        SizedBox(height: 16.h),
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.forgetPasswordScreen);
          },
          child: CustomText(
            text: AppString.forgotPass,
            color: AppColors.primaryColor,
          ),
        ),
        SizedBox(height: 359.h),
        CustomButton(
          title: AppString.updatePassword,
          titlecolor: Colors.white,
          onpress: () {
            if (_formKey.currentState!.validate()) {
              Get.toNamed(AppRoutes.getOtpSceeen);
            }
          },
        ),
        SizedBox(height: 69.h),
      ],
    );
  }

  _sufixIcon(String icon) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SvgPicture.asset(
        icon,
        width: 12.h,
        height: 12.h,
        fit: BoxFit.contain,
      ),
    );
  }
}
