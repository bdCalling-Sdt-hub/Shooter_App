import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shooter_app/service/api_client.dart';
import 'package:shooter_app/service/api_constant.dart';

import '../routes/app_routes.dart';

class RegistrationController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final ageController = TextEditingController();
  final clubNameController = TextEditingController();
  String groupValue = '';

  var registerLoading = false.obs;
  var bearerToken = ApiClient.bearerToken;
  matchRegister(String matchId) async {
    Map<String, String> header = {'Content-Type': 'application/json', 'Authorization': 'Bearer $bearerToken'};
    var age = int.parse(ageController.text);
    var body = {
      "fullName": nameController.text,
      "email": emailController.text.trim(),
      "phone": phoneNumberController.text,
      "gender": groupValue.toString(),
      "age": age.toInt(),
      "clubName": clubNameController.text
    };
    var response = await ApiClient.postData(
        ApiConstant.matchRegister(matchId), json.encode(body),
        headers: header);
    if (response.statusCode == 200) {
      print('==================> Register Success');
      Get.offAndToNamed(AppRoutes.myMatchesScreen,
          parameters: {"matchId": matchId, "screenType": "register"});
    } else {
      Fluttertoast.showToast(msg: response.statusText ?? "");
    }
    registerLoading(false);
  }
}
