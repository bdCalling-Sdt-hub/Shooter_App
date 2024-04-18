import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shooter_app/controller/change_password_controller.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_constants.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimentions.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_text_field.dart';

class SetnewpasswordScreen extends StatelessWidget {
  SetnewpasswordScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _setPassController = TextEditingController();
  final _confirmPassController = TextEditingController();
  final _changePassCtrl = Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: CustomText(
          text: AppString.setPassword,
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
              CustomText(
                text: AppString.yourEmail,
              ),
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
          controller: _setPassController,
          contenpaddingHorizontal: 12.w,
          contenpaddingVertical: 16.h,
          hintText: AppString.setPassword,
          isPassword: true,
        ),
        SizedBox(height: 16.h),
        CustomTextField(
          controller: _confirmPassController,
          contenpaddingHorizontal: 12.w,
          contenpaddingVertical: 16.h,
          hintText: AppString.confirmPassword,
          isPassword: true,
          validator: (value) {
            bool data = AppConstants.passwordValidator.hasMatch(value);
            if (value.isEmpty) {
              return "Please enter ${AppString.confirmPassword}";
            } else if (!data) {
              return "Insecure password detected.";
            } else if (_setPassController.text != value) {
              return "Password did not match.";
            }
            return null;
          },
        ),
        SizedBox(height: 16.h),
        SizedBox(height: 399.h),
        Obx(()=>
           CustomButton(
            title: AppString.setPassword,
            loading: _changePassCtrl.setPasswordLoading.value,
            titlecolor: Colors.white,
            onpress: () {
              if (_formKey.currentState!.validate()) {
                _changePassCtrl.setPassword(Get.arguments, _confirmPassController.text);
              }
            },
          ),
        ),
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
