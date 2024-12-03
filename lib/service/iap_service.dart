
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';

import '../controller/subscription_controller.dart';

final SubscriptionController _subscriptionController =
Get.put(SubscriptionController());

class IAPService {

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

          _handleSuccessfulPurchase(purchaseDetails);
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
      }
    }
  }


  void showPendingUI() {


  }

  void _handleInvalidPurchase(PurchaseDetails purchaseDetails) {
    // handle invalid purchase here if  _verifyPurchase` failed.
    Fluttertoast.showToast(msg:"Invalid Purchase");
  }
  void handleError(IAPError error) {
    Fluttertoast.showToast(msg:error.message);

  }

  void  _handleSuccessfulPurchase(PurchaseDetails purchaseDetails)async{
    // var body ={
    //   "paymentData": "Purchase Date : ${purchaseDetails.transactionDate}, Purchase Id : ${purchaseDetails.purchaseID}, Status : ${purchaseDetails.status}",
    //   "package": _kStandardSubscriptionId==purchaseDetails.productID? "Standard":"Premium"
    // };
    // var response = await ApiClient.postData(ApiConstant.inAppPurchase, json.encode(body));
    // if(response.statusCode==200){
    //   Get.offAll(CustomNavBar(currentIndex:0),binding: NavBarBinding());
    // }
      var endDate ;
      DateTime now = DateTime.now();
      String startDate = '${DateTime.now()}';

    if ("standard"==purchaseDetails.productID) {
      endDate = "${now.add(const Duration(days: 180))}";
    } else {
      endDate = "${now.add(const Duration(days: 360))}";
    }

    _subscriptionController.buySubscription("standard"==purchaseDetails.productID?"20":"30", purchaseDetails.productID, startDate,endDate ,purchaseDetails.purchaseID);

    debugPrint("========> complete purchase : $purchaseDetails");
  }

  Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) {
    // IMPORTANT!! Always verify a purchase before delivering the product.
    // For the purpose of an example, we directly return true.
    return Future<bool>.value(true);
  }

}