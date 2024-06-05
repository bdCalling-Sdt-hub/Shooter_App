// import 'package:get/get.dart';
// import 'package:shooter_app/model/my_upcoming_events_model.dart';
// import 'package:shooter_app/service/api_client.dart';
// import 'package:shooter_app/service/api_constant.dart';
//
// class MyEventListController extends GetxController {
//   RxBool myEventsLoading = false.obs;
//   RxList myEvensLists = [].obs;
//
//
//
//   Future<void> getEvents() async {
//
//
//     print('calling');
//     var response = await ApiClient.getData(
//         '${ApiConstant.myEventList}.value}');
//     if (response.statusCode == 200) {
//       if (response.body['data']['attributes'] != null) {
//         var eventData = response.body['data']['attributes'] ;
//
//
//         for(var item in eventData) {
//
//         }
//
//         myEvensLists.addAll(eventData);
//         myEventsLoading(false);
//         update();
//       }
//     }
//     //ApiChecker.checkApi(response);
//   }
// }
