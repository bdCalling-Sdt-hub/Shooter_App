import 'dart:convert';

import 'package:get/get.dart';
import '../model/scores_model.dart';
import '../service/api_client.dart';
import '../service/api_constant.dart';

class ScoresController extends GetxController {

//===============================> Get Scores <=================================
  RxList scoresModel = [].obs;
  RxBool scoresLoading = false.obs;
  getScores(String matchId) async {
    scoresLoading(true);
    var response = await ApiClient.getData(ApiConstant.scoresEndpoint(matchId));

    if (response.statusCode == 200) {
      scoresModel.value = response.body['data']['attributes'][0]["matchMember"];
      scoresLoading(false);
    }
  }
}
