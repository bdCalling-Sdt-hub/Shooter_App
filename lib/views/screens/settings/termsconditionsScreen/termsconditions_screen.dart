import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shooter_app/controller/terms_conditions_controller.dart';
import 'package:shooter_app/views/widgets/custom_loader.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimentions.dart';
import '../../../widgets/custom_text.dart';

class TermsconditionsScreen extends StatelessWidget {
  TermsconditionsScreen({super.key});
  final TermsConditionsController _termsConditionsController =
      Get.put(TermsConditionsController());

  @override
  Widget build(BuildContext context) {
    _termsConditionsController.getTermsCondition();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: CustomText(
          text: AppString.termsConditions,
          fontsize: 18.h,
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => _termsConditionsController.isLoading.value
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
                        data: _termsConditionsController.content.value,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
