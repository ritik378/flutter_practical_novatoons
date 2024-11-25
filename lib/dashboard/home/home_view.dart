import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';
import 'package:nova_demo/common/common_logics.dart';
import 'package:nova_demo/common/custom_app_bar.dart';
import 'package:nova_demo/common/language/language_string.dart';
import 'package:nova_demo/common/featured_card.dart';
import 'package:nova_demo/common/image_banner.dart';
import 'package:nova_demo/dashboard/common/rated_card.dart';
import 'package:nova_demo/dashboard/home/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        appBar: CustomAppBar(
          title: LanguageString.hiJoy.tr,
          actions: [
            CommonLogics.setSvgImage('search_icon'),
            const SizedBox(width: 13),
            CommonLogics.setSvgImage('discussion_icon'),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              _buildCategoryList(),
              const SizedBox(height: 20),
              const FeaturedCard(),
              const SizedBox(height: 20),
              _buildSectionHeader(LanguageString.featured.tr),
              const SizedBox(height: 15),
              _buildHorizontalList(10, () => Get.toNamed('/detail')),
              const SizedBox(height: 20),
              CommonLogics.setPngImage('banner', height: 55),
              const SizedBox(height: 20),
              _buildSectionHeader(
                  LanguageString.youMayLike.tr, AppColor.customWhite),
              const SizedBox(height: 15),
              _buildGridList(4),
              const SizedBox(height: 20),
              _buildSectionHeader(
                  LanguageString.popular.tr, AppColor.customWhite),
              const SizedBox(height: 15),
              _buildHorizontalList(10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    return Container(
      height: 30,
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
                  height: 30,
                  width: 98,
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
    );
  }

  Widget _buildSectionHeader(String title, [Color? color]) {
    return Row(
      children: [
        CommonLogics.commonText(
          title,
          fontFamily: AppFonts.bold,
          fontSize: 21.0,
        ),
        const Spacer(),
        CommonLogics.commonText(
          LanguageString.showMore.tr,
          fontFamily: AppFonts.regular,
          fontSize: 12.0,
        ),
      ],
    );
  }

  Widget _buildHorizontalList(int itemCount, [VoidCallback? onTap]) {
    return SizedBox(
      height: 208,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: onTap,
              child: RatedCard(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGridList(int itemCount) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 15.0,
        mainAxisExtent: 200,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return const ImageBanner();
      },
    );
  }
}
