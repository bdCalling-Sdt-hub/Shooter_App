import 'dart:convert';

import 'package:get/get.dart';
import '../model/scores_model.dart';
import '../service/api_client.dart';
import '../service/api_constant.dart';

class ScoresController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMyScores();
    getScores();

  }

//===============================> Get Scores <=================================
  RxList scoresModel = [].obs;
  RxBool scoresLoading = false.obs;
  getScores([String matchId = '']) async {
    scoresLoading(true);
    var response = await ApiClient.getData(ApiConstant.scoresEndpoint(matchId));

    if (response.statusCode == 200) {
      scoresModel.value = response.body['data']['attributes'][0]["matchMember"];
      scoresLoading(false);
    }
  }






  ///=====================my scrore=====================>
  RxList myScroesList = [].obs;
  RxBool myScoresLoading = false.obs;
  getMyScores() async {
    myScoresLoading(true);
    var response = await ApiClient.getData(ApiConstant.myScoreEndPoint);

    if (response.statusCode == 200) {
      myScroesList.value = response.body['data']['attributes'];
      myScoresLoading(false);
    }
  }
}
