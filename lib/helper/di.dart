
import 'package:get/get.dart';
import 'package:shooter_app/controller/auth_controller.dart';

Future init()async{
  Get.lazyPut(() => AuthController());


}