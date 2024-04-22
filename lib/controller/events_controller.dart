import 'dart:convert';

import 'package:get/get.dart';
import 'package:shooter_app/model/events_model.dart';
import 'package:shooter_app/model/upcoming_even_model.dart';
import 'package:shooter_app/service/api_client.dart';
import 'package:shooter_app/service/api_constant.dart';

import '../service/api_check.dart';
import '../utils/app_constants.dart';

class EventsController extends GetxController{



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getEvents();

  }

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  RxList<EventsModel> evensModel = <EventsModel>[].obs;

  getEvents()async{
    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData(ApiConstant.allEvents);


    if(response.statusCode == 200){
      evensModel.value = List<EventsModel>.from(response.body['data']['attributes'].map((e)=> EventsModel.fromJson(e)));
      setRxRequestStatus(Status.completed);
    }else{
      if(response.statusText == ApiClient.noInternetMessage){
        setRxRequestStatus(Status.internetError);
      }else{
        setRxRequestStatus(Status.error);
      }
    }ApiChecker.checkApi(response);
  }




}