import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/common_data.dart';



class DataController extends GetxController implements GetxService {
  var email = "".obs;
  var image = "".obs;
  var name = "".obs;
  var userId = "".obs;
  late SharedPreferences preferences;

  getData() async {
    preferences = await SharedPreferences.getInstance();

    email.value = preferences.getString(CommonData.userEmail) ?? "";
    image.value = preferences.getString(CommonData.userImage) ?? "";

    name.value = preferences.getString(CommonData.userName) ?? "";
    userId.value = preferences.getString(CommonData.userId) ?? "";
  }

  setData(
      {required String nameD,
        required String emailD,
        required String passwordD,
        required String imageD,
        required String userid,
   }) async {
    name.value = nameD;
    email.value = emailD;
    image.value = imageD;
    userId.value = userid;

    preferences = await SharedPreferences.getInstance();
    preferences.setString(CommonData.userName, nameD);
    preferences.setString(CommonData.userEmail, emailD);
    preferences.setString(CommonData.userImage, imageD);
    preferences.setString(CommonData.userId, userid);

  }

  updateData(
      {required String imageD,
        required String nameD,
        required String titleD}) async {
    name.value = nameD;
    image.value = imageD;
    preferences = await SharedPreferences.getInstance();
    preferences.setString(CommonData.userName, nameD);
    preferences.setString(CommonData.userImage, imageD);
  }
}