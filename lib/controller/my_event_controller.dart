import 'package:get/get.dart';
import 'package:shooter_app/model/my_upcoming_events_model.dart';
import 'package:shooter_app/service/api_client.dart';
import 'package:shooter_app/service/api_constant.dart';


class MyUpComingEventsController extends GetxController {
  RxInt page = 1.obs;
  var totalPage = (-1);
  var currectPage = (-1);
  var totalResult = (-1);
  RxBool myEventsLoading = false.obs;


  RxList<MyUpComingEventsModel> myEvensLists = <MyUpComingEventsModel> [].obs;

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
      myEventsLoading(true);
    }

    var response = await ApiClient.getData(
        '${ApiConstant.myUpComingEven}?limit=15&page=${page.value}');
    if (response.statusCode == 200) {
      if (response.body['data']['attributes'] != null) {
        // totalPage = jsonDecode(response.body['pagination']['totalPages'].toString());
        // currectPage = jsonDecode(response.body['pagination']['currentPage'].toString());
        // totalResult = jsonDecode(response.body['pagination']['totalEvents'].toString()) ?? 0;
        var eventData = List<MyUpComingEventsModel>.from(response.body['data']['attributes'].map((e) => MyUpComingEventsModel.fromJson(e)));

        myEvensLists.addAll(eventData);
        myEventsLoading(false);
        update();
      }
    }
    //ApiChecker.checkApi(response);
  }
}
