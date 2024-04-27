import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:shooter_app/service/api_client.dart';
import 'package:shooter_app/service/api_constant.dart';

class SubscriptionController extends GetxController{


  RxList  subsCriptionData = [
    {
      'duration': '6',
      'price': '565',
    },
    {
      'duration': '12',
      'price': '546',
    },
  ].obs;

  RxInt selectedIndex = (-1).obs;
  var subscriptionName = ''.obs;





  buySubscription(String startDate, endDate )async{

    var body = {
      "subscription":"${subscriptionName.value}",
      "subscriptionStartDate":"$startDate",
      "subscriptionEndDate":"$endDate",
      "price":"10"
    };
    var response = await ApiClient.postData(ApiConstant.subscriptionEndpoint, body);

    if(response.statusCode == 200 || response.statusCode == 201){
      print("buy subscription successful");
    }
  }
}