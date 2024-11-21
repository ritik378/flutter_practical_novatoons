import 'package:flutter/material.dart';

class AppColor {
  static const Color primaryColor = Color.fromRGBO(31, 28, 44, 1);
  static const Color customWhite = Color.fromRGBO(255, 255, 255, 1);
  static const Color customGray = Color.fromRGBO(165, 165, 165, 1);
  static const Color customLightGray = Color.fromRGBO(156, 156, 156, 1);
  static const Color customWhiteOpacity = Color.fromRGBO(255, 255, 255, 0.1);
  static const Color customGreen = Color.fromRGBO(0, 171, 79, 1);
  static const Color softMintGreen = Color.fromRGBO(64, 192, 123, 0.3);
  static const Color vibrantGreen = Color.fromRGBO(0, 171, 79, 1);
  static const Color customRed = Color.fromRGBO(190, 3, 3, 1);
  static const Color redPrimary = Color.fromRGBO(255, 0, 0, 1.0);
  static const Color grayMedium = Color.fromRGBO(165, 165, 165, 1.0);
  static const Color lightGrey = Color.fromRGBO(181, 181, 181, 1);

  static const LinearGradient fadeToBlack = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(0, 0, 0, 0.68), // rgba(0, 0, 0, 0.68)
      Color.fromRGBO(0, 0, 0, 0.0), // rgba(0, 0, 0, 0)
      Color(0xFF000000), // #000000
    ],
    stops: [0.0, 0.4427, 1.0],
  );
}
