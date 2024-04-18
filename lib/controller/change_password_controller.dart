import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shooter_app/service/api_check.dart';
import 'package:shooter_app/service/api_client.dart';
import 'package:shooter_app/service/api_constant.dart';

import '../routes/app_routes.dart';

class ChangePasswordController extends GetxController {
  var changeLoading = false.obs;

  handleChangePassword(String oldPassword, String password) async {
    changeLoading(true);
    var body = {"oldPassword": oldPassword, "newPassword": password};

    var response =
        await ApiClient.postData(ApiConstant.changePassword, json.encode(body));
    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: response.body['message'],toastLength:Toast.LENGTH_LONG,gravity: ToastGravity.CENTER,backgroundColor:Colors.green,textColor:Colors.white);
    } else {
      ApiChecker.checkApi(response);
    }
    changeLoading(false);

  }



  /// <------------------- forgot password setting --------------->



  var forgotLoading = false.obs;

  forgotPassword(String email) async {
    forgotLoading(true);
    var body = {"email": email};
    Map<String, String> header = {'Content-Type': 'application/json'};
    var response = await ApiClient.postData(
        ApiConstant.forgot, json.encode(body),
        headers: header);
    if (response.statusCode == 200) {
      Get.toNamed(AppRoutes.getOtpSceeen,
          arguments:email);
    } else {
      Fluttertoast.showToast(msg: response.statusText ?? "",backgroundColor: Colors.red,textColor: Colors.white);
    }
    forgotLoading(false);
  }


  ///  resend otp

  var resendOtpLoading = false.obs;

  resendOtp(String email) async {
    resendOtpLoading(true);
    var body = {"email": email};
    Map<String, String> header = {'Content-Type': 'application/json'};
    var response = await ApiClient.postData(
        ApiConstant.forgot, json.encode(body),
        headers: header);
    if (response.statusCode == 200) {


    } else {
      Fluttertoast.showToast(msg: response.statusText ?? "",backgroundColor: Colors.red,textColor: Colors.white,gravity: ToastGravity.CENTER);
    }
    resendOtpLoading(false);
  }



  /// verify forgot password


  var verifyLoading = false.obs;

  verifyEmail(
      String  email,
      String code,
      ) async {
    verifyLoading(true);
    var body = {"email":email, "code": code};
    Map<String, String> header = {'Content-Type': 'application/json'};
    var response = await ApiClient.postData(
        ApiConstant.verifyCode, json.encode(body),
        headers: header);
    if (response.statusCode == 200) {
        Get.toNamed(AppRoutes.setnewpasswordScreen, arguments:email);
    } else {
      Fluttertoast.showToast(msg: response.statusText ?? "");
    }
    verifyLoading(false);
  }

  /// <-------------------------- set password --------------->

  var setPasswordLoading = false.obs;

  setPassword(String email, String password) async {
    setPasswordLoading(true);
    var body = {"email": email, "password": password};
    Map<String, String> header = {'Content-Type': 'application/json'};
    var response = await ApiClient.postData(
        ApiConstant.setPassword, json.encode(body),
        headers: header);
    if (response.statusCode == 200){
      showDialog(context: Get.context!,
          barrierDismissible:false,
          builder:(_)=> AlertDialog(
        title: const Text("Password Changed!"),
        content: const Text("Your password has been changed successfully."),
            actions: [
              TextButton(
                  onPressed:(){
                    Get.back();
                    Get.back();
                    Get.back();
              }, child:const Text("Ok"))
            ],
      ));

    } else {
      debugPrint("error set password ${response.statusText}");
      Fluttertoast.showToast(msg: "${response.statusText}",);
    }
    setPasswordLoading(false);
  }


}
