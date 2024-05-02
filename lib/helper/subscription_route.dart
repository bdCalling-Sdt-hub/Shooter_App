import 'package:get/get.dart';
import 'package:shooter_app/routes/app_routes.dart';

class SubscriptionRouteHelper{
 static Future<void> subscriptionRoute(bool subscriptionStatas)async{
    if(subscriptionStatas){
      null;
    }else{
      Get.offAllNamed(AppRoutes.subscriptionScreen);
    }
  }
}