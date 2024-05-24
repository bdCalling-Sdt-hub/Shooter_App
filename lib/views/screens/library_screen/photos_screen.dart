import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_downloader/fl_downloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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
  int progress = 0;
  late StreamSubscription progressStream;

  @override
  void initState() {
    super.initState();
    FlDownloader.initialize();
    progressStream = FlDownloader.progressStream.listen((event) {
      setState(() {
        progress = event.progress;
      });

      if (event.status == DownloadStatus.successful) {
        FlDownloader.openFile(filePath: event.filePath);
      } else if (event.status == DownloadStatus.failed) {
        print('Download failed with status: ${event.status}');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    progressStream.cancel();
  }

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
          vertical: Dimensions.paddingSizeDefault.h,
        ),
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
                    childAspectRatio: 0.901,
                  ),
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
                                      photos.createdAt!,
                                    ),
                                    fontsize: 10.h,
                                    textAlign: TextAlign.start,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xffFA1131),
                                  ),
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
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () async {
                              var permission = await FlDownloader.requestPermission();
                              if (permission == StoragePermissionStatus.granted) {
                                String imageUrl = "${ApiConstant.imageBaseUrl}${photos.image?.publicFileUrl}";
                                print("Attempting to download: $imageUrl");
                                var downloadStatus = await FlDownloader.download('https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg');
                                if (downloadStatus == DownloadStatus.failed) {
                                  print("Download failed for: $imageUrl");
                                }
                              } else {
                                print("Permission not granted");
                              }
                            },
                            child: Center(
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.r),
                                  child: SvgPicture.asset(
                                    AppIcons.downloadIcon,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
