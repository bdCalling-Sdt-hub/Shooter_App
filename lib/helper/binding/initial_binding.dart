

import 'package:get/get.dart';
import 'package:shooter_app/controller/events_controller.dart';
import 'package:shooter_app/controller/home_controller.dart';
import 'package:shooter_app/controller/match_controller.dart';
import 'package:shooter_app/controller/profileController.dart';

class InitialScreenBindings implements Bindings {

  InitialScreenBindings();

  @override
  void dependencies() {
    Get.put(() => HomeController());
    // Get.put(() => MatchController());
    Get.put(() => EventsController());
    Get.put(() => ProfileController());
  }
}