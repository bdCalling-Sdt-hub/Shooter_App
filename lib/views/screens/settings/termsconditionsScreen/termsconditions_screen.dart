import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/dimentions.dart';
import '../../../widgets/custom_text.dart';

class TermsconditionsScreen extends StatelessWidget {
  const TermsconditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeDefault),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            CustomText(
              text:
                  'Lorem ipsum dolor sit amet consectetur. Leo enim erat nibh leo id cras proin porttitor pellentesque. Quis mauris enim pharetra est aliquam urna. Egestas mi aliquam ut pharetra. Sed dui augue pretium mauris habitasse proin sed arcu. At iaculis nisl nibh magna. Rutrum fusce posuere pellentesque tellus pharetra tincidunt arcu. Diam enim sed et cursus metus. Vitae tempus eget vestibulum sed sit dapibus. Vitae quam ultrices etiam eget et porta eu a nam. Sit a mattis donec tempor sed ac. Urna tellus non pretium ipsum in tempus massa. Dui sit cursus risus nunc. Id orci hendrerit ut sapien. Sit habitasse feugiat sed mauris id.',
              maxline: 30,
              textAlign: TextAlign.left,
              fontsize: 16.h,
            )
          ],
        ),
      ),
    );
  }
}
