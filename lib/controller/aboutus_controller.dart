import 'package:get/get.dart';
import '../service/api_client.dart';
import '../service/api_constant.dart';

class AboutUsController extends GetxController {
  RxBool isLoading = false.obs;
  RxString content = ''.obs;

//==============================> Get About Us Method <==========================
  getAboutUs() async {
    isLoading.value = true;
    Map<String, String> header = {'Content-Type': 'application/json'};
    var response =
        await ApiClient.getData(ApiConstant.aboutUsEndPoint, headers: header);
    if (response.statusCode == 200) {
      var data = response.body;
      var attributes = data['data']['content'];
      content.value = attributes;
      isLoading.value = false;
    }
  }
}
