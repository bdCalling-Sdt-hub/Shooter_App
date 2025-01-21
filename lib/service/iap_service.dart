import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:shooter_app/service/api_client.dart';
import 'package:shooter_app/service/api_constant.dart';

import '../controller/subscription_controller.dart';
import '../routes/app_routes.dart';

final SubscriptionController _subscriptionController = Get.put(SubscriptionController());

const String _kStandardSubscriptionId = 'standard_subcription';
const String _kPremiumSubscriptionId = 'premium_subscription';

class IAPService extends GetxController{
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  final bool _kAutoConsume = Platform.isIOS || true;

  Future<void> listenToPurchaseUpdated(
      List<PurchaseDetails> purchaseDetailsList) async {
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        showPendingUI();
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          handleError(purchaseDetails.error!);
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          await _handleSuccessfulPurchase(purchaseDetails);
          final bool valid = await _verifyPurchase(purchaseDetails);
          if (valid) {
            //unawaited(deliverProduct(purchaseDetails));
          } else {
            _handleInvalidPurchase(purchaseDetails);
            return;
          }
        }
        if (Platform.isAndroid) {
          if (!_kAutoConsume) {
            final InAppPurchaseAndroidPlatformAddition androidAddition =
                _inAppPurchase.getPlatformAddition<
                    InAppPurchaseAndroidPlatformAddition>();
            await androidAddition.consumePurchase(purchaseDetails);
          }
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await _inAppPurchase.completePurchase(purchaseDetails);
          debugPrint("Purchase Subscription Complete");
        }

        Get.offAllNamed(AppRoutes.bottomNavBar);
      }
    }
  }

  void showPendingUI() {}

  void _handleInvalidPurchase(PurchaseDetails purchaseDetails) {
    // handle invalid purchase here if  _verifyPurchase` failed.
    Fluttertoast.showToast(msg: "Invalid Purchase");
  }

  void handleError(IAPError error) {
    Fluttertoast.showToast(msg: error.message);
  }

  // void  _handleSuccessfulPurchase(PurchaseDetails purchaseDetails)async{
  //
  //
  //
  //
  //   ///===work here for in app perches====
  //
  //
  //   //  var body ={
  //   //   "paymentData": "Purchase Date : ${purchaseDetails.transactionDate}, Purchase Id : ${purchaseDetails.purchaseID}, Status : ${purchaseDetails.status}",
  //   //   "package": _kStandardSubscriptionId==purchaseDetails.productID? "Standard":"Premium"
  //   // };
  //   // var response = await ApiClient.postData(ApiConstant.inAppPurchase, json.encode(body));
  //   // if(response.statusCode==200){
  //   //   Get.offAll(CustomNavBar(currentIndex:0),binding: NavBarBinding());
  //   // }
  //     var endDate ;
  //     DateTime now = DateTime.now();
  //     String startDate = '${DateTime.now()}';
  //
  //   if ("standard"==purchaseDetails.productID) {
  //     endDate = "${now.add(const Duration(days: 180))}";
  //   } else {
  //     endDate = "${now.add(const Duration(days: 360))}";
  //   }
  //
  //   _subscriptionController.buySubscription("standard"==purchaseDetails.productID?"20":"30", purchaseDetails.productID, startDate,endDate ,purchaseDetails.purchaseID);
  //
  //   debugPrint("========> complete purchase : $purchaseDetails");
  // }

  Future<void> _handleSuccessfulPurchase(
      PurchaseDetails purchaseDetails) async {
    final expiryDate = DateTime.now().add(Duration(
        days: _kStandardSubscriptionId == purchaseDetails.productID
            ? 180
            : 365)); // 6 months
    debugPrint("Expiry Date $expiryDate ");
    // var body = {
    //   // Add relevant information to the body for your API request
    //   'productId': purchaseDetails.productID,
    //   'purchaseId': purchaseDetails.purchaseID,
    //   'expiryData': expiryDate,
    //   'purchaseDate': DateTime.now(),
    //   'packageName': '<YOUR_PACKAGE_NAME>',
    //   'purchaseToken': purchaseDetails.verificationData.serverVerificationData,
    //   'userId': '<USER_ID>',
    //   // Add other required parameters here...
    // };

    var body = {
      "subscriptionName": _kPremiumSubscriptionId == purchaseDetails.productID
          ? "premium"
          : "standard",
      "subscriptionStartDate": DateTime.now().toString(),
      "subscriptionEndDate": expiryDate.toString(),
      "price": _kStandardSubscriptionId == purchaseDetails.productID
          ? "17.68"
          : "35.53",
      "transactionId": purchaseDetails.purchaseID
    };

    try {
      var response =
          await ApiClient.postData(ApiConstant.subscriptionPurchase, body);
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Processing purchase success.");
        // Navigate to the main screen after successful purchase
      } else {
        // Handle error response from the API
        Fluttertoast.showToast(msg: "Error processing purchase.");
      }
    } catch (e) {
      debugPrint("Check Api call $e ");
      Fluttertoast.showToast(msg: "Error processing purchase: $e");
    }
  }

  Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) {
    // IMPORTANT!! Always verify a purchase before delivering the product.
    // For the purpose of an example, we directly return true.
    return Future<bool>.value(true);
  }

  //
  // static var alReadySubscribed = true.obs;
  //  Future<bool> checkSubscription() async {
  //   try {
  //     // Check if subscription is still valid
  //     //  Called Api and check subscription
  //     var response = await ApiClient.getData(ApiConstant.checkSubscription);
  //     if(response.statusCode==200){
  //
  //       if (response.body['data']['attributes']["isSubscribed"]) {
  //         print("======================== subscribed user");
  //         return true;
  //       } else if (response.body['data']['attributes']["isFree"]) {
  //         print("============================= free user");
  //         if(response.body['data']['attributes']["isSubscribed"]){
  //           alReadySubscribed(true);
  //           update();
  //         }else{
  //           alReadySubscribed(false);
  //           update();
  //         }
  //         return true;
  //       } else {
  //         print("============================= not free and not subscribed user");
  //         return false;
  //       }
  //
  //     }
  //     return false;
  //   } catch (e) {
  //     print('Error checking subscription: $e');
  //   }
  //   return false; // Default to not subscribed
  // }



  static var alReadySubscribed = false.obs;
  static var isFreeUser = false.obs;

  Future<bool> checkSubscription() async {
    try {
      // API call to check subscription
      var response = await ApiClient.getData(ApiConstant.checkSubscription);
      if (response.statusCode == 200) {
        var attributes = response.body['data']['attributes'];

        // Update user status
        isFreeUser.value = attributes["isFree"] ?? false;
        alReadySubscribed.value = attributes["isSubscribed"] ?? false;

        if (alReadySubscribed.value || isFreeUser.value) {
          print("======================== User can use the app");
          return true; // App can be used
        } else {
          print("======================== Redirecting to subscription screen");
          return false; // Redirect to subscription screen
        }
      }
    } catch (e) {
      print('Error checking subscription: $e');
    }
    return false; // Default to redirect if there's an error
  }


}
