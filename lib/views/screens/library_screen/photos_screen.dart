import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_downloader/fl_downloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shooter_app/controller/library_controller.dart';
import 'package:shooter_app/helper/time_format.dart';
import 'package:shooter_app/service/api_constant.dart';
import 'package:shooter_app/utils/app_colors.dart';
import 'package:shooter_app/utils/dimentions.dart';
import 'package:shooter_app/views/widgets/custom_loader.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';

import '../../../utils/app_icons.dart';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({super.key});

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
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
  //
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
  //   final fileName = await getFileNameUrl('$url');
  //   final directory = await getExternalStorageDirectory();
  //   final taskId = await FlutterDownloader.enqueue(url: '$url',
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
  //       IsolateNameServer.lookupPortByName('downloader_send_port');
  //   send!.send([
  //     id,
  //     status,
  //   ]);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: "Photos"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeDefault.w,
            vertical: Dimensions.paddingSizeDefault.h),
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                return _libraryController.photoLoading.value
                    ? const CustomLoader()
                    : GridView.builder(
                        itemCount: _libraryController.photoLists.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.w,
                            mainAxisSpacing: 16.h,
                            childAspectRatio: 0.901),
                        itemBuilder: (context, index) {
                          var photos = _libraryController.photoLists[index];
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: GridTile(
                              footer: Container(
                                color: const Color(0xFFFFFFFF).withOpacity(.20),
                                child: Padding(
                                  padding: EdgeInsets.all(5.r),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                            text: TimeFormatHelper.formatDate(
                                                photos.createdAt!),
                                            fontsize: 10.h,
                                            textAlign: TextAlign.start,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xffFA1131)),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                          "${ApiConstant.imageBaseUrl}/${photos.image?.publicFileUrl}",
                                        ),
                                        fit: BoxFit.cover)),
                                child: GestureDetector(
                                  onTap: () async{
                                    var permission = await FlDownloader.requestPermission();
                                    if(permission == StoragePermissionStatus.granted){
                                      await  FlDownloader.download("${ApiConstant.imageBaseUrl}/${photos.image?.publicFileUrl}");
                                    }

                                  },
                                  child: Center(
                                    child: Container(
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                            border: Border.all(
                                                color: AppColors.primaryColor)),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.r),
                                          child: SvgPicture.asset(
                                              AppIcons.downloadIcon,
                                              color: AppColors.primaryColor),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
              }),
            )
          ],
        ),
      ),
    );
  }
}

Future<Directory> getExternalStorageDirectory() async {
  final directory = Directory('/storage/emulated/0/Download');
  if (!await directory.exists()) {
    await directory.create(recursive: true);
  }
  return directory;
}
