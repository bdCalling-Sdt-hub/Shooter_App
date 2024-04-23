import 'package:get/get.dart';
import '../service/api_client.dart';
import '../service/api_constant.dart';

class TermsConditionsController extends GetxController {
  RxBool isLoading = false.obs;
  RxString content = ''.obs;

  @override
  void onInit() {
    getTermsCondition();
    super.onInit();
  }

//==============================> Get Terms and Condition Method <==========================
  getTermsCondition() async {
    try {
      isLoading.value = true;
      var response =
          await ApiClient.getData(ApiConstant.termsConditionsEndPoint);
      if (response.statusCode == 200) {
        var data = response.body;
        var contents = data['data']['attributes'][0]['content'];
        content.value = contents;
      } else {
        Get.snackbar(
            response.statusCode.toString(), response.statusText ?? "error");
      }
    } catch (e) {
      print('Exception occurred: $e');
      Get.snackbar('Error', 'An error occurred while fetching data');
    } finally {
      isLoading.value = false;
    }
  }
}
