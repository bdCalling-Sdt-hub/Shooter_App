import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shooter_app/service/iap_service.dart';

import '../../../helper/prefs_helper.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  /// final ProfileController _profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();

    ///_profileController.getProfileData();

    debugPrint("========> Out change out");
    _route();
  }

  _route() {
    Timer(const Duration(seconds: 3), () async {
      var onBoard = await PrefsHelper.getBool(AppConstants.isOnboard);
      var isLogged = await PrefsHelper.getBool(AppConstants.isLogged);
      if (onBoard) {
        if (isLogged) {
          var isSubscribed = await IAPService.checkSubscription();
          if (isSubscribed) {
            Get.offNamed(AppRoutes.bottomNavBar);
          } else {
            Get.offAllNamed(AppRoutes.subscriptionScreen);
          }
        } else {
          Get.offAllNamed(AppRoutes.signInScreen);
        }
      } else {
        Get.offAllNamed(AppRoutes.onboardingsScreen);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Opacity(
                  opacity: 0.6,
                  child: SvgPicture.asset(
                    "assets/images/splash.svg",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 100.h,
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
          ),
        ],
      ),
    );
  }

  // StreamSubscription? streamSubscription;
  // bool isConnection = false;
  //
  // void getConnectivity() {streamSubscription = Connectivity().onConnectivityChanged.listen((event) async {
  //         isConnection = await InternetConnectionChecker().hasConnection;
  //         if (isConnection) {
  //           print("------------------Internet available");
  //           Timer(const Duration(seconds: 4), () {
  //             Get.offAllNamed(AppRoutes.onboardingsScreen);
  //           });
  //         } else {
  //           print("----------------------No internet");
  //           return null;
  //         }
  //       });
  // }
}
