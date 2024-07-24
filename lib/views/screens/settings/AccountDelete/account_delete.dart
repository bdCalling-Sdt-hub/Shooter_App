import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shooter_app/routes/app_routes.dart';
import 'package:shooter_app/views/widgets/custom_button.dart';
import 'package:shooter_app/views/widgets/custom_text_field.dart';

import '../../../../helper/prefs_helper.dart';
import '../../../../utils/app_constants.dart';

class AccountDelete extends StatelessWidget {
   AccountDelete({super.key});
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController description = TextEditingController();
  final GlobalKey<FormState> _globalKey=GlobalKey<FormState>();
   var loading=false.obs;
   final GoogleSignIn googleSignIn = GoogleSignIn();

  submit()async{
    loading(true);
    Future.delayed(const Duration(seconds: 2),()async{
      loading(false);
      emailCtrl.clear();
      description.clear();
      await PrefsHelper.remove(
          AppConstants.isLogged);
      await PrefsHelper.remove(
          AppConstants.userId);
      // await PrefsHelper.remove(AppConstants.bearerToken);
      await PrefsHelper.remove(
          AppConstants.subscription);
      googleSignIn
          .signOut();
      Fluttertoast.showToast(msg: "Your profile will be reviewed and the account will be removed.",toastLength: Toast.LENGTH_LONG,gravity: ToastGravity.TOP);
      Get.offAllNamed(AppRoutes.signInScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Delete Account"),centerTitle: true,),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: _globalKey,
          child: Column(
            children: [
              SizedBox(height: 20.h,),
              CustomTextField(controller: emailCtrl,hintText: "Enter your email",isEmail: true,),
              SizedBox(height: 10.h,),
              CustomTextField(controller: description,maxLines: 4,hintText: "Enter description",),
              SizedBox(height: 20.h,),
              Obx(()=>
                 CustomButton(title: "Submit", onpress: (){
                   if(_globalKey.currentState!.validate()){
                     submit();
                   }

                },
                 loading: loading.value,
                 ),
              )
            ],
          ),
        ),
      ),
    );
  }



}
