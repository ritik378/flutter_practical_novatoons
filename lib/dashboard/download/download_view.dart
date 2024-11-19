import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';
import 'package:nova_demo/common/common_logics.dart';
import 'package:nova_demo/common/language/language_string.dart';
import 'package:nova_demo/dashboard/common/rated_card.dart';

class DownloadView extends StatelessWidget {
  const DownloadView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColor.primaryColor,
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              Row(
                children: [
                  CommonLogics.commonText(LanguageString.myLibrary.tr,
                      fontSize: 24.0, fontFamily: AppFonts.bold),
                  const Spacer(),
                  CommonLogics.setSvgImage('search_icon'),
                  const SizedBox(
                    width: 14,
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: CommonLogics.setSvgImage('discussion_icon')),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    mainAxisExtent: 200,
                  ),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return  RatedCard(
                      width: 200,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
