import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';
import 'package:nova_demo/common/common_logics.dart';
import 'package:nova_demo/common/language/language_string.dart';
import 'package:nova_demo/dashboard/common/featured_card.dart';
import 'package:nova_demo/dashboard/common/image_banner.dart';
import 'package:nova_demo/dashboard/common/rated_card.dart';
import 'package:nova_demo/dashboard/home/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColor.primaryColor,
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    CommonLogics.commonText(LanguageString.hiJoy.tr, fontSize: 24.0, fontFamily: AppFonts.bold),
                    const Spacer(),
                    /// Displays a search icon.
                    CommonLogics.setSvgImage('search_icon'),
                    const SizedBox(width: 14),
                    /// Displays a discussion icon.
                    CommonLogics.setSvgImage('discussion_icon'),
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  height: 28,
                  decoration: BoxDecoration(
                    color: AppColor.softMintGreen,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: GetBuilder<HomeController>(
                    builder: (controller) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeController.items.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => homeController.onTapItem(index),
                            child: Container(
                              height: 28,
                              width: 108,
                              decoration: BoxDecoration(
                                color: homeController.selectedItemIndex.value == index
                                    ? AppColor.vibrantGreen
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Center(
                                child: CommonLogics.commonText(
                                  homeController.items[index],
                                  fontSize: 14.0,
                                  color: homeController.selectedItemIndex.value == index
                                      ? AppColor.primaryColor
                                      : AppColor.customWhite,
                                  fontFamily: AppFonts.medium,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                /// Displays a featured card.
                const FeaturedCard(),
                const SizedBox(height: 20),
                Row(
                  children: [
                    /// Displays the "Featured" text.
                    CommonLogics.commonText(LanguageString.featured.tr, fontFamily: AppFonts.bold, fontSize: 21.0),
                    const Spacer(),
                    /// Displays the "Show More" text.
                    CommonLogics.commonText(LanguageString.showMore.tr, fontFamily: AppFonts.regular, fontSize: 12.0),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 208,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: RatedCard(),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                /// Displays a banner image.
                CommonLogics.setPngImage('banner', height: 55),
                const SizedBox(height: 20),
                Row(
                  children: [
                    /// Displays the "You May Like" text.
                    CommonLogics.commonText(LanguageString.youMayLike.tr, fontFamily: AppFonts.bold, fontSize: 21.0, color: AppColor.customWhite),
                    const Spacer(),
                    /// Displays the "Show More" text.
                    CommonLogics.commonText(LanguageString.showMore.tr, fontFamily: AppFonts.regular, fontSize: 12.0, color: AppColor.customWhite),
                  ],
                ),
                const SizedBox(height: 15),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 15.0,
                    mainAxisExtent: 200,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return const ImageBanner();
                  },
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    /// Displays the "Popular" text.
                    CommonLogics.commonText(LanguageString.popular.tr, fontFamily: AppFonts.bold, fontSize: 21.0, color: AppColor.customWhite),
                    const Spacer(),
                    /// Displays the "Show More" text.
                    CommonLogics.commonText(LanguageString.showMore.tr, fontFamily: AppFonts.regular, fontSize: 12.0, color: AppColor.customWhite),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 208,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: RatedCard(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}