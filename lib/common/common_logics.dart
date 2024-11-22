import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';
import 'package:nova_demo/common/language/language_string.dart';

class CommonLogics {
  static setPngImage(String imageName,
      {double? height, double? width, Color? color}) {
    return Image.asset(
      'assets/images/$imageName.png',
      height: height,
      width: width,
      color: color,
    );
  }

  static setSvgImage(String imageName, {double? height, double? width}) {
    return SvgPicture.asset(
      'assets/svg_images/$imageName.svg',
      height: height,
      width: width,
    );
  }

  static commonText(text,
      {fontSize = 36.0,
      color = AppColor.customWhite,
      fontFamily = AppFonts.bold}) {
    return Text(
      text,
      textAlign: TextAlign.justify,
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

  static Widget customDropDown(
      {required List<String> itemList,
      required Function(String? value) onChanged}) {
    return CustomDropdown<String>(
        decoration: CustomDropdownDecoration(
          closedSuffixIcon: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColor.customGray,
          ),
          closedFillColor: AppColor.customWhiteOpacity,
          closedBorderRadius: BorderRadius.circular(5),
          headerStyle: const TextStyle(
            color: AppColor.customGray,
            fontSize: 14,
            fontFamily: AppFonts.regular,
          ),
          listItemStyle: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: AppFonts.regular,
          ),
        ),
        items: itemList,
        excludeSelected: true,
        // initialItem: initialValue,
        onChanged: onChanged);
  }

  static PreferredSizeWidget buildAppBar(
      {String? title,
      double titleSize = 24.0,
      String titleFamily = AppFonts.bold,
        bool centerTitle = true,
      String leadingIcon = 'back_arrow_icon'}) {
    return AppBar(
      backgroundColor: AppColor.primaryColor,
      surfaceTintColor: AppColor.primaryColor,
      leading: GestureDetector(
        onTap: () => Get.back(),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: CommonLogics.setSvgImage(
            leadingIcon,
          ),
        ),
      ),
      title: CommonLogics.commonText(
        title??'',
        fontSize: titleSize,
        fontFamily: titleFamily,
      ),
      centerTitle: centerTitle,
    );
  }

}
