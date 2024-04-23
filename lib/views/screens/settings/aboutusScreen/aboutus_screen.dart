import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shooter_app/views/widgets/custom_loader.dart';
import '../../../../controller/aboutus_controller.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimentions.dart';
import '../../../widgets/custom_text.dart';

class AboutusScreen extends StatelessWidget {
  AboutusScreen({super.key});
  final AboutUsController _aboutUsController = Get.put(AboutUsController());

  @override
  Widget build(BuildContext context) {
    _aboutUsController.getAboutUs();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: CustomText(
          text: AppString.aboutUs,
          fontsize: 18.h,
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => _aboutUsController.isLoading.value
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
                        data: _aboutUsController.content.value,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
