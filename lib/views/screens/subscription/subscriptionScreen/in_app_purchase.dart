import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';

import '../../../../controller/profileController.dart';
import '../../../../helper/prefs_helper.dart';
import '../../../../service/iap_service.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_constants.dart';

const String _kStandardSubscriptionId = 'standard_subcription';
const String _kPremiumSubscriptionId = 'premium_subscription';


 const Set<String> _kIds = <String>{_kStandardSubscriptionId, _kPremiumSubscriptionId};

class InAppPurchaseScreen extends StatefulWidget {
  const InAppPurchaseScreen({super.key});

  @override
  State<InAppPurchaseScreen> createState() => _InAppPurchaseScreenState();
}

class _InAppPurchaseScreenState extends State<InAppPurchaseScreen> {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  List<String> _notFoundIds = <String>[];
  List<ProductDetails> _products = <ProductDetails>[];
  List<PurchaseDetails> _purchases = <PurchaseDetails>[];
  bool _isAvailable = false;
  bool _purchasePending = false;
  bool _loading = true;
  var selectIndex = (-1).obs;

  @override
  void initState() {
    Get.put(ProfileController());
    getOldSubscription();
    final Stream<List<PurchaseDetails>> purchaseUpdated =
        _inAppPurchase.purchaseStream;
    _subscription =
        purchaseUpdated.listen((List<PurchaseDetails> purchaseDetailsList) {
          IAPService().listenToPurchaseUpdated(purchaseDetailsList);
        }, onDone: () {
          _subscription.cancel();
        }, onError: (Object error) {
          // handle error here.
        });
    initStoreInfo();
    super.initState();
  }

  var subscriptionDateAvaible ;
   getOldSubscription()async{
   subscriptionDateAvaible = await IAPService.checkSubscription();
}

  Future<void> initStoreInfo() async {
    final bool isAvailable = await _inAppPurchase.isAvailable();
    if (!isAvailable) {
      setState(() {
        _isAvailable = isAvailable;
        _products = <ProductDetails>[];
        _purchases = <PurchaseDetails>[];
        _notFoundIds = <String>[];
        _purchasePending = false;
        _loading = false;
      });
      debugPrint("Not Connect In App Purchase");
      return;
    }else{
      debugPrint("Connect In App Purchase");
    }
    if (Platform.isIOS) {
      debugPrint("is IOS");
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition =
      _inAppPurchase
          .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iosPlatformAddition.setDelegate(ExamplePaymentQueueDelegate());
    }

    final ProductDetailsResponse productDetailResponse =
    await _inAppPurchase.queryProductDetails(_kIds);
    if (productDetailResponse.error != null) {
      setState(() {
        _isAvailable = isAvailable;
        _products = productDetailResponse.productDetails;
        _purchases = <PurchaseDetails>[];
        _notFoundIds = productDetailResponse.notFoundIDs;
        _purchasePending = false;
        _loading = false;
      });
      return;
    }
    debugPrint("Query Product Details : ${productDetailResponse.productDetails}");
    if (productDetailResponse.productDetails.isEmpty) {
      setState(() {
        _isAvailable = isAvailable;
        _products = productDetailResponse.productDetails;
        _purchases = <PurchaseDetails>[];
        _notFoundIds = productDetailResponse.notFoundIDs;
        _purchasePending = false;
        _loading = false;
      });
      _notFoundIds.forEach((element) {
        debugPrint("=======> id not found  $element");
      });
      return;
    }

    setState(() {
      _isAvailable = isAvailable;
      _products = productDetailResponse.productDetails;
      _notFoundIds = productDetailResponse.notFoundIDs;
      _purchasePending = false;
      _loading = false;
    });
  }

  payNow(ProductDetails productDetails) {
    late PurchaseParam purchaseParam;

    if (Platform.isAndroid) {
      purchaseParam = GooglePlayPurchaseParam(
          productDetails: productDetails, changeSubscriptionParam: null);
    } else {
      purchaseParam = PurchaseParam(
        productDetails: productDetails,
      );
    }
    _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
  }

  void restorePurchases() async {
    final bool available = await InAppPurchase.instance.isAvailable();
    if (!available) {
      showAlert('Error', 'In-app purchases are not available on this device.');
      return;
    }
    try {
      var isSubscribed= await IAPService.checkSubscription();

      if(isSubscribed){
        showAlert('Restoring Purchases', 'Your purchases are being restored.');
      }else{
        showAlert('Restoring Purchases', 'Your purchase is not available.');
      }


    } catch (e) {
      showAlert('Error', 'Failed to restore purchases: $e');
    }
  }

  void showAlert(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }


  @override
  void dispose() {
    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition =
      _inAppPurchase
          .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      iosPlatformAddition.setDelegate(null);
    }
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          title: const Text("Purchase Subscription"),
        ),
        body: _loading
            ? const Center(child: CircularProgressIndicator())
            : Column(
          children: [
            Flexible(
              child: ListView.builder(
                  itemCount: _products.length,
                  itemBuilder: (context, index) {
                    ProductDetails productDetails = _products[index];
                    // return ListTile(
                    //   title: Text(productDetails.title),
                    //   subtitle: Text(productDetails.description),
                    //   trailing: ElevatedButton(
                    //       onPressed: () {
                    //         payNow(productDetails);
                    //       }, child: Text(productDetails.price)),
                    // );
                    var duration =
                    productDetails.id == _kStandardSubscriptionId
                        ? "6 Month"
                        : "1 year";



                    return Obx(
                          () => GestureDetector(
                        onTap: () {
                          selectIndex.value = index;
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 10.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                  color: index == selectIndex.value
                                      ? AppColors.primaryColor
                                      : AppColors.greyColor)),
                          child: ListTile(
                            title: Text(
                              productDetails.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                  color: Colors.redAccent),
                            ),
                            subtitle: Text(productDetails.description),
                            trailing:Text("${productDetails.price}/$duration",style:TextStyle(fontWeight: FontWeight.w500,fontSize: 12.sp),),
                          ),
                        ),
                      ),
                    );
                  }),
            ),

            NewCustomButton(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                onTap: () {
                    if(subscriptionDateAvaible){
                      Fluttertoast.showToast(msg: "You have already purchased.",toastLength:Toast.LENGTH_LONG,gravity: ToastGravity.TOP,fontSize: 16,backgroundColor: Colors.green);
                    }else{
                      payNow(_products[selectIndex.value]);
                    }

                },
                text: "Buy Now"),

            const SizedBox(
              height: 25,
            ),

            NewCustomButton(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                color: Colors.red.shade300,
                onTap: () {
                  restorePurchases();
                },
                text: "Restore"),
            const SizedBox(
              height: 50,
            )
          ],
        ));
  }
}

// GooglePlayPurchaseDetails? _getOldSubscription(
//     ProductDetails productDetails, Map<String, PurchaseDetails> purchases) {
//   // This is just to demonstrate a subscription upgrade or downgrade.
//   // This method assumes that you have only 2 subscriptions under a group, 'subscription_silver' & 'subscription_gold'.
//   // The 'subscription_silver' subscription can be upgraded to 'subscription_gold' and
//   // the 'subscription_gold' subscription can be downgraded to 'subscription_silver'.
//   // Please remember to replace the logic of finding the old subscription Id as per your app.
//   // The old subscription is only required on Android since Apple handles this internally
//   // by using the subscription group feature in iTunesConnect.
//   GooglePlayPurchaseDetails? oldSubscription;
//   if (productDetails.id == _kStandardSubscriptionId &&
//       purchases[_kPremiumSubscriptionId] != null) {
//     oldSubscription =
//     purchases[_kPremiumSubscriptionId]! as GooglePlayPurchaseDetails;
//   } else if (productDetails.id == _kPremiumSubscriptionId &&
//       purchases[_kStandardSubscriptionId] != null) {
//     oldSubscription =
//     purchases[_kStandardSubscriptionId]! as GooglePlayPurchaseDetails;
//   }
//   return oldSubscription;
// }
//

class ExamplePaymentQueueDelegate implements SKPaymentQueueDelegateWrapper {
  @override
  bool shouldContinueTransaction(
      SKPaymentTransactionWrapper transaction, SKStorefrontWrapper storefront) {
    return true;
  }

  @override
  bool shouldShowPriceConsent() {
    return false;
  }
}

class NewCustomButton extends StatelessWidget {
  NewCustomButton({super.key,this.color,this.textStyle, this.padding =EdgeInsets.zero, required this.onTap,required this.text ,this.loading=false,this.width,this.height});
  Function() onTap;
  String text;
  bool loading;
  double? height;
  double? width;
  Color? color;
  EdgeInsetsGeometry padding;
  TextStyle? textStyle;


  @override

  Widget build(BuildContext context) {
    return  Padding(
      padding: padding,
      child: ElevatedButton(onPressed:loading? (){}:onTap,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r)
            ),
            backgroundColor: color??AppColors.primaryColor,
            minimumSize:Size(width??Get.width, height??56.h),

          ),
          child:loading?  SizedBox(
            height: 20.h,
            width: 20.h,
            child: const CircularProgressIndicator(color: Colors.white,),
          ):Text(text,style:textStyle)),
    );
  }
}