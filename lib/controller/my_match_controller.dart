import 'package:get/get.dart';
import 'package:shooter_app/model/my_match_model.dart';
import 'package:shooter_app/service/api_client.dart';
import 'package:shooter_app/service/api_constant.dart';

class MyMatchController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMyMatch();
  }
  
  RxList<MyMatchModel> myMatchModel = <MyMatchModel>[].obs;
  RxBool myMatchLoading = false.obs;
  getMyMatch()async{
    myMatchLoading(true);
    var response =await ApiClient.getData(ApiConstant.myUpComingMatchs);
    
    if(response.statusCode == 200){
      myMatchModel.value = List<MyMatchModel>.from(response.body['data']['attributes'].map((e)=> MyMatchModel.fromJson(e)));
      myMatchLoading(false);
    }
  }


}
