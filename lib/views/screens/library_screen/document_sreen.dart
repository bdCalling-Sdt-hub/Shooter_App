import 'dart:async';
import 'package:fl_downloader/fl_downloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shooter_app/helper/time_format.dart';
import 'package:shooter_app/views/screens/library_screen/file_viewer_screen.dart';
import 'package:shooter_app/views/widgets/custom_loader.dart';

import '../../../controller/library_controller.dart';
import '../../../service/api_constant.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/dimentions.dart';
import '../../widgets/custom_text.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({Key? key}) : super(key: key);

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  final LibraryController _libraryController = Get.put(LibraryController());

  int prograss = 0;
  late StreamSubscription progressStream;

  @override
  void initState() {
    super.initState();
    FlDownloader.initialize();
    progressStream = FlDownloader.progressStream.listen((event) {
      if (event.status == DownloadStatus.successful) {
        setState(() {
          prograss = event.progress;
        });
        FlDownloader.openFile(filePath: event.filePath);
      } else if (event.status == DownloadStatus.running) {
        setState(() {
          prograss = event.progress;
        });
      } else if (event.status == DownloadStatus.failed) {
        print('==========> error');
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    progressStream.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const CustomText(text: "Documents"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeDefault.w,
          vertical: Dimensions.paddingSizeDefault.h,
        ),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => _libraryController.documentLoading.value
                    ? const CustomLoader()
                    : ListView.builder(
                        itemCount: _libraryController.documentLists.length,
                        itemBuilder: (context, index) {
                          var document =
                              _libraryController.documentLists[index];

                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FileVewierScreen(
                                    url:
                                        "${ApiConstant.imageBaseUrl}${document.document?.publicFileUrl}"),
                              ));
                            },
                            child: ListTile(
                              ///=======================file name=================>
                              title: CustomText(
                                text: "${document.document?.fileName}",
                                fontsize: 12.h,
                                textAlign: TextAlign.start,
                              ),

                              ///=====================date======================>
                              subtitle: CustomText(
                                text: TimeFormatHelper.formatDate(
                                    document.createdAt!),
                                fontsize: 9.h,
                                textAlign: TextAlign.start,
                              ),

                              ///================================download button====================>
                              trailing: Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border:
                                      Border.all(color: AppColors.primaryColor),
                                ),
                                child: GestureDetector(
                                  onTap: () async {
                                    var permission =
                                        await FlDownloader.requestPermission();
                                    if (permission ==
                                        StoragePermissionStatus.granted) {
                                      await FlDownloader.download(
                                          "https://bdcalling.hrmsoftwarebd.com/uploads/2024/05/510-663d93f647af4.pdf",
                                          fileName:
                                              '${document.document?.publicFileUrl}');
                                    }
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(8.r),
                                    child: SvgPicture.asset(
                                        AppIcons.downloadIcon,
                                        color: AppColors.primaryColor),
                                  ),
                                ),
                              ),

                              ///========================File Icon=============================>

                              leading: SvgPicture.asset(AppIcons.pdfImage),
                            ),
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
