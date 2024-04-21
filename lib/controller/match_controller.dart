import 'package:get/get.dart';
import 'package:shooter_app/model/match_model.dart';

import '../service/api_client.dart';
import '../service/api_constant.dart';
import '../utils/app_constants.dart';

class MatchController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMatchs();
  }

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  Rx<MatchModel> matchModel = MatchModel().obs;

  getMatchs()async{
    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData(ApiConstant.allMatch);


    if(response.statusCode == 200){
      matchModel.value = MatchModel.fromJson(response.body);
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




//
//
// import 'package:get/get.dart';
// import 'package:shooter_app/model/match_model.dart';
// import 'package:shooter_app/model/up_coming_match_model.dart';
//
// import '../service/api_check.dart';
// import '../service/api_client.dart';
// import '../service/api_constant.dart';
// import '../utils/app_constants.dart';
//
// class MatchController extends GetxController {
//   @override
//   void onInit() {
//     super.onInit();
//     getMatches();
//   }
//
//   final rxRequestStatus = Status.loading.obs;
//   void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
//   RxList<Attribute> matches = <Attribute>[].obs;
//   int _currentPage = 1;
//   bool _hasMore = true;
//
//   bool get hasMore => _hasMore;
//
//   Future<void> getMatches({bool refresh = false}) async {
//     if (!refresh) setRxRequestStatus(Status.loading);
//     var response = await ApiClient.getData("${ApiConstant.allMatch}?limit=3&page=$_currentPage");
//
//     if (response.statusCode == 200) {
//       var matchModel = MatchModel.fromJson(response.body);
//       var matchData = matchModel.data?.attributes ?? [];
//       if (refresh) {
//         matches.assignAll(matchData);
//       } else {
//         matches.addAll(matchData);
//       }
//       _currentPage++;
//       _hasMore = _currentPage <= (matchModel.pagination?.totalPages ?? 0);
//       setRxRequestStatus(Status.completed);
//     } else {
//       if (response.statusText == ApiClient.noInternetMessage) {
//         setRxRequestStatus(Status.internetError);
//       } else {
//         setRxRequestStatus(Status.error);
//       }
//     }
//     ApiChecker.checkApi(response);
//   }
//
//   void loadMoreMatches() {
//     getMatches();
//   }
//
//   void refreshMatches() {
//     _currentPage = 1;
//     _hasMore = true;
//     matches.clear();
//     getMatches(refresh: true);
//   }
// }
