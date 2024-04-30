import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shooter_app/controller/profileController.dart';
import 'package:shooter_app/helper/prefs_helper.dart';
import 'package:shooter_app/utils/app_constants.dart';
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

  late StreamSubscription<ConnectivityResult> _onConnectivityChanged;
  final ProfileController _profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    _profileController.getProfileData();
    bool firstTime = true;
    _onConnectivityChanged = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (!firstTime) {
        bool isNotConnected = result != ConnectivityResult.wifi &&
            result != ConnectivityResult.mobile;
        isNotConnected
            ? const SizedBox()
            : ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: isNotConnected ? Colors.red : Colors.green,
          duration: Duration(seconds: isNotConnected ? 6000 : 3),
          content: Text(
            isNotConnected ? 'No connection' : 'Connected',
            textAlign: TextAlign.center,
          ),
        ));
        if (!isNotConnected) {
          debugPrint("========> in connect change $isNotConnected");
          _route();
        }
      }
      firstTime = false;
    });

    debugPrint("========> Out change out");
     _route();
  }

  _route() {
    Timer(const Duration(seconds: 1), () async {
      var onBoard = await PrefsHelper.getBool(AppConstants.isOnboard);
      var isLogged = await PrefsHelper.getBool(AppConstants.isLogged);
      var subscription = await PrefsHelper.getString(AppConstants.subscription);
      var subscriptionDateAviale = await PrefsHelper.getBool(AppConstants.isFutureDate);
      if (onBoard) {
        if (isLogged ) {
          if(subscriptionDateAviale){
            Get.offNamed(AppRoutes.bottomNavBar,);
            print("=================================================================>  $subscription and $subscriptionDateAviale");
          }else{
            Get.offAllNamed(AppRoutes.signInScreen);
          }
        } else {
          Get.offAllNamed(AppRoutes.subscriptionScreen);
        }
      } else {
        Get.offAllNamed(AppRoutes.onboardingsScreen);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _onConnectivityChanged.cancel();
    super.dispose();
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
