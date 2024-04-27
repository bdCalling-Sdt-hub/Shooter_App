import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../controller/registration_controller.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/app_string.dart';
import '../../../utils/dimentions.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field.dart';
import '../payment/flutter_local_web_view.dart';
import 'package:http/http.dart' as http;

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final RegistrationController registrationController = Get.put(RegistrationController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  /*void _handleRadioValueChange(String value) {
    setState(() {
      groupValue = value;
    });
  }*/

  AppConstants appConstants = AppConstants();

  var parameter = Get.parameters;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: CustomText(
          text: AppString.registration,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          controller: registrationController.nameController,
          contenpaddingHorizontal: 12.w,
          contenpaddingVertical: 16.h,
          hintText: AppString.fullName,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "please enter your full name";
            }
            return null;
          },
        ),
        SizedBox(height: 16.h),
        CustomTextField(
          controller: registrationController.emailController,
          keyboardType: TextInputType.emailAddress,
          contenpaddingHorizontal: 12.w,
          contenpaddingVertical: 16.h,
          hintText: AppString.email,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "please enter your email";
            }
            return null;
          },
        ),
        SizedBox(height: 16.h),
        CustomTextField(
          keyboardType: TextInputType.phone,
          controller: registrationController.phoneNumberController,
          contenpaddingHorizontal: 12.w,
          contenpaddingVertical: 16.h,
          hintText: AppString.phoneNumber,
           validator: (value) {
            if (value == null || value.isEmpty) {
              return "please enter your phone number";
            }
            return null;
          },
        ),
        SizedBox(height: 16.h),
        CustomText(text: AppString.gender),
//======================================>   Radio  Button Section <==============================
        Row(
          children: [
            Radio(
                value: AppString.male,
                activeColor: AppColors.primaryColor,
                groupValue: registrationController.groupValue,
                onChanged: (value) {
                  setState(() {
                    registrationController.groupValue = value!;
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
                groupValue: registrationController.groupValue,
                onChanged: (value) {
                  setState(() {
                    registrationController.groupValue = value!;
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
          keyboardType: TextInputType.number,
          controller: registrationController.ageController,
          contenpaddingHorizontal: 12.w,
          contenpaddingVertical: 16.h,
          hintText: AppString.age,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "please enter your age";
            }
            return null;
          },
        ),
        SizedBox(height: 16.h),
        CustomTextField(
          controller: registrationController.clubNameController,
          contenpaddingHorizontal: 12.w,
          contenpaddingVertical: 16.h,
          hintText: AppString.clubName,
           validator: (value) {
            if (value == null || value.isEmpty) {
              return "please enter your club name";
            }
            return null;
          },
        ),
        SizedBox(height: 174.h),
        CustomButton(
          title: AppString.makePayment,
          titlecolor: Colors.white,
          loading: registrationController.registerLoading.value,
          onpress: () {
            _submitForm(context);
            // if (_formKey.currentState!.validate()) {
            //   registrationController.makePayment('${parameter['matchId']}');
            // }
          },
        ),
        SizedBox(height: 74.h),
      ],
    );
  }




  void _submitForm(BuildContext context) async {
    // Replace the URL with your actual endpoint
    const url = 'https://www.payfast.co.za/eng/process';
    final response = await http.post(
      Uri.parse(url),
      body: {
        'merchant_id': appConstants.getMerchantId,
        'merchant_key': appConstants.getMerchantKey,
        'amount': '100.00',
        'item_name': 'Test Product',
        'return_url': AppConstants.return_url,
        'cancel_url': AppConstants.cancel_url,
        'notify_url': AppConstants.notify_url,
      },
    );

    if (response.statusCode == 200||response.statusCode==302) {
      Navigator.push(context, MaterialPageRoute(builder: (_)=>FlutterLocalWebView(code: response.body,)));
      // Handle successful response
      print('Form submitted successfully');
    } else {
      // Handle errors


      print('Error submitting form: ${response.statusCode}');
      print('Error submitting form: ${response.body}');
    }
  }
}


