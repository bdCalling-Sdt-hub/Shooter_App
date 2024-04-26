import 'dart:convert';

import 'package:get/get.dart';
import 'package:shooter_app/model/events_model.dart';
import 'package:shooter_app/model/upcoming_even_model.dart';
import 'package:shooter_app/service/api_client.dart';
import 'package:shooter_app/service/api_constant.dart';

import '../service/api_check.dart';
import '../utils/app_constants.dart';

class EventsController extends GetxController {
  RxInt page = 1.obs;
  var totalPage = (-1);
  var currectPage = (-1);
  var totalResult = (-1);


  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  RxList evensLists = [].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getEvents();
  }

  void loadMore() {
    if (totalPage > page.value) {
      page.value += 1;
      update();
      getEvents();
    } else {
      update();
    }
  }

  Future<void> getEvents() async {
    if (page.value == 1) {
      setRxRequestStatus(Status.loading);
    }

    var response = await ApiClient.getData('${ApiConstant.allEvents}?limit=3&page=${page.value}');
    if (response.statusCode == 200) {
      if (response.body['data']['attributes'] != null) {
        totalPage = jsonDecode(response.body['pagination']['totalPages'].toString());
        currectPage = jsonDecode(response.body['pagination']['currentPage'].toString());
        totalResult = jsonDecode(response.body['pagination']['totalEvents'].toString());
        var eventData = List<EventsModel>.from(response.body['data']['attributes'].map((e) => EventsModel.fromJson(e)));


        evensLists.addAll(eventData);
        setRxRequestStatus(Status.completed);
        update();
      }
    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
    }
    ApiChecker.checkApi(response);
  }
}
