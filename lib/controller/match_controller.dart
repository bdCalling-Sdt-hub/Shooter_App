import 'dart:convert';
import 'package:get/get.dart';
import 'package:shooter_app/model/match_model.dart';
import '../service/api_client.dart';
import '../service/api_constant.dart';
import '../utils/app_constants.dart';

class MatchController extends GetxController {
  RxInt page = 1.obs;
  var totalPage = (-1);
  var currectPage = (-1);
  var totalResult = (-1);

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  RxList matchModel = [].obs;

  @override
  void onInit() {
    getMatchs();
    super.onInit();
  }

  void loadMore() {
    if (totalPage > page.value) {
      page.value += 1;
      update();
      getMatchs();
    } else {
      update();
    }
  }

  Future<void> getMatchs() async {

    if (page.value == 1) {
      setRxRequestStatus(Status.loading);
    }

    var response = await ApiClient.getData('${ApiConstant.allMatch}?page=$page');

    if (response.statusCode == 200) {
      if (response.body['data']['attributes'] != null) {
        totalPage = jsonDecode(response.body['pagination']['totalPages'].toString());
        currectPage = jsonDecode(response.body['pagination']['currentPage'].toString());
        totalResult = jsonDecode(response.body['pagination']['totalMatches'].toString());
        var matchData = List<MatchModel>.from(response.body['data']['attributes'].map((e) => MatchModel.fromJson(e)));
        matchModel.addAll(matchData);
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
  }
}
