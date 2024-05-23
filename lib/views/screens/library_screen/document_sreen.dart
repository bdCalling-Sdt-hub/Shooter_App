import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:fl_downloader/fl_downloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shooter_app/helper/time_format.dart';
import 'package:shooter_app/views/widgets/custom_loader.dart';

import '../../../controller/library_controller.dart';
import '../../../service/api_constant.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/dimentions.dart';
import '../../widgets/custom_text.dart';

class DocumentScreen extends StatefulWidget {
  DocumentScreen({Key? key}) : super(key: key);

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
    progressStream = FlDownloader.progressStream.listen((event){
      if (event.status == DownloadStatus.successful){
        setState(() {
          prograss = event.progress;
        });
        FlDownloader.openFile(filePath: event.filePath);
      }else if (event.status == DownloadStatus.running){
        setState(() {
          prograss = event.progress;
        });
      }else if(event.status == DownloadStatus.failed){
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

  // @override
  // void initState() {
  //   super.initState();
  //   FlutterDownloader.registerCallback(downloadCallback);
  //   _checkPermission();
  // }
  //
  // void _checkPermission() async {
  //   if (Platform.isAndroid) {
  //     bool status = await Permission.storage.isGranted;
  //     if (!status) {
  //       await Permission.storage.request();
  //     }
  //   }
  // }
  //
  // void _downloadFile(String url) async {
  //   final fileName =  getFileNameUrl(url);
  //   final directory = await getExternalStorageDirectory();
  //   final taskId = await FlutterDownloader.enqueue(url: url,
  //     // Replace with your file URL
  //     savedDir: directory.path,
  //     fileName: fileName,
  //     showNotification: true,
  //     openFileFromNotification: true,
  //   );
  // }
  //
  // String getFileNameUrl(String url) {
  //   List<String> parts = url.split('/');
  //   String fileName = parts.last;
  //   if (fileName.contains('?')) {
  //     fileName = fileName.split('?').first;
  //   }
  //   debugPrint("File name : $fileName");
  //
  //   return fileName;
  // }
  //
  // @pragma('vm:entry-point')
  // static void downloadCallback(String id, int status, int progress) {
  //   final SendPort? send =
  //   IsolateNameServer.lookupPortByName('downloader_send_port');
  //   send!.send([
  //     id,
  //     status,
  //   ]);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const CustomText(text: "Documents"), centerTitle: true),
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
                          border: Border.all(color: AppColors.primaryColor),
                        ),
                        child: GestureDetector(
                          onTap: () async{
                           var permission = await FlDownloader.requestPermission();
                           if(permission == StoragePermissionStatus.granted){
                             await  FlDownloader.download("${ApiConstant.imageBaseUrl}/${document.document?.publicFileUrl}", fileName: '${document.document?.publicFileUrl}');
                           }

                          },
                          child: Padding(
                            padding: EdgeInsets.all(8.r),
                            child: SvgPicture.asset(AppIcons.downloadIcon, color: AppColors.primaryColor),
                          ),
                        ),
                      ),
                      leading: SvgPicture.asset(AppIcons.pdfImage),
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

Future<Directory> getExternalStorageDirectory() async {
  final directory = Directory('/storage/emulated/');
  if (!await directory.exists()) {
    await directory.create(recursive: true);
  }
  return directory;
}
