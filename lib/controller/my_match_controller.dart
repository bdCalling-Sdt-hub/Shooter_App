import 'package:get/get.dart';
import 'package:shooter_app/model/my_match_model.dart';
import 'package:shooter_app/service/api_client.dart';
import 'package:shooter_app/service/api_constant.dart';

import '../model/my_completed_match_model.dart';


class MyMatchController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMyMatch();
    getMyCompletedMatch();
  }
//=================================> My Upcoming Match <==========================

  RxList<MyMatchModel> myMatchModel = <MyMatchModel>[].obs;
  RxBool myMatchLoading = false.obs;
  getMyMatch() async {
    myMatchLoading(true);
    var response = await ApiClient.getData(ApiConstant.myUpComingMatchs);

    if (response.statusCode == 200) {
      myMatchModel.value = List<MyMatchModel>.from(response.body['data']
              ['attributes']
          .map((e) => MyMatchModel.fromJson(e)));
      myMatchLoading(false);
    }
  }

  //=================================> My Completed Match <==========================

  RxList<MyCompletedMatchModel> myCompletedMatchModel = <MyCompletedMatchModel>[].obs;
  RxBool myCompletedMatchLoading = false.obs;
  getMyCompletedMatch() async {
    myCompletedMatchLoading(true);
    var response = await ApiClient.getData(ApiConstant.myCompletedMatches);
    if (response.statusCode == 200) {
      print("================================= call here");
      myCompletedMatchModel.value = List<MyCompletedMatchModel>.from(response.body['data']['attributes'].map((e) => MyCompletedMatchModel.fromJson(e)));
      myCompletedMatchLoading(false);
    }
  }
}
