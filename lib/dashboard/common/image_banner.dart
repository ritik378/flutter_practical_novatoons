import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';
import 'package:nova_demo/common/common_logics.dart';
import 'package:nova_demo/common/language/language_string.dart';

class ImageBanner extends StatelessWidget {
  const ImageBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: const DecorationImage(
                image: AssetImage('assets/images/money_heist.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            CommonLogics.commonText(LanguageString.captainMarvel.tr,
                fontFamily: AppFonts.medium,
                fontSize: 14.0,
                color: AppColor.customWhite),
            const Spacer(),
            CommonLogics.setSvgImage('star'),
            CommonLogics.commonText(LanguageString.rating.tr,
                fontFamily: AppFonts.medium,
                fontSize: 14.0,
                color: AppColor.customWhite),
          ],
        ),
      ],
    );
  }
}
