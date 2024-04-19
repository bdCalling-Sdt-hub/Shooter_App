import 'package:get/get.dart';
import 'package:shooter_app/model/profile_model.dart';
import 'package:shooter_app/service/api_client.dart';
import 'package:shooter_app/service/api_constant.dart';
import 'package:shooter_app/utils/app_constants.dart';

import '../helper/prefs_helper.dart';

class ProfileController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfileData();
  }

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  Rx<ProfileModel> profileModel = ProfileModel().obs;


  getProfileData()async{
    setRxRequestStatus(Status.loading);
    var userId = await PrefsHelper.getString(AppConstants.userId);
    var response = await ApiClient.getData(ApiConstant.profileEndPoint(userId));


    if(response.statusCode == 200){
      profileModel.value = ProfileModel.fromJson(response.body);
      setRxRequestStatus(Status.completed);
    }else{
      if(response.statusText == ApiClient.noInternetMessage){
        setRxRequestStatus(Status.internetError);
      }else{
        setRxRequestStatus(Status.error);
      }

    }
  }
}