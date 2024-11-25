import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';

/// A utility class that provides common logic and UI components.
class CommonLogics {
  /// Returns a PNG image widget.
  ///
  /// [imageName] is the name of the image file (without extension).
  /// [height] and [width] specify the dimensions of the image.
  /// [color] applies a color filter to the image.
  static Widget setPngImage(String imageName, {double? height, double? width, Color? color}) {
    return Image.asset(
      'assets/images/$imageName.png',
      height: height,
      width: width,
      color: color,
    );
  }

  /// Returns an SVG image widget.
  ///
  /// [imageName] is the name of the SVG file (without extension).
  /// [height] and [width] specify the dimensions of the image.
  static Widget setSvgImage(String imageName, {double? height, double? width}) {
    return SvgPicture.asset(
      'assets/svg_images/$imageName.svg',
      height: height,
      width: width,
    );
  }

  /// Returns a text widget with common styling.
  ///
  /// [text] is the string to display.
  /// [fontSize] specifies the size of the text.
  /// [color] specifies the color of the text.
  /// [fontFamily] specifies the font family of the text.
  static Widget commonText(String text, {double fontSize = 36.0, Color color = AppColor.customWhite, String fontFamily = AppFonts.bold}) {
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

  /// Validates an email address.
  ///
  /// [value] is the email address to validate.
  /// Returns an error message if the email is invalid, otherwise null.
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  /// Validates a password.
  ///
  /// [value] is the password to validate.
  /// Returns an error message if the password is invalid, otherwise null.
  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  /// Returns a custom dropdown widget.
  ///
  /// [itemList] is the list of items to display in the dropdown.
  /// [onChanged] is the callback function to handle item selection.
  static Widget customDropDown({required List<String> itemList, required Function(String? value) onChanged}) {
    return CustomDropdown<String>(
      decoration: CustomDropdownDecoration(
        closedSuffixIcon: const Icon(Icons.keyboard_arrow_down, color: AppColor.customGray),
        closedFillColor: AppColor.customWhiteOpacity,
        closedBorderRadius: BorderRadius.circular(5),
        headerStyle: const TextStyle(color: AppColor.customGray, fontSize: 14, fontFamily: AppFonts.regular),
        listItemStyle: const TextStyle(color: Colors.black, fontSize: 14, fontFamily: AppFonts.regular),
      ),
      items: itemList,
      excludeSelected: true,
      onChanged: onChanged,
    );
  }

  /// Returns an app bar widget with common styling.
  ///
  /// [title] is the title of the app bar.
  /// [titleSize] specifies the size of the title text.
  /// [titleFamily] specifies the font family of the title text.
  /// [centerTitle] specifies whether the title should be centered.
  /// [leadingIcon] is the icon to display in the leading position.
  static PreferredSizeWidget buildAppBar({String? title, double titleSize = 24.0, String titleFamily = AppFonts.bold, bool centerTitle = true, String leadingIcon = 'back_arrow_icon'}) {
    return AppBar(
      backgroundColor: AppColor.primaryColor,
      surfaceTintColor: AppColor.primaryColor,
      leading: GestureDetector(
        onTap: () => Get.back(),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: setSvgImage(leadingIcon),
        ),
      ),
      title: commonText(title ?? '', fontSize: titleSize, fontFamily: titleFamily),
      centerTitle: centerTitle,
    );
  }

  /// Returns a back button widget.
  static Widget buildBackButton() {
    return GestureDetector(
      onTap: () => Get.back(),
      child: setPngImage('back_arrow', height: 24, width: 24),
    );
  }
}