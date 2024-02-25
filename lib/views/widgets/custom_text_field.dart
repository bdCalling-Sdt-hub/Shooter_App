import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shooter_app/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final Icon? prifixicon;
  final String title;
  final Icon? sufixicons;
  final FormFieldValidator? validator;

  const CustomTextField({
    super.key,
    required this.title,
    this.prifixicon,
    this.sufixicons,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 345.w,
      height: 56.h,
      child: TextFormField(
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFF716665),
          prefixIcon: prifixicon,
          suffixIcon: sufixicons,
          suffixIconColor: AppColors.primaryColor,
          prefixIconColor: AppColors.primaryColor,
          hintText: title,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(
              width: 1.w,
              color: AppColors.primaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.primaryColor,),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
          ),
        ),
      ),
    );
  }
}