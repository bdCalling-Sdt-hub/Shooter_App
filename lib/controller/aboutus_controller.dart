import 'package:get/get.dart';

import '../service/api_client.dart';
import '../service/api_constant.dart';


class AboutUsController extends GetxController {
  RxBool isLoading = false.obs;
  RxString content = ''.obs;

  @override
  void onInit() {
    getAboutUs();
    super.onInit();
  }

//==============================> Get About Us Method <==========================
  getAboutUs() async {
    isLoading.value = true;
    var response = await ApiClient.getData(ApiConstant.aboutUsEndPoint);
    if (response.statusCode == 200) {
      var data = response.body;
      var attributes = data['data']['attributes'][0]['content'];
      content.value = attributes;
    } else {
      Get.snackbar(
          response.statusCode.toString(), response.statusText ?? "error");
    }
    isLoading.value = false;
  }
}
