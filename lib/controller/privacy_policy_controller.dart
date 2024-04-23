import 'package:get/get.dart';
import '../service/api_client.dart';
import '../service/api_constant.dart';

class PrivacyPolicyController extends GetxController {
  RxBool isLoading = false.obs;
  RxString content = ''.obs;
  @override
  void onInit() {
    getPrivacy();
    super.onInit();
  }

//==============================> Get Privacy Policy Method <==========================
  getPrivacy() async {
    try {
      isLoading.value = true;
      var response = await ApiClient.getData(ApiConstant.privacyPolicyEndPoint);
      if (response.statusCode == 200) {
        var data = response.body;
        var attributes = data['data']['attributes'][0]['content'];
        content.value = attributes;
      } else {
        Get.snackbar(
            response.statusCode.toString(), response.statusText ?? "error");
      }
    } catch (e) {
      // Handle exceptions here
      print('Exception occurred: $e');
      Get.snackbar('Error', 'An error occurred while fetching data');
    } finally {
      isLoading.value = false;
    }
  }
}
