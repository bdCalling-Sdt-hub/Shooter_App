

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shooter_app/controller/registration_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../utils/app_constants.dart';

class FlutterLocalWebView extends StatefulWidget {
  FlutterLocalWebView({super.key,required this.code, required this.body, required this.matchId});
  RegistrationController _registrationController = Get.put(RegistrationController());
  Map body;
  String code;
  String matchId;

  @override
  FlutterLocalWebViewState createState() => FlutterLocalWebViewState();
}

class FlutterLocalWebViewState extends State<FlutterLocalWebView> {
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();

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
          onNavigationRequest: (NavigationRequest request) {

            debugPrint("Navigation request ${request.url}");

            if (request.url==AppConstants.return_url) {

              widget._registrationController.matchRegister(widget.matchId, widget.body);
              return NavigationDecision.prevent;


            } else if (request.url==AppConstants.cancel_url) {

              return NavigationDecision.prevent;
            } else if (request.url==AppConstants.notify_url) {
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
        backgroundColor: Colors.pink,
        title: const Text('Payment'),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _webViewController),
        ],
      ),
    );
  }
}