import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shooter_app/controller/privacy_policy_controller.dart';
import 'package:shooter_app/views/widgets/custom_loader.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimentions.dart';
import '../../../widgets/custom_text.dart';

class PrivacypolicyScreen extends StatelessWidget {
  PrivacypolicyScreen({super.key});
  final PrivacyPolicyController _privacyPolicyController =
      Get.put(PrivacyPolicyController());

  @override
  Widget build(BuildContext context) {
    _privacyPolicyController.getPrivacy();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: CustomText(
          text: AppString.privacyPolicy,
          fontsize: 18.h,
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => _privacyPolicyController.isLoading.value
            ? const CustomLoader()
            : Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeDefault),
                child: Column(
                  children: [
                    SizedBox(height: 24.h),
                    Obx(
                      () => Html(
                        shrinkWrap: true,
                        data: _privacyPolicyController.content.value,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
