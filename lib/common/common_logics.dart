import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';

class CommonLogics {
  static setPngImage(String imageName, {double? height, double? width}) {
    return Image.asset('assets/images/$imageName.png',
        height: height, width: width);
  }

  static setSvgImage(String imageName, {double? height, double? width}) {
    return SvgPicture.asset('assets/svg_images/$imageName.svg',
        height: height, width: width);
  }

  static commonText(text,
      {fontSize = 36.0,
      color = AppColor.customWhite,
      fontFamily = AppFonts.bold}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: fontFamily,
      ),
    );
  }

  //Email Validator...
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  //Password Validator...
  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

}
