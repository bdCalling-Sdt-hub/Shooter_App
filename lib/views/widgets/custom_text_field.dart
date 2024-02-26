import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shooter_app/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final Widget? prifixicon;
  final String title;
  final double contenpaddingHorizontal;
  final double contenpaddingVertical;
  final Widget? sufixicons;
  final FormFieldValidator? validator;

  const CustomTextField({
    super.key,
    required this.contenpaddingHorizontal,
    required this.contenpaddingVertical,
    required this.title,
    this.prifixicon,
    this.sufixicons,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 345.w,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: TextFormField(
          validator: validator,
          cursorColor: AppColors.primaryColor,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: contenpaddingHorizontal.toDouble(),
                vertical: contenpaddingVertical.toDouble()),
            filled: true,
            fillColor: const Color(0xFF716665),
            prefixIcon: prifixicon,
            suffixIcon: sufixicons,
            errorStyle: TextStyle(color: AppColors.primaryColor),
            suffixIconColor: AppColors.primaryColor,
            prefixIconColor: AppColors.primaryColor,
            hintText: title,
            hintStyle: const TextStyle(color: Colors.white),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                width: 1.w,
                color: AppColors.primaryColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.w,
                color: AppColors.primaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.w,
                color: AppColors.primaryColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.w,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
