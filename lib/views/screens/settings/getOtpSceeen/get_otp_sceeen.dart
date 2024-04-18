import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shooter_app/controller/change_password_controller.dart';
import 'package:shooter_app/views/widgets/pin_code_text_field.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimentions.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';

class GetOtpSceeen extends StatefulWidget {
  GetOtpSceeen({super.key});

  @override
  State<GetOtpSceeen> createState() => _GetOtpSceeenState();
}

class _GetOtpSceeenState extends State<GetOtpSceeen> {
  final _otpCtrl = TextEditingController();

  final _changePassCtrl = Get.put(ChangePasswordController());

  @override
  void dispose() {
    // TODO: implement dispose
    _otpCtrl.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: CustomText(
          text: AppString.verifyEmail,
          fontsize: 18.h,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeDefault),
          child: Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              //================================> Body Strings Section <=======================
              CustomText(
                text: AppString.weHaveSent,
                fontsize: 16.h,
              ),
              SizedBox(height: 16.h),
              //================================> PinCodeField Section <=======================
              CustomPinCodeTextField(
                textEditingController: _otpCtrl,
              ),
              SizedBox(height: 16.h),
              Obx(
                () => Row(
                  children: [
                    CustomText(
                      text: AppString.didntGet,
                      fontsize: 16.h,
                    ),
                    const Spacer(),
                    _changePassCtrl.resendOtpLoading.value
                        ? const SizedBox(
                            height: 15,
                            width: 15,
                            child: CircularProgressIndicator(
                              color: Colors.red,
                            ),
                          )
                        : InkWell(
                      onTap: (){
                        _changePassCtrl.resendOtp(Get.arguments);
                      },
                          child: CustomText(
                              color: AppColors.primaryColor,
                              text: AppString.resend,
                              fontsize: 16.h,
                            ),
                        ),
                  ],
                ),
              ),
              const Spacer(),
              //================================> VerifyEmail Button <=======================
              Obx(
                () => CustomButton(
                  loading: _changePassCtrl.verifyLoading.value,
                  title: AppString.verify,
                  onpress: () {
                    if (_otpCtrl.text.length > 5) {
                      _changePassCtrl.verifyEmail(Get.arguments, _otpCtrl.text);
                    }
                  },
                ),
              ),
              SizedBox(height: 69.h),
            ],
          ),
        ),
      ),
    );
  }
}
