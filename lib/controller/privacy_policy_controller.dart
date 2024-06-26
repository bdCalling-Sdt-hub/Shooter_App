import 'package:get/get.dart';
import '../service/api_client.dart';
import '../service/api_constant.dart';

class PrivacyPolicyController extends GetxController {
  RxBool isLoading = false.obs;
  RxString content = ''.obs;

//==============================> Get Privacy Policy Method <==========================
  getPrivacy() async {
    isLoading.value = true;
    Map<String, String> header = {'Content-Type': 'application/json'};
    var response = await ApiClient.getData(ApiConstant.privacyPolicyEndPoint,
        headers: header);
    if (response.statusCode == 200) {
      var data = response.body;
      var attributes = data['data']['attributes']['content'];
      content.value = attributes;
      isLoading.value = false;
    }
  }
}
