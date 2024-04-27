import 'package:get/get.dart';
import '../model/scores_model.dart';
import '../service/api_client.dart';
import '../service/api_constant.dart';

class ScoresController extends GetxController{


//===============================> Get Scores <=================================
  RxList<ScoresModel> scoresModel = <ScoresModel>[].obs;
  RxBool scoresLoading = false.obs;
  getScores()async{
    scoresLoading(true);
    var response = await ApiClient.getData(ApiConstant.scoresEndpoint);

    if(response.statusCode == 200){
      scoresModel.value = List<ScoresModel>.from(response.body['data']
      ['attributes']
          .map((e) => ScoresModel.fromJson(e)));
      scoresLoading(false);
    }
  }
  }

