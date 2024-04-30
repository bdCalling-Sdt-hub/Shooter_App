import 'dart:io';

import 'package:get/get.dart';
import 'package:shooter_app/helper/time_format.dart';
import 'package:shooter_app/model/profile_model.dart';
import 'package:shooter_app/service/api_client.dart';
import 'package:shooter_app/service/api_constant.dart';
import 'package:shooter_app/utils/app_constants.dart';

import '../helper/prefs_helper.dart';
import '../service/api_check.dart';

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
      await PrefsHelper.setString(AppConstants.subscription, profileModel.value.data?.attributes?.subscription);


      if(TimeFormatHelper.isFutureDate('${profileModel.value.data?.attributes?.subscriptionEndDate}')){
        await PrefsHelper.setBool(AppConstants.isFutureDate, true);
      }else{
        await PrefsHelper.setBool(AppConstants.isFutureDate, false);
      }



      setRxRequestStatus(Status.completed);
    }else{
      if(response.statusText == ApiClient.noInternetMessage){
        setRxRequestStatus(Status.internetError);
      }else{
        setRxRequestStatus(Status.error);
      }
    }
  }


  ///======================update profile============================>
  var loading = false.obs;

  editProfile(
      String name, phoneNumber, address, club, userClass,  dateOfBirth, File?  image,) async {
    var userId = await PrefsHelper.getString(AppConstants.userId);
    print("=========================>>>> $dateOfBirth");

    List <MultipartBody> multipartBody =image==null?[]:[MultipartBody("image", image)];


    Map<String, String> body = {
      "name": name,
      "address": address,
      "dateOfBirth": dateOfBirth,
      "phone": phoneNumber,
      "club": club,
      "userClass": userClass,
    };

    var response = await ApiClient.patchMultipartData(
      ApiConstant.updateUser(userId), body,
      multipartBody:multipartBody,);
    print("===========response body : ${response.body} \nand status code : ${response.statusCode}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      profileModel.value = ProfileModel.fromJson(response.body['data']['attributes']);
      getProfileData();
      profileModel.refresh();
      Get.back();
    }else{
      ApiChecker.checkApi(response);
    }

  }

}