import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooter_app/controller/registration_controller.dart';
import 'package:shooter_app/controller/subscription_controller.dart';
import 'package:shooter_app/utils/app_colors.dart';
import 'package:shooter_app/views/widgets/custom_loader.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../utils/app_constants.dart';

class FlutterLocalWebView extends StatefulWidget {
  FlutterLocalWebView(
      {super.key,
      required this.code,
      this.body,
      required this.eventId,
      this.price,
      this.subscription,
      this.startDate,
      this.endDate,
      this.subscriptionPrice,
        this.matchesList,
      this.className});

  final RegistrationController _registrationController =
      Get.put(RegistrationController());
  final SubscriptionController _subscriptionController =
      Get.put(SubscriptionController());
  Map? body;
  String code;
  String eventId;
  String? price;
  String? subscription;
  String? startDate;
  String? endDate;
  String? subscriptionPrice;
  String? className;
  List? matchesList;

  @override
  FlutterLocalWebViewState createState() => FlutterLocalWebViewState();
}

class FlutterLocalWebViewState extends State<FlutterLocalWebView> {
  late WebViewController _webViewController;
  bool loading = true;

  getUrlQueryPrams(String url) async {
    Uri uri = Uri.parse(url);
    Map<String, String> queryParams = uri.queryParameters;
    // Print the query parameters
    print("=============================Query Parameters: $queryParams");
    return queryParams;
  }

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () {

      setState(() {
        loading = false;
      });

    });

    _webViewController = WebViewController()
      ..enableZoom(true)
      // Consider a more restrictive JavaScriptMode for production
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onNavigationRequest: (NavigationRequest request) async {
            debugPrint("Navigation request ${request.url}");

            if (request.url == AppConstants.return_url) {
              Map<String, String> data = await getUrlQueryPrams(request.url);
              print("==============data = $data");
              if (widget.eventId == "") {
                widget._subscriptionController.buySubscription(
                    "${widget.subscriptionPrice}",
                    widget.subscription,
                    widget.startDate,
                    widget.endDate);
              } else {
                widget._registrationController.matchRegister(widget.eventId, widget.price, "", widget.className, widget.matchesList!.toList());
              }

              return NavigationDecision.prevent;
            } else if (request.url == AppConstants.cancel_url) {
              Map<String, String> data = await getUrlQueryPrams(request.url);
              print("==============data = $data");

              if (widget.eventId == "") {
                widget._subscriptionController.buySubscription(
                    "${widget.subscriptionPrice}",
                    widget.subscription,
                    widget.startDate,
                    widget.endDate);
              } else {
                // widget._registrationController.matchRegister(widget.eventId, widget.price, 'oidjof', widget.className, widget.matchesList!.toList());
              }

              // return NavigationDecision.prevent;
            } else if (request.url == AppConstants.notify_url) {
              return NavigationDecision.prevent;
            }

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadHtmlString(widget.code);





  }

  @override
  void dispose() {
    // Consider clearing cache only when necessary
    // _webViewController.clearCache();
    _webViewController.clearLocalStorage();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.primaryColor,
        title: const Text('Payment'),
      ),
      body: Stack(
        children: [
          loading? CustomLoader() :  WebViewWidget(controller: _webViewController),
        ],
      ),
    );
  }
}
