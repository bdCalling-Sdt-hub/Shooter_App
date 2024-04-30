import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shooter_app/helper/prefs_helper.dart';
import 'package:shooter_app/service/api_check.dart';
import 'package:shooter_app/service/api_client.dart';
import 'package:shooter_app/service/api_constant.dart';
import 'package:shooter_app/utils/app_constants.dart';

import '../routes/app_routes.dart';
import 'data_controller.dart';

class AuthController extends GetxController {
  ///<===== ============== sign in =========== =====>
  final emailController = TextEditingController();
  final passController = TextEditingController();
  var signInLoading = false.obs;
  final dataController = Get.put(DataController(), permanent: true);

  handleSignIn() async {
    signInLoading(true);
    Map<String, String> header = {'Content-Type': 'application/json'};
    var body = {
      'email': emailController.text.trim(),
      'password': passController.text,
    };
    var response = await ApiClient.postData(
        ApiConstant.signIn, json.encode(body),
        headers: header);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.body;
      if (!data['data']['attributes']['isAdmin']) {
        await PrefsHelper.setString(AppConstants.userId, data['data']['attributes']['_id']);
        await PrefsHelper.setString(AppConstants.subscription, data['data']['attributes']['subscription']);
        await PrefsHelper.setString(
            AppConstants.bearerToken, data['data']['token']);
        await PrefsHelper.setBool(AppConstants.isLogged, true);
        await PrefsHelper.setString(AppConstants.subscription,
            data['data']['attributes']['subscription']);
        await PrefsHelper.setString(AppConstants.signInType, "General User");
        await dataController.setData(
          nameD: data['data']['attributes']['name'] ?? "",
          emailD: data['data']['attributes']['email'] ?? "",
          passwordD: "",
          imageD: data['data']['attributes']['image']['publicFileURL'] ?? "",
          userid: data['data']['attributes']['_id'] ?? "",
        );
        debugPrint("ssss ${dataController.image}");
        Get.offAllNamed(AppRoutes.bottomNavBar);

        emailController.clear();
        passController.clear();
      }
    }
    signInLoading(false);
  }

  /// <======================  Google Sign in ===========>

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future signInWithGoogle() async {
    // Trigger Google sign-in flow
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // Check if user cancelled the sign-in
      if (googleUser != null) {
        // Get a Google authentication object
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in with credential
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        debugPrint("Google sign in complete");
      }
    } on Exception catch (e) {
      debugPrint("Google sign in error $e");
    }
  }

  /// <=========== facebook auth ================>

  Future signInWithFacebook() async {
    // Trigger Facebook login flow (customizable options available)
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Check if login was cancelled
      if (loginResult.status == LoginStatus.cancelled) {
        return null;
      }
      final credential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Sign in with credential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      debugPrint('facebook sign in complete ');
    } on Exception catch (e) {
      debugPrint('facebook sign in error : $e');
    }
  }

  ///<===== ============== sign up =============== =====>

  final userNameController = TextEditingController();
  final emailSignupCtrl = TextEditingController();
  final passSignupCtrl = TextEditingController();

  var signUpLoading = false.obs;

  handleSignUp() async {
    signUpLoading(true);
    Map<String, String> header = {'Content-Type': 'application/json'};
    var body = {
      'name': userNameController.text.trim(),
      'email': emailSignupCtrl.text.trim(),
      'password': passSignupCtrl.text,
    };
    var response = await ApiClient.postData(
      ApiConstant.signUp,
      json.encode(body),
      headers: header,
    );
    if (response.statusCode == 200) {
      debugPrint("Complete Sign up");
      Get.toNamed(AppRoutes.verifyEmailScreen, parameters: {
        "email": emailSignupCtrl.text.trim(),
        "screenType": "signup"
      });
    }
    signUpLoading(false);
  }

  /// <-------------------------- forgot password --------------->

  var forgotLoading = false.obs;

  forgotPassword(String email) async {
    forgotLoading(true);
    var body = {"email": email};
    Map<String, String> header = {'Content-Type': 'application/json'};
    var response = await ApiClient.postData(
        ApiConstant.forgot, json.encode(body),
        headers: header);
    if (response.statusCode == 200) {
      Get.toNamed(AppRoutes.verifyEmailScreen,
          parameters: {"email": email, "screenType": "forgot"});
    } else {
      Fluttertoast.showToast(msg: response.statusText ?? "");
    }
    forgotLoading(false);
  }

  ///  resend otp

  var resendOtpLoading = false.obs;

  resendOtp(String email) async {
    resendOtpLoading(true);
    var body = {"email": email};
    Map<String, String> header = {'Content-Type': 'application/json'};
    var response = await ApiClient.postData(
        ApiConstant.forgot, json.encode(body),
        headers: header);
    if (response.statusCode == 200) {
    } else {
      Fluttertoast.showToast(
          msg: response.statusText ?? "",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          gravity: ToastGravity.CENTER);
    }
    resendOtpLoading(false);
  }


//=================================> Verify Mail <==============================
  var verifyLoading = false.obs;
  verifyEmail(
    Map<String, String?> data,
    String code,
  ) async {
    verifyLoading(true);
    var body = {"email": data['email'], "code": code};
    Map<String, String> header = {'Content-Type': 'application/json'};
    var response = await ApiClient.postData(
        ApiConstant.verifyCode, json.encode(body),
        headers: header);
    if (response.statusCode == 200) {
      if (data['screenType'] == "forgot") {
        Get.toNamed(AppRoutes.setPasswordScreen, arguments: data['email']);
      } else if (data['screenType'] == "signup") {
        Get.offAllNamed(AppRoutes.signInScreen);
      }
      else {
        Get.offAllNamed(AppRoutes.freetrialScreen);
      }
    } else {
      Fluttertoast.showToast(msg: response.statusText ?? "");
    }
    verifyLoading(false);
  }

  /// <-------------------------- set password --------------->

  var setPasswordLoading = false.obs;

  setPassword(String email, String password) async {
    setPasswordLoading(true);
    var body = {"email": email, "password": password};
    Map<String, String> header = {'Content-Type': 'application/json'};
    var response = await ApiClient.postData(
        ApiConstant.setPassword, json.encode(body),
        headers: header);
    if (response.statusCode == 200) {
      Get.offNamed(AppRoutes.signInScreen);
    } else {
      debugPrint("error set password ${response.statusText}");
      Fluttertoast.showToast(msg: "${response.statusText}");
    }
    setPasswordLoading(false);
  }
}
