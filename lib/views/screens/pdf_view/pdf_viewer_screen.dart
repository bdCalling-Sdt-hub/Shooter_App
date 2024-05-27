import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shooter_app/utils/dimentions.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';

class PDFVewierScreen extends StatelessWidget {
  final String url;
  const PDFVewierScreen({super.key,required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CustomText(text: 'PDF Viewer',),centerTitle: true,),

      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w),
        child: PDF().cachedFromUrl(
           url,
          placeholder: (double progress) => Center(child: CustomText(text: '$progress %'),),
          errorWidget: (dynamic error) => Center(child: CustomText(text: error.toString(),),)
        ),
      ),
    );
  }
}
