import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:intl/intl.dart';
import 'package:shooter_app/model/match_model.dart';
import '../service/api_client.dart';
import '../service/api_constant.dart';
import '../utils/app_constants.dart';

class MatchController extends GetxController{

  RxInt page = 1.obs;
  var totalPage = (-1);
  var currectPage = (-1);
  var totalResult = (-1);
  bool isLoadMore = true;
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  RxList<MatchModel> matchModel = <MatchModel>[].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMatchs();
    loadMore();
  }

  loadMore(){
    if(totalPage > page.value){
      page.value+=1;
      isLoadMore = true;
      getMatchs();
    }else{
      isLoadMore = false;
    }
  }



  getMatchs()async{

    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData('${ApiConstant.allMatch}?limit=3&page=$page');


    if(response.statusCode == 200){
      totalPage = jsonDecode(response.body['pagination']['totalPages'].toString());
      currectPage = jsonDecode(response.body['pagination']['currentPage'].toString());
      totalResult = jsonDecode(response.body['pagination']['totalMatches'].toString());
      var matchData = List<MatchModel>.from(response.body['data']['attributes'].map((e)=> MatchModel.fromJson(e)));

      if(page == 1){
        matchModel.assignAll(matchData);
      }else{
        matchModel.addAll(matchData);
      }

      refresh();
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

