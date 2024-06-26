import 'dart:convert';

import 'package:get/get.dart';
import '../service/api_client.dart';
import '../service/api_constant.dart';

class TermsConditionsController extends GetxController {
  RxBool isLoading = false.obs;
  RxString content = ''.obs;

//==============================> Get Terms and Condition Method <==========================
  getTermsCondition() async {
    isLoading.value = true;
    Map<String, String> header = {'Content-Type': 'application/json'};
    var response = await ApiClient.getData(ApiConstant.termsConditionsEndPoint,
        headers: header);
    if (response.statusCode == 200) {
      var data = response.body;
      var attributes = data['data']['attributes']['content'];
       content.value = attributes;
      isLoading.value = false;
    }
  }
}
