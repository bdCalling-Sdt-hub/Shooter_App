import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shooter_app/controller/change_password_controller.dart';
import 'package:shooter_app/utils/app_colors.dart';
import 'package:shooter_app/views/widgets/custom_text_field.dart';
import '../../../../routes/app_routes.dart';
import '../../../../service/api_client.dart';
import '../../../../service/api_constant.dart';
import '../../../../utils/app_constants.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimentions.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';

class ChangepasswordScreen extends StatelessWidget {
  ChangepasswordScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _currentPassController = TextEditingController();
  final _setNewPassController = TextEditingController();
  final _reEnterPassController = TextEditingController();
  final _changePassCtrl=Get.put(ChangePasswordController());


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
    return Obx(()=>
       Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomTextField(
            controller: _currentPassController,
            contenpaddingHorizontal: 12.w,
            contenpaddingVertical: 16.h,
            hintText: AppString.currentPassword,
           isPassword: true,
          ),
          SizedBox(height: 16.h),
          CustomTextField(
            controller: _setNewPassController,
            contenpaddingHorizontal: 12.w,
            contenpaddingVertical: 16.h,
            hintText: AppString.setnewPassword,
           isPassword: true,
          ),
          SizedBox(height: 16.h),
          CustomTextField(
            controller:_reEnterPassController,
            contenpaddingHorizontal: 12.w,
            contenpaddingVertical: 16.h,
            hintText: AppString.reenterPassword,
            isPassword: true,
            validator: (value){
              bool data = AppConstants.passwordValidator.hasMatch(value);
              if (value.isEmpty) {
                return "Please enter ${AppString.reenterPassword}";
              } else if (!data) {
                return "Insecure password detected.";
              }else if(_setNewPassController.text !=value){
                return "Password did not match.";
              }
              return null;
            },
          ),
          SizedBox(height: 16.h),
          _changePassCtrl.forgotLoading.value?const SizedBox(
            height: 15,
            width: 15,
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          ):
          GestureDetector(
            onTap: () {
             _changePassCtrl.forgotPassword("palash900202@gmail.com");
            },
            child: CustomText(
              text: AppString.forgotPass,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(height: 359.h),
          Obx(()=>
             CustomButton(
              title: AppString.updatePassword,
              titlecolor: Colors.white,
              loading: _changePassCtrl.changeLoading.value,
              onpress: (){
                if (_formKey.currentState!.validate()) {
                  _changePassCtrl.handleChangePassword(_currentPassController.text, _reEnterPassController.text);
                }
              },
            ),
          ),
          SizedBox(height: 69.h),
        ],
      ),
    );
  }


}
