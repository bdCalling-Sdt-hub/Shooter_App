import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooter_app/service/api_client.dart';
import 'package:shooter_app/service/api_constant.dart';
import 'package:http/http.dart' as http;
import '../utils/app_constants.dart';
import '../views/screens/payment/flutter_local_web_view.dart';

class SubscriptionController extends GetxController {
  AppConstants appConstants = AppConstants();
  RxList subsCriptionData = [
    {
      'duration': '6',
      'price': '565',
      'subscription': 'standard',
    },
    {
      'duration': '12',
      'price': '546',
      'subscription': 'premium',
    },
  ].obs;

  RxInt selectedIndex = 0.obs;
  var subscriptionName = ''.obs;

  ///=================================================>
  void submitForm(BuildContext context, String price, subscription,startDate, endDate) async {
    const url = 'https://www.payfast.co.za/eng/process';



    final response = await http.post(
      Uri.parse(url),

      body: {
        'merchant_id': appConstants.getMerchantId,
        'merchant_key': appConstants.getMerchantKey,
        'amount': '$price',
        'item_name': '$subscription',
        'return_url': AppConstants.return_url,
        'cancel_url': AppConstants.cancel_url,
        'notify_url': AppConstants.notify_url,
      },
    );

    if (response.statusCode == 200 || response.statusCode == 302) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => FlutterLocalWebView(
                    code: response.body,
                    eventId: '',
                    startDate: startDate,
                endDate: endDate,
                subscription: subscription,
                subscriptionPrice: price,
                  )));
      // Handle successful response
      print('Form submitted successfully');
    } else {
      // Handle errors

      print('Error submitting form: ${response.statusCode}');
      print('Error submitting form: ${response.body}');
    }
  }


  ///=====================Buy Subscription=========================>
  buySubscription( String price, subscription,startDate, endDate) async {
    var body = {
      "subscription": "$subscription",
      "subscriptionStartDate": "$startDate",
      "subscriptionEndDate": "$endDate",
      "price": "$price",
      "transactionId":"0012"
    };
    var response =
        await ApiClient.postData(ApiConstant.subscriptionEndpoint, body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("buy subscription successful");
    }
  }
}
