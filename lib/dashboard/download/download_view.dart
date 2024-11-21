import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
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
                  /// Displays the title of the library.
                  CommonLogics.commonText(
                    LanguageString.myLibrary.tr,
                    fontSize: 24.0,
                    fontFamily: AppFonts.bold,
                  ),
                  const Spacer(),

                  /// Displays the search icon.
                  CommonLogics.setSvgImage('search_icon'),
                  const SizedBox(width: 14),

                  /// Displays the discussion icon and handles tap events.
                  GestureDetector(
                    onTap: () {},
                    child: CommonLogics.setSvgImage('discussion_icon'),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              /// Displays the downloaded items in a grid format.
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    mainAxisExtent: 200,
                  ),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return RatedCard(width: 200);
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
