import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shooter_app/utils/app_images.dart';
import 'dart:math' as math;
import '../../../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(duration: const Duration(seconds: 10), vsync: this)
        ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose

    _animationController.dispose(); // you need this
      super.dispose();

  }

  void initState() {
    super.initState();
    streamSubscription;
    getConnectivity();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 242.h),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Opacity(
                opacity: 0.6,
                child: Image.asset(
                  AppImages.splashBg,
                  fit: BoxFit.cover,
                   height: 610.h,
                  width: 393.w,
                ),
              ),
              Positioned(
                top: -160.h,
                right: 50.w,
                left: 50.w,
                child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (BuildContext context, Widget? child) {
                      return Transform.rotate(
                        angle: _animationController.value * 2.0 * math.pi,
                        child: child,
                      );
                    },
                    child: SizedBox(
                      height: 200.h,
                      width: 200.w,
                      child: const Center(
                        child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage(AppImages.appLogo)),
                      ),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }



  StreamSubscription? streamSubscription;
  bool isConnection = false;

  void getConnectivity() {streamSubscription = Connectivity().onConnectivityChanged.listen((event) async {
          isConnection = await InternetConnectionChecker().hasConnection;
          if (isConnection) {
            print("------------------Internet available");
            Timer(const Duration(seconds: 4), () {
              Get.offAllNamed(AppRoutes.onboardingsScreen);
            });
          } else {
            print("----------------------No internet");
            return null;
          }
        });
  }

}
