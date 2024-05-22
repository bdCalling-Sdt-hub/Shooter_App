import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shooter_app/helper/time_format.dart';
import 'package:shooter_app/views/widgets/custom_loader.dart';

import '../../../controller/library_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/dimentions.dart';
import '../../widgets/custom_text.dart';

class DocumentScreen extends StatelessWidget {
   DocumentScreen({super.key});
  final LibraryController _libraryController = Get.put(LibraryController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const CustomText(text: "Documents"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeDefault.w,
            vertical: Dimensions.paddingSizeDefault.h),
        child: Column(
          children: [
            Expanded(
              child: Obx(()=>
              _libraryController.documentLoading.value ?
                  const CustomLoader() :
                 ListView.builder(
                  itemCount: _libraryController.documentLists.length,
                  itemBuilder: (context, index) {
                    var document = _libraryController.documentLists[index];
                    return ListTile(
                      title: CustomText(
                        text: "${document.document?.fileName}",
                        fontsize: 12.h,
                        textAlign: TextAlign.start,
                      ),
                      subtitle: CustomText(
                        text: TimeFormatHelper.formatDate(document.createdAt!),
                        fontsize: 9.h,
                        textAlign: TextAlign.start,
                      ),
                      trailing: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(color: AppColors.primaryColor)
                          ),
                          child: Padding(
                            padding:  EdgeInsets.all(8.r),
                            child: SvgPicture.asset(AppIcons.downloadIcon,color: AppColors.primaryColor),
                          )),
                      leading: SvgPicture.asset(AppIcons.pdfImage)
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
