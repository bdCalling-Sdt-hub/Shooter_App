import 'package:get/get.dart';
import 'package:shooter_app/model/my_completed_match_model.dart';
import '../service/api_client.dart';
import '../service/api_constant.dart';

class MyCompleteMatchController extends GetxController {
  RxInt page = 1.obs;
  var totalPage = (-1);
  var currectPage = (-1);
  var totalResult = (-1);

  RxBool myCompletMatchLoading = false.obs;
  RxList<MyCompleteMatchModel> myCompleteMatchModel =<MyCompleteMatchModel> [].obs;

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
    }
  }

  Future<void> getMatchs() async {
    if (page.value == 1) {
      myCompletMatchLoading(true);
    }

    var response =
        await ApiClient.getData('${ApiConstant.allMatch}?limit=20&page=$page');

    if (response.statusCode == 200) {
      if (response.body['data']['attributes'] != null) {
        // totalPage =jsonDecode(response.body['pagination']['totalPages'].toString());
        // currectPage =jsonDecode(response.body['pagination']['currentPage'].toString());
        // totalResult =jsonDecode(response.body['pagination']['totalMatches'].toString());
        var matchData = List<MyCompleteMatchModel>.from(response.body['data']['attributes'].map((e) => MyCompleteMatchModel.fromJson(e)));
        myCompleteMatchModel.addAll(matchData);
       myCompletMatchLoading(false);
        update();
      }
    }
  }
}
