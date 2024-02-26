import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shooter_app/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final Widget? prifixicon;
  final String hintText;
  final double contenpaddingHorizontal;
  final double contenpaddingVertical;
  final Widget? sufixicons;
  final FormFieldValidator? validator;

  const CustomTextField({
    super.key,
    required this.contenpaddingHorizontal,
    required this.contenpaddingVertical,
    required this.hintText,
    this.prifixicon,
    this.sufixicons,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      cursorColor: AppColors.primaryColor,
      style: const TextStyle(color:Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            horizontal: contenpaddingHorizontal.toDouble(),
            vertical: contenpaddingVertical.toDouble()),
        filled: true,
        fillColor: const Color(0xFF716665),
        prefixIcon: prifixicon,
        suffixIcon: sufixicons,
        prefixIconConstraints: BoxConstraints(
          minHeight: 24.w,
          minWidth: 24.w
        ),
        errorStyle: TextStyle(color: AppColors.primaryColor),
        suffixIconColor: AppColors.primaryColor,
        prefixIconColor: AppColors.primaryColor,
        hintText: hintText,
        hintStyle: const TextStyle(color:AppColors.whiteE8E8E8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            width: 1.w,
            color: AppColors.primaryColor,
          ),
        ),
        errorBorder: _buildOutlineInputBorder(),
        focusedBorder: _buildOutlineInputBorder(),
        enabledBorder: _buildOutlineInputBorder(),
        disabledBorder: _buildOutlineInputBorder(),
      ),
    );
  }

   _buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.w,
          color: AppColors.primaryColor,
        ),
      );
  }
}
