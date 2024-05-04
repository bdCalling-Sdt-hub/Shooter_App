import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shooter_app/service/api_client.dart';
import 'package:shooter_app/service/api_constant.dart';
import '../routes/app_routes.dart';
import '../utils/app_constants.dart';
import '../views/screens/payment/flutter_local_web_view.dart';
import 'package:http/http.dart' as http;

class RegistrationController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final ageController = TextEditingController();
  final clubNameController = TextEditingController();
  String groupValue = '';


  AppConstants appConstants = AppConstants();



  ///=================================================>
  RxBool submitFromLoading = false.obs;
  void submitForm(BuildContext context, String? matchId, price, matchName) async {
    submitFromLoading(true);
    // Replace the URL with your actual endpoint
    print("========================================dd==========$matchName");

    const url = 'https://www.payfast.co.za/eng/process';
    // var age = int.parse(ageController.text);
    // var bodyCo = {
    //   "fullName": nameController.text,
    //   "email": emailController.text.trim(),
    //   "phone": phoneNumberController.text,
    //   "gender": groupValue.toString(),
    //   "age": age.toInt(),
    //   "clubName": clubNameController.text,
    //   "transactionId":"sdfsdghfsd",
    //   "price":"$price"
    // };

    final response = await http.post(
      Uri.parse(url),
      body: {
        'merchant_id': appConstants.getMerchantId,
        'merchant_key': appConstants.getMerchantKey,
        'amount': '$price',
        'item_name': '$matchName',
        'return_url': AppConstants.return_url,
        'cancel_url': AppConstants.cancel_url,
        'notify_url': AppConstants.notify_url,
      },
    );

    if (response.statusCode == 200||response.statusCode==302) {
      Navigator.push(context, MaterialPageRoute(builder: (_)=>FlutterLocalWebView(code: response.body, matchId: '$matchId', price: price,)));
      // Handle successful response
      print('Form submitted successfully , ${response.body} ');
      submitFromLoading(false);
    } else {
      // Handle errors
      print('Error submitting form: ${response.statusCode}');
      print('Error submitting form: ${response.body}');
    }
  }





//=========================> Match Register <============================
  var registerLoading = false.obs;
  var bearerToken = ApiClient.bearerToken;
  matchRegister(String matchId, price, transactionId) async {
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $bearerToken'
    };
    var age = int.parse(ageController.text);
    var body = {
      "fullName": nameController.text,
      "email": emailController.text.trim(),
      "phone": phoneNumberController.text,
      "gender": groupValue.toString(),
      "age": age.toInt(),
      "clubName": clubNameController.text,
      "transactionId":"$transactionId",
      "price":"$price"
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


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.clear();
    emailController.clear();
    phoneNumberController.clear();
    ageController.clear();
    clubNameController.clear();
  }
}
