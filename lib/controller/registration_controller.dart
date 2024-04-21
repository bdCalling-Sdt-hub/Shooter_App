import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooter_app/service/api_client.dart';
import 'package:shooter_app/service/api_constant.dart';

class RegistrationController extends GetxController{
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final ageController = TextEditingController();
  final clubNameController = TextEditingController();
  String groupValue = '';

  matchRegister(String matchId)async{
    var body = {
      "fullName": nameController.text,
      "email":  emailController.text.trim(),
      "phone": phoneNumberController.text,
      "gender": groupValue.toString(),
      "age": ageController.text,
      "clubName": clubNameController.text
    };
    var response = await ApiClient.postData(ApiConstant.matchRegister(matchId), body);
    if(response.statusCode == 200 ){
      print('==================> Register Success');
    }
    


  }
}