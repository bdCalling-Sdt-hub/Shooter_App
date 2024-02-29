import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_string.dart';
import '../../../utils/dimentions.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _ageController = TextEditingController();
  final _clubNameController = TextEditingController();
  String groupValue = '';
  /*void _handleRadioValueChange(String value) {
    setState(() {
      groupValue = value;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: CustomText(
          text: AppString.registration,
          fontsize: 18.h,
        ),
        centerTitle: true,
      ),
      body: Padding(
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
    );
  }

  //================================>TextFormField Section <=======================
  _formFieldSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          controller: _nameController,
          contenpaddingHorizontal: 12.w,
          contenpaddingVertical: 16.h,
          hintText: AppString.fullName,
          /*validator: (value) {
            if (value == null || value.isEmpty) {
              return "please enter your full name";
            }
            return null;
          },*/
        ),
        SizedBox(height: 16.h),
        CustomTextField(
          controller: _emailController,
          contenpaddingHorizontal: 12.w,
          contenpaddingVertical: 16.h,
          hintText: AppString.email,
          /*validator: (value) {
            if (value == null || value.isEmpty) {
              return "please enter your email";
            }
            return null;
          },*/
        ),
        SizedBox(height: 16.h),
        CustomTextField(
          controller: _phoneNumberController,
          contenpaddingHorizontal: 12.w,
          contenpaddingVertical: 16.h,
          hintText: AppString.phoneNumber,
          /* validator: (value) {
            if (value == null || value.isEmpty) {
              return "please enter your phone number";
            }
            return null;
          },*/
        ),
        SizedBox(height: 16.h),
        CustomText(text: AppString.gender),
//======================================>   Radio  Button Section <==============================
        Row(
          children: [
            Radio(
                value: AppString.male,
                activeColor: AppColors.primaryColor,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                  });
                }),
            CustomText(
              text: AppString.male,
              fontsize: 16.h,
            ),
            SizedBox(width: 16.w),
            Radio(
                value: AppString.female,
                activeColor: AppColors.primaryColor,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value!;
                  });
                }),
            CustomText(
              text: AppString.female,
              fontsize: 16.h,
            ),
          ],
        ),
        SizedBox(height: 16.h),
        CustomTextField(
          controller: _ageController,
          contenpaddingHorizontal: 12.w,
          contenpaddingVertical: 16.h,
          hintText: AppString.age,
          /*validator: (value) {
            if (value == null || value.isEmpty) {
              return "please enter your age";
            }
            return null;
          },*/
        ),
        SizedBox(height: 16.h),
        CustomTextField(
          controller: _clubNameController,
          contenpaddingHorizontal: 12.w,
          contenpaddingVertical: 16.h,
          hintText: AppString.clubName,
          /* validator: (value) {
            if (value == null || value.isEmpty) {
              return "please enter your club name";
            }
            return null;
          },*/
        ),
        SizedBox(height: 174.h),
        CustomButton(
          title: AppString.makePayment,
          titlecolor: Colors.white,
          onpress: () {
            //Get.toNamed(AppRoutes.getOtpSceeen);
            /*if (_formKey.currentState!.validate()) {
              Get.toNamed(AppRoutes.getOtpSceee n);
            }*/
          },
        ),
      ],
    );
  }
}
