import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/up_coming_match_model.dart';
import '../model/upcoming_even_model.dart';
import '../service/api_check.dart';
import '../service/api_client.dart';
import '../service/api_constant.dart';
import '../utils/app_constants.dart';

class HomeController {

  final pickDateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  RxList<UpComingEventModel> upComingEvensList = <UpComingEventModel>[].obs;

  getAllData() async {
    await getUpComingEvents();
    await getUpComingMatchs();
  }

  getUpComingEvents() async {
    setRxRequestStatus(Status.loading);

    var response = await ApiClient.getData(ApiConstant.upComingEven);
    if (response.statusCode == 200) {
      upComingEvensList.value = List<UpComingEventModel>.from(response.body['data']['attributes'].map((e)=>UpComingMatchModel.fromJson(e)));
    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
    }
    ApiChecker.checkApi(response);
  }

  RxList<UpComingMatchModel> upComingMatchList=<UpComingMatchModel>[].obs;
  getUpComingMatchs() async {
    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData(ApiConstant.upComingMatch);

    if (response.statusCode == 200) {
      upComingMatchList.value =  List<UpComingMatchModel>.from(response.body['data']['attributes'].map((x) => UpComingMatchModel.fromJson(x)));
      setRxRequestStatus(Status.completed);
    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
    }
    ApiChecker.checkApi(response);
  }


  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ,
      lastDate: DateTime(2100),
        firstDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != selectedDate) {

        selectedDate = pickedDate;
        pickDateController.text =
            DateFormat('MM/dd/yyyy').format(selectedDate);
        /*dateCtrl.text =
            "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";*/
        // date = "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
      print('Selected date: ${pickDateController.text}');
    }
  }
}
