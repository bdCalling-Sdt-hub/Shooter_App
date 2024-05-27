
import 'dart:async';

import 'package:fl_downloader/fl_downloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:photo_view/photo_view.dart';
import 'package:shooter_app/utils/app_icons.dart';

import '../../../service/api_constant.dart';
import '../../../utils/dimentions.dart';
import '../../widgets/custom_text.dart';

class ImageViewer extends StatefulWidget {
  final String url;
  const ImageViewer({super.key,required this.url});

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {


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
      appBar: AppBar(title: const CustomText(text: 'Image',),centerTitle: true,
      actions: [
        IconButton(onPressed: ()async {

          var permission = await FlDownloader.requestPermission();
          if (permission == StoragePermissionStatus.granted) {
            String imageUrl = "url";
            print("Attempting to download: $imageUrl");
            var downloadStatus = await FlDownloader.download('https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg');
            if (downloadStatus == DownloadStatus.failed) {
              print("Download failed for: $imageUrl");
            }
          } else {
            print("Permission not granted");
          }
        }, icon: Padding(
          padding:  EdgeInsets.only(right: 16.w),
          child: SvgPicture.asset(AppIcons.downloadIcon, color: Colors.white,),
        ))
      ],
      ),

      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w),
        child: PhotoView(
          imageProvider: NetworkImage(widget.url),
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered * 2,
        )
        ,
      ),
    );
  }
}

