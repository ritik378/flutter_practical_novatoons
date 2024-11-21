import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';
import 'package:nova_demo/common/common_logics.dart';
import 'package:nova_demo/common/language/language_string.dart';

Widget notificationItem({bool isLastItem=false}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CommonLogics.setPngImage('user_notification',
          height: 48, width: 48),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                CommonLogics.commonText(
                  LanguageString.chrisEvans.tr,
                  fontSize: 13.0,
                  fontFamily: AppFonts.medium,
                  color: AppColor.customWhite,
                ),
                CommonLogics.commonText(
                  LanguageString.twoMinAgo.tr,
                  fontFamily: AppFonts.regular,
                  fontSize: 10.0,
                )
              ],
            ),
            CommonLogics.commonText(
                LanguageString.politicalRift.tr,
                fontSize: 13.0,
                color: AppColor.customGray,
                fontFamily: AppFonts.regular),
          ],
        ),
      )
    ],
  );
}