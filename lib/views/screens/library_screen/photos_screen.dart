import 'dart:isolate';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
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
   PhotosScreen({super.key});

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
 final LibraryController _libraryController = Get.put(LibraryController());

 ReceivePort _receivePort = ReceivePort();
 int progress = 0;
 @override
  void initState() {
   IsolateNameServer.registerPortWithName(_receivePort.sendPort, 'downloadingVideo');
   _receivePort.listen((message){
     setState(() {
       progress = message;
     });
   } );
    FlutterDownloader.registerCallback(downLoadCallBack);
    super.initState();
  }

static  downLoadCallBack(id, status, progress){
   SendPort? sendPort = IsolateNameServer.lookupPortByName("downloadingVideo");
   sendPort!.send(progress);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const CustomText(text: "Photos"),centerTitle: true,),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeDefault.w,
            vertical: Dimensions.paddingSizeDefault.h),
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                return _libraryController.photoLoading.value ?
                const CustomLoader() :
                GridView.builder(
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                      text: TimeFormatHelper.formatDate(photos.createdAt!),
                                      fontsize: 10.h,
                                      textAlign: TextAlign.start,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xffFA1131)),
                                  CustomText(
                                      text: "${progress}%",
                                      fontsize: 12.h,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)
                                ],
                              ),
                            ),
                          ),
                        ),
                        child:  Container(
                          decoration:  BoxDecoration(
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    "${ApiConstant.imageBaseUrl}/${photos.image?.publicFileUrl}",
                                  ),fit: BoxFit.cover)),

                          child:  GestureDetector(
                            onTap: (){
                              downLoadFile('https://w7.pngwing.com/pngs/67/315/png-transparent-flutter-hd-logo-thumbnail.png');
                            },
                            child: Center(
                              child: Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(color: AppColors.primaryColor)
                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.all(10.r),
                                    child: SvgPicture.asset(AppIcons.downloadIcon,color: AppColors.primaryColor),
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

  void downLoadFile(String url)async{
    final statas = await Permission.storage.request();
    if(statas.isGranted){
      final beseStorage = await getExternalStorageDirectory();
      final id = await FlutterDownloader.enqueue(url: url, savedDir: beseStorage!.path,fileName: '');
      print("Download task ID: =========================>$id");

    }else{
      print("no permission");
  }
  }


 // void _startDownload(String url) async {
 //   final taskId = await FlutterDownloader.enqueue(
 //     url: url,
 //     savedDir: '/',
 //     showNotification: true,
 //     openFileFromNotification: true,
 //   );
 //   print('Download started=======================> : $taskId');
 // }
 //
 // @override
 // void dispose() {
 //   IsolateNameServer.removePortNameMapping('downloader_send_port');
 //   super.dispose();
 // }
 //
 // static void downloadCallback(String id, int status, int progress) {
 //   final SendPort? send =
 //   IsolateNameServer.lookupPortByName('downloader_send_port');
 //   send?.send([id, status, progress]);
 // }
 //
 // void _requestPermissions() async {
 //   var status = await Permission.storage.status;
 //   if (!status.isGranted) {
 //     await Permission.storage.request();
 //   }
 // }
}
