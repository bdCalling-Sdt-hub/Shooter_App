import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shooter_app/helper/prefs_helper.dart';
import 'package:shooter_app/helper/time_format.dart';
import 'package:shooter_app/service/api_check.dart';
import 'package:shooter_app/service/api_client.dart';
import 'package:shooter_app/service/api_constant.dart';
import 'package:shooter_app/utils/app_constants.dart';
import 'package:shooter_app/views/widgets/custom_loader.dart';


import '../routes/app_routes.dart';
import 'data_controller.dart';

class AuthController extends GetxController {
  ///<===== ============== sign in =========== =====>
  final emailController = TextEditingController();
  final passController = TextEditingController();
  var signInLoading = false.obs;
  final dataController = Get.put(DataController(), permanent: true);

  handleSignIn(int loginType) async {
    signInLoading(true);
    Map<String, String> header = {'Content-Type': 'application/json'};
    var body = {
      'email': emailController.text.trim(),
      'password': passController.text,
      "loginType" : loginType
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

        ///=========================Check Subscription============================>
        await TimeFormatHelper.isFutureDate(data['data']['attributes']['subscriptionEndDate']);



        await PrefsHelper.setString(AppConstants.signInType, "General User");
        await dataController.setData(
          nameD: data['data']['attributes']['name'] ?? "",
          emailD: data['data']['attributes']['email'] ?? "",
          passwordD: "",
          imageD: data['data']['attributes']['image']['publicFileURL'] ?? "",
          userid: data['data']['attributes']['_id'] ?? "",
        );
        debugPrint("ssss ${dataController.image}");
        var isSubscription= await PrefsHelper.getBool(AppConstants.isFutureDate);
        if(isSubscription){
          Get.offAllNamed(AppRoutes.bottomNavBar);
        }else{
          Get.offAllNamed(AppRoutes.subscriptionScreen);
        }


        emailController.clear();
        passController.clear();
      }
    }
    signInLoading(false);
  }

  /// <======================  Apple Sign in ===========>
  Future<void> signInWithApple() async {
    // Trigger the authentication flow
    try {

      final authProvider =  AppleAuthProvider();

      UserCredential userData =
      await FirebaseAuth.instance.signInWithProvider(authProvider);
      if(userData.user != null){
        print("=======> Apple Sign in Complete ");
          var user=userData.user;
        Map<String, String> header = {'Content-Type': 'application/json'};
        var body = {
          "loginType":4,
          "appleId":user!.uid
        };
        var response = await ApiClient.postData(
            ApiConstant.signIn, json.encode(body),
            headers: header);


        print('================> response ${response.body}');


        if (response.statusCode == 200) {
          print("================================================================== ${response.body}");
          Map<String, dynamic> data = response.body;
          if (!data['data']['attributes']['isAdmin']) {
            await PrefsHelper.setString(AppConstants.userId, data['data']['attributes']['_id']);
            await PrefsHelper.setString(AppConstants.subscription, data['data']['attributes']['subscription']);
            await PrefsHelper.setString(AppConstants.bearerToken, data['data']['token']);
            await PrefsHelper.setBool(AppConstants.isLogged, true);
            await PrefsHelper.setString(AppConstants.subscription,
                data['data']['attributes']['subscription']);

            ///=========================Check Subscription============================>
            await TimeFormatHelper.isFutureDate(data['data']['attributes']['subscriptionEndDate']);



            await PrefsHelper.setString(AppConstants.signInType, "General User");
            await dataController.setData(
              nameD: data['data']['attributes']['name'] ?? "",
              emailD: data['data']['attributes']['email'] ?? "",
              passwordD: "",
              imageD: data['data']['attributes']['image']['publicFileURL'] ?? "",
              userid: data['data']['attributes']['_id'] ?? "",
            );
            var isSubscription= await PrefsHelper.getBool(AppConstants.isFutureDate);
            if(isSubscription){
              Get.offAllNamed(AppRoutes.bottomNavBar);
            }else{
              Get.offAllNamed(AppRoutes.subscriptionScreen);
            }


            emailController.clear();
            passController.clear();
          }
        }


        print("====================${user.email}");
        print("====================${user.displayName}");




      }
    } on Exception catch (e) {
      debugPrint("Oops, Something wrong error $e");

    }
  }

  /// <======================  Google Sign in ===========>
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle(BuildContext context) async {


    try {
           // googleSignIn.signOut();
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      print('===============================> google sign in');
      if (googleSignInAccount != null) {

        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        print('===============================> google sign in============');
        final UserCredential authResult = await _auth.signInWithCredential(credential);

        final User? user = authResult.user;

        if (user != null) {
          Map<String, String> header = {'Content-Type': 'application/json'};
          var body = {
            'email': '${user.email}',
            "loginType" : 1
          };
          var response = await ApiClient.postData(
              ApiConstant.signIn, json.encode(body),
              headers: header);


          print('================> response ${response.body}');


          if (response.statusCode == 200) {
            print("================================================================== ${response.body}");
            Map<String, dynamic> data = response.body;
            if (!data['data']['attributes']['isAdmin']) {
              await PrefsHelper.setString(AppConstants.userId, data['data']['attributes']['_id']);
              await PrefsHelper.setString(AppConstants.subscription, data['data']['attributes']['subscription']);
              await PrefsHelper.setString(AppConstants.bearerToken, data['data']['token']);
              await PrefsHelper.setBool(AppConstants.isLogged, true);
              await PrefsHelper.setString(AppConstants.subscription,
                  data['data']['attributes']['subscription']);

              ///=========================Check Subscription============================>
              await TimeFormatHelper.isFutureDate(data['data']['attributes']['subscriptionEndDate']);



              await PrefsHelper.setString(AppConstants.signInType, "General User");
              await dataController.setData(
                nameD: data['data']['attributes']['name'] ?? "",
                emailD: data['data']['attributes']['email'] ?? "",
                passwordD: "",
                imageD: data['data']['attributes']['image']['publicFileURL'] ?? "",
                userid: data['data']['attributes']['_id'] ?? "",
              );
              var isSubscription= await PrefsHelper.getBool(AppConstants.isFutureDate);
              if(isSubscription){
                Get.offAllNamed(AppRoutes.bottomNavBar);
              }else{
                Get.offAllNamed(AppRoutes.subscriptionScreen);
              }



              emailController.clear();
              passController.clear();
            }
          }


          print("====================${user.email}");
          print("====================${user.displayName}");



          // Get.offAllNamed(AppRoutes.bottomNavBar);
        }

        return user;
      } else {
        print("Sign in with Google canceled by user.");
        return null;
      }
    } catch (error,s) {
      print("================<>Error signing in with Google: $error");
      print("================<>Error signing in with Google: $s");
      return null;
    }
  }
  /// <=========== facebook auth ================>

  Future signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login(permissions:["public_profile","email"]);

      // if (loginResult.status == LoginStatus.cancelled) {
      //   return null;
      // }
      final credential =
      FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);


      // Sign in with credential
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
      if(userCredential.user !=null){
        Map<String, String> header = {'Content-Type': 'application/json'};
        var body ={
          "loginType":2,
          "facebookId":userCredential.user!.uid
        };
        var response = await ApiClient.postData(
            ApiConstant.signIn, json.encode(body),
            headers: header);


        print('================> response ${response.body}');


        if (response.statusCode == 200) {
          print("================================================================== ${response.body}");
          Map<String, dynamic> data = response.body;
          if (!data['data']['attributes']['isAdmin']) {
            await PrefsHelper.setString(AppConstants.userId, data['data']['attributes']['_id']);
            await PrefsHelper.setString(AppConstants.subscription, data['data']['attributes']['subscription']);
            await PrefsHelper.setString(AppConstants.bearerToken, data['data']['token']);
            await PrefsHelper.setBool(AppConstants.isLogged, true);
            await PrefsHelper.setString(AppConstants.subscription,
                data['data']['attributes']['subscription']);

            ///=========================Check Subscription============================>
            await TimeFormatHelper.isFutureDate(data['data']['attributes']['subscriptionEndDate']);





            await PrefsHelper.setString(AppConstants.signInType, "General User");
            await dataController.setData(
              nameD: data['data']['attributes']['name'] ?? "",
              emailD: data['data']['attributes']['email'] ?? "",
              passwordD: "",
              imageD: data['data']['attributes']['image']['publicFileURL'] ?? "",
              userid: data['data']['attributes']['_id'] ?? "",
            );

            var isSubscription= await PrefsHelper.getBool(AppConstants.isFutureDate);
            if(isSubscription){
              Get.offAllNamed(AppRoutes.bottomNavBar);
            }else{
              Get.offAllNamed(AppRoutes.subscriptionScreen);
            }


            emailController.clear();
            passController.clear();
          }
        }






    }

      debugPrint('facebook sign in complete ${userCredential.user}');
    } on Exception catch (e, s) {
      debugPrint('facebook sign in error : $e');
      debugPrint('facebook sign in error : $s');
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