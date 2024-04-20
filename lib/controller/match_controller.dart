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