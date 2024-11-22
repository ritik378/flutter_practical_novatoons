import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';
import 'package:nova_demo/common/common_logics.dart';
import 'package:nova_demo/common/language/language_string.dart';

class FeaturedCard extends StatelessWidget {
  const FeaturedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 248,
      decoration: BoxDecoration(
        color: AppColor.softMintGreen,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 204,
              decoration: BoxDecoration(
                color: AppColor.customWhite,
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage('assets/images/super_america.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  CommonLogics.commonText(LanguageString.superAmerica.tr,
                      fontFamily: AppFonts.bold, fontSize: 18.0),
                  const Spacer(),
                  CommonLogics.setSvgImage('star'),
                  CommonLogics.commonText('4.5',
                      fontFamily: AppFonts.medium, fontSize: 14.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
