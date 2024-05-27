import 'dart:async';

import 'package:fl_downloader/fl_downloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shooter_app/utils/dimentions.dart';
import 'package:shooter_app/views/widgets/custom_text.dart';

import '../../../utils/app_icons.dart';

class FileVewierScreen extends StatefulWidget {
  final String url;
  const FileVewierScreen({super.key,required this.url});

  @override
  State<FileVewierScreen> createState() => _FileVewierScreenState();
}

class _FileVewierScreenState extends State<FileVewierScreen> {



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
      appBar: AppBar(title: CustomText(text: 'PDF Viewer',),centerTitle: true,
      actions: [
        IconButton(onPressed: ()async {

          var permission =
          await FlDownloader.requestPermission();
          if (permission ==
              StoragePermissionStatus.granted) {
            await FlDownloader.download(
                "https://bdcalling.hrmsoftwarebd.com/uploads/2024/05/510-663d93f647af4.pdf",
                fileName:
                '${widget.url}');
          }
        }, icon: Padding(
          padding:  EdgeInsets.only(right: 16.w),
          child: SvgPicture.asset(AppIcons.downloadIcon, color: Colors.white,),
        ))
      ],),

      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.w),
        child: PDF().cachedFromUrl(
            widget.url,
            placeholder: (double progress) => Center(child: CustomText(text: '$progress %'),),
            errorWidget: (dynamic error) => Center(child: CustomText(text: error.toString(),),)
        ),
      ),
    );
  }
}
