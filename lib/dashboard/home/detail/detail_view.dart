import 'dart:io';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';
import 'package:nova_demo/common/common_logics.dart';
import 'package:nova_demo/common/custom_app_bar.dart';
import 'package:nova_demo/common/custom_button.dart';
import 'package:nova_demo/common/featured_card.dart';
import 'package:nova_demo/common/image_banner.dart';
import 'package:nova_demo/common/language/language_string.dart';
import 'package:nova_demo/dashboard/home/detail/detail_controller.dart';
import 'package:nova_demo/navigation/app_routes.dart';
import 'package:share_plus/share_plus.dart';

/// A view that displays the details of a comic book.
class DetailView extends StatelessWidget {
  DetailView({super.key});

  /// Controller for managing the state of the DetailView.
  final DetailController detailController = Get.find();

  /// Shares the current route URL.
  void shareCurrentRoute(BuildContext context) {
    String currentRoute =
        ModalRoute.of(context)?.settings.name ?? 'unknown route';
    String baseUrl = Platform.isAndroid
        ? 'https://com.example.nova_demo/'
        : 'https://com.example.novaDemo/';
    Share.share('Check out this link: $baseUrl$currentRoute');
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColor.primaryColor,
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        appBar: CustomAppBar(
          actions: [
            _buildIcon('share_icon', onPress: () => shareCurrentRoute(context))
          ],
          leading: _buildLeadingIcon(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                const FeaturedCard(),
                const SizedBox(height: 20),
                _buildButtonRow(),
                const SizedBox(height: 20),
                const Divider(color: AppColor.grayMedium, thickness: 1),
                const SizedBox(height: 16),
                _buildStatsRow(),
                const SizedBox(height: 21),
                _buildSectionTitle(LanguageString.description.tr),
                const SizedBox(height: 15),
                _buildDescriptionText(),
                const SizedBox(height: 25),
                _buildSectionTitle(LanguageString.author.tr),
                const SizedBox(height: 15),
                _buildAuthorRow(),
                const SizedBox(height: 25),
                _buildSectionTitle(LanguageString.rateThisComic.tr),
                const SizedBox(height: 15),
                _buildRatingBar(),
                const SizedBox(height: 20),
                _buildRecommendationsHeader(),
                const SizedBox(height: 15),
                _buildRecommendationsList(),
                const SizedBox(height: 70),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds an icon widget with the specified [iconName].
  /// Optionally, an [onPress] callback can be provided.
  Widget _buildIcon(String iconName, {void Function()? onPress}) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 31,
        width: 31,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(right: 18),
        decoration: BoxDecoration(
          color: Colors.grey[700],
          shape: BoxShape.circle,
        ),
        child: CommonLogics.setSvgImage(iconName),
      ),
    );
  }

  /// Builds the leading icon for the app bar.
  Widget _buildLeadingIcon() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: () => Get.back(),
        child: CommonLogics.setSvgImage('back_arrow_icon'),
      ),
    );
  }

  /// Builds a row of buttons for the detail view.
  Widget _buildButtonRow() {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            onPressed: (startLoading, stopLoading, btnState) {},
            buttonBorderRadius: 62,
            buttonName: CommonLogics.commonText(
              LanguageString.continueReading.tr,
              fontSize: 18.0,
              fontFamily: AppFonts.bold,
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: CustomButton(
            onPressed: (startLoading, stopLoading, btnState) {},
            buttonBorderRadius: 62,
            buttonName: CommonLogics.commonText(
              LanguageString.downloaded.tr,
              fontSize: 18.0,
              fontFamily: AppFonts.bold,
            ),
          ),
        ),
      ],
    );
  }

  /// Builds a row of statistics for the detail view.
  Widget _buildStatsRow() {
    return Row(
      children: [
        CommonLogics.setSvgImage('green_heart'),
        const SizedBox(width: 10),
        CommonLogics.commonText('1.4k', fontSize: 12.0),
        const SizedBox(width: 25),
        CommonLogics.setSvgImage('green_comment'),
        const SizedBox(width: 10),
        CommonLogics.commonText('14k', fontSize: 12.0),
        const Spacer(),
        CustomButton(
          onPressed: (startLoading, stopLoading, btnState) {},
          buttonWidth: 74,
          buttonHeight: 29,
          buttonBorderRadius: 62,
          buttonName: Row(
            children: [
              const Spacer(),
              CommonLogics.setSvgImage('right'),
              CommonLogics.commonText(
                LanguageString.free.tr,
                fontSize: 13.0,
                fontFamily: AppFonts.bold,
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }

  /// Builds a section title with the specified [title].
  Widget _buildSectionTitle(String title) {
    return CommonLogics.commonText(
      title,
      fontSize: 18.0,
      fontFamily: AppFonts.medium,
    );
  }

  /// Builds the description text for the detail view.
  Widget _buildDescriptionText() {
    return CommonLogics.commonText(
      LanguageString.avengersConflict.tr,
      fontFamily: AppFonts.regular,
      fontSize: 13.0,
      color: AppColor.grayMedium,
    );
  }

  /// Builds a row displaying the author information.
  Widget _buildAuthorRow() {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.authorProfile),
          child:
              CommonLogics.setPngImage('author_image', height: 48, width: 48),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonLogics.commonText(
              LanguageString.author.tr,
              fontFamily: AppFonts.regular,
              fontSize: 12.0,
              color: AppColor.grayMedium,
            ),
            CommonLogics.commonText(
              LanguageString.chrisEvans.tr,
              fontFamily: AppFonts.medium,
              fontSize: 13.0,
            ),
          ],
        ),
        const Spacer(),
        CustomButton(
          buttonName: CommonLogics.commonText(
            LanguageString.donate.tr,
            fontFamily: AppFonts.medium,
            fontSize: 13.0,
          ),
          buttonWidth: 74,
          buttonHeight: 29,
          buttonBorderRadius: 62,
          onPressed: (startLoading, stopLoading, btnState) {
            _showDonationDialog();
          },
        ),
      ],
    );
  }

  /// Builds the rating bar for the detail view.
  Widget _buildRatingBar() {
    return Stack(
      children: [
        Obx(() {
          return RatingBar.builder(
            minRating: 1,
            initialRating: detailController.initialRating.value,
            unratedColor: AppColor.softGray,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {},
          );
        }),
        GestureDetector(
          onTap: () => _showRatingDialog(),
          child: Container(
            color: Colors.transparent,
            height: 42,
            width: 200,
          ),
        ),
      ],
    );
  }

  /// Builds the header for the recommendations section.
  Widget _buildRecommendationsHeader() {
    return Row(
      children: [
        CommonLogics.commonText(
          LanguageString.recommendations.tr,
          fontFamily: AppFonts.medium,
          fontSize: 18.0,
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

  /// Builds a list of recommended items.
  Widget _buildRecommendationsList() {
    return SizedBox(
      height: 190,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(right: 10),
            child: ImageBanner(
              height: 70,
            ),
          );
        },
      ),
    );
  }

  /// Shows the donation dialog.
  void _showDonationDialog() {
    Get.dialog(
      Dialog(
        backgroundColor: AppColor.primaryColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.primaryColor, // Dialog background color
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.yellow.withOpacity(0.7), // Yellow shadow
                blurRadius: 11, // How blurred the shadow is
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 40),
                    const Spacer(),
                    CommonLogics.commonText(
                      LanguageString.donation.tr,
                      fontSize: 18.0,
                      fontFamily: AppFonts.medium,
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppColor.customWhite,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                Center(
                  child: CommonLogics.setPngImage('donation',
                      height: 130, width: 235),
                ),
                const SizedBox(height: 22),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              CommonLogics.setPngImage('author_image',
                                  height: 48, width: 48),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CommonLogics.commonText(
                                          LanguageString.author.tr,
                                          fontFamily: AppFonts.regular,
                                          fontSize: 12.0,
                                          color: AppColor.customWhite,
                                        ),
                                        CommonLogics.commonText(
                                          '3 CR/3 USD',
                                          fontFamily: AppFonts.medium,
                                          fontSize: 13.0,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CommonLogics.commonText(
                                          LanguageString.chrisEvans.tr,
                                          fontFamily: AppFonts.regular,
                                          fontSize: 12.0,
                                          color: AppColor.customWhite,
                                        ),
                                        CommonLogics.commonText(
                                          LanguageString.yourBalance.tr,
                                          fontFamily: AppFonts.medium,
                                          fontSize: 13.0,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Divider(color: AppColor.lightGrey, thickness: 1),
                        const SizedBox(height: 15),
                        CommonLogics.commonText(
                          LanguageString.enterCredits.tr,
                          fontSize: 18.0,
                          fontFamily: AppFonts.medium,
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 144,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: Center(
                                  child: CommonLogics.commonText(
                                    '3 CR',
                                    fontSize: 22.0,
                                    fontFamily: AppFonts.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 32),
                              Column(
                                children: [
                                  CommonLogics.commonText('',
                                      fontSize: 12.0,
                                      fontFamily: AppFonts.regular),
                                  CommonLogics.commonText('3 USD',
                                      fontFamily: AppFonts.medium,
                                      fontSize: 22.0),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: CustomButton(
                    buttonWidth: 243,
                    buttonHeight: 47,
                    buttonBorderRadius: 62,
                    onPressed: (startLoading, stopLoading, btnState) =>
                        Get.back(),
                    buttonName: CommonLogics.commonText(
                      LanguageString.done.tr,
                      fontSize: 18.0,
                      fontFamily: AppFonts.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 46),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Shows the rating dialog.
  void _showRatingDialog() {
    double tempRating = 0;
    Get.dialog(
      Dialog(
        backgroundColor: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.primaryColor, // Dialog background color
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.yellow.withOpacity(0.7), // Yellow shadow
                blurRadius: 11, // How blurred the shadow is
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 40),
                    const Spacer(),
                    CommonLogics.commonText(
                      LanguageString.rateThisComic.tr,
                      fontSize: 18.0,
                      fontFamily: AppFonts.medium,
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppColor.customWhite,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 65),
                CommonLogics.commonText(
                  LanguageString.plRateThisComic.tr,
                  fontSize: 16.0,
                  fontFamily: AppFonts.medium,
                ),
                const SizedBox(height: 35),
                RatingBar.builder(
                  minRating: 1,
                  initialRating: detailController.initialRating.value,
                  unratedColor: AppColor.softGray,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    tempRating = rating;
                  },
                ),
                const SizedBox(height: 72),
                CustomButton(
                    buttonName: CommonLogics.commonText(
                      LanguageString.done.tr,
                      fontFamily: AppFonts.bold,
                      fontSize: 18.0,
                    ),
                    buttonWidth: 243,
                    buttonHeight: 47,
                    buttonBorderRadius: 62.0,
                    onPressed: (startLoading, stopLoading, btnState) {
                      Get.back();
                      detailController.setRating(tempRating);
                    }),
                const SizedBox(height: 35),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
