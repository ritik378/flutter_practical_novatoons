import 'package:flutter/material.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.hintTextSize = 14.0,
    this.inputTextColor = AppColor.customWhite,
    this.inputTextSize = 14.0,
    this.inputTextFamily = AppFonts.regular,
    this.hintTextColor = AppColor.customLightGray,
    this.hintTextFamily = AppFonts.regular,
    this.suffixIcon,
    this.obscure=false,
    this.controller,
    this.validator,
    this.readOnly=false,
    this.onTap,
    this.maxLines=1,
    this.fillColor=AppColor.customWhiteOpacity,
    this.filled=true,

  });

  final String? hintText;
  final double hintTextSize;
  final Color hintTextColor;
  final String hintTextFamily;
  final Color inputTextColor;
  final double inputTextSize;
  final String inputTextFamily;
  final Widget? suffixIcon;
  final bool obscure;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool readOnly;
  final void Function()? onTap;
  final int maxLines;
  final Color fillColor;
  final bool filled;



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      obscureText: obscure,
      controller: controller,
      validator: validator,
      readOnly: readOnly,
      onTap: onTap,
      cursorColor: AppColor.customWhite,
      style: TextStyle(
          color: inputTextColor,
          fontSize: inputTextSize,
          fontFamily: inputTextFamily),
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: filled,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
            color: hintTextColor,
            fontSize: hintTextSize,
            fontFamily: hintTextFamily),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: AppColor.customWhiteOpacity),
        ),
        focusedBorder:
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),borderSide: const BorderSide(color: AppColor.customWhiteOpacity),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),borderSide: const BorderSide(color: AppColor.customWhiteOpacity),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),borderSide: const BorderSide(color: AppColor.customWhiteOpacity),
        ),
      ),
    );
  }
}
