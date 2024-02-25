import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/dimentions.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    super.key,
  });

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      blur: 20,
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeDefault,
            vertical: Dimensions.paddingSizeDefault),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.r),
            topRight: Radius.circular(40.r),
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ///--------------------------user name------------------------------------>
              TextFormField(
                decoration: InputDecoration(
                    labelText: "User name",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.borderColor))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }
                },
              ),

              SizedBox(
                height: 16.h,
              ),

              ///--------------------------Email------------------------------------>
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.borderColor))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                },
              ),
              SizedBox(
                height: 16.h,
              ),

              ///--------------------------Password------------------------------------>
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.borderColor)),
                  // suffixIcon: SvgPicture.asset(AppIcons.obscure_true)
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your Password";
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
