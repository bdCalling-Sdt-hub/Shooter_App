import 'dart:convert';

import 'package:get/get.dart';
import 'package:shooter_app/model/notification_model.dart';
import 'package:shooter_app/service/api_client.dart';
import 'package:shooter_app/service/api_constant.dart';

class NotificationController extends GetxController{
  RxInt page = 1.obs;
  var totalPage = (-1);
  var currectPage = (-1);
  var totalResult = (-1);


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getNotifications();
  }


  void loadMore() {
    if (totalPage > page.value) {
      page.value += 1;
      update();
      getNotifications();
    } else {
      update();
    }
  }



  RxBool notificationLoading = false.obs;
  RxList <NotificationModel> notificationsList = <NotificationModel> [].obs;

  getNotifications()async{
    if(page == 1){
      notificationLoading(true);
    }
    var response = await ApiClient.getData('${ApiConstant.notificationsEndPoint}?limit=2&page=$page');

    if(response.statusCode == 200){
      if(response.body['data']['attributes'] != null){
        totalPage = jsonDecode(response.body['pagination']['totalPages'].toString());
        currectPage = jsonDecode(response.body['pagination']['currentPage'].toString());
        totalResult = jsonDecode(response.body['pagination']['totalNotification'].toString());
        var notificationsData = List<NotificationModel>.from(response.body['data']['attributes'].map((e)=> NotificationModel.fromJson(e)));
        notificationsList.addAll(notificationsData);
        notificationLoading(false);
      }
    }
  }
}