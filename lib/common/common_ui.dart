import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';

class CommonUi {
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
}
