import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shooter_app/service/api_client.dart';
import 'package:shooter_app/service/api_constant.dart';

import '../routes/app_routes.dart';

class AuthController extends GetxController {
  ///<===== ============== sign in =========== =====>
  final emailController = TextEditingController();
  final passController = TextEditingController();

  ///<===== ============== sign up =============== =====>

  final userNameController = TextEditingController();
  final emailSignupCtrl = TextEditingController();
  final passSignupCtrl = TextEditingController();


  var signUpLoading=false.obs;


  handleSignUp() async {
    signUpLoading(true);
    Map<String, String> header = {'Content-Type': 'application/json'};
    var body = {
      'name': userNameController.text.trim(),
      'email': emailSignupCtrl.text.trim(),
      'password': passSignupCtrl.text,
    };
    var response = await ApiClient.postData(
      ApiConstant.signUp,
      json.encode(body),
      headers: header,
    );
    if (response.statusCode == 200) {
      debugPrint("Complete Sign up");
    //  Get.toNamed(AppRoutes.verifyEmailScreen);
    }
   signUpLoading(false);
  }

  verifyEmail()async{


  }




}
