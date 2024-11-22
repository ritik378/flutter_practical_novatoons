import 'package:flutter/material.dart';
import 'package:loading_btn/loading_btn.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';
import 'package:nova_demo/common/common_logics.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.buttonHeight = 55.0,
      this.buttonWidth = 240.0,
       required this.buttonName,
      this.buttonColor = AppColor.customGreen,
      this.buttonBorderRadius = 10.0,
      required this.onPressed});

  final Color buttonColor;
  final double buttonHeight;
  final double buttonWidth;
  final Widget buttonName;
  final double buttonBorderRadius;
  final Function(Function startLoading,Function stopLoading,ButtonState btnState) onPressed;

  @override
  Widget build(BuildContext context) {
    return LoadingBtn(
      onTap: (startLoading, stopLoading, btnState) async {
        onPressed.call(startLoading, stopLoading, btnState);
      },
      height: buttonHeight,
      width: buttonWidth,
      borderRadius:buttonBorderRadius ,
      borderSide:const BorderSide(color: AppColor.customGreen),
      color: buttonColor,
      loader: const CircularProgressIndicator(
        strokeWidth: 3.0,
        valueColor: AlwaysStoppedAnimation<Color>(
          Colors.white,
        ),
      ),
      child: buttonName,
    );
  }
}
