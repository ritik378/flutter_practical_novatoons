import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';
import 'package:nova_demo/common/common_logics.dart';
import 'package:nova_demo/common/custom_app_bar.dart';
import 'package:nova_demo/common/custom_button.dart';
import 'package:nova_demo/common/custom_text_form_field.dart';
import 'package:nova_demo/common/featured_card.dart';
import 'package:nova_demo/common/image_banner.dart';
import 'package:nova_demo/common/language/language_string.dart';

/// A view that displays the details of a comic book.
class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColor.primaryColor,
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        appBar: CustomAppBar(
          actions: [_buildIcon('share_icon')],
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
  Widget _buildIcon(String iconName) {
    return Container(
      height: 31,
      width: 31,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(right: 18),
      decoration: BoxDecoration(
        color: Colors.grey[700],
        shape: BoxShape.circle,
      ),
      child: CommonLogics.setSvgImage(iconName),
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
        CommonLogics.setPngImage('author_image', height: 48, width: 48),
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
          onPressed: (startLoading, stopLoading, btnState) {
            _showDonationDialog();
          },
        ),
      ],
    );
  }

  /// Builds a rating bar for the detail view.
  Widget _buildRatingBar() {
    return RatingBar.builder(
      minRating: 1,
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
              width: 130,
              height: 70,
            ),
          );
        },
      ),
    );
  }
  void _showDonationDialog() {
    Get.dialog(
      Dialog(
        backgroundColor: AppColor.primaryColor,
        elevation: 3,
        shadowColor: Colors.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 24),
                    const Spacer(),
                    CommonLogics.commonText(
                      "Donation",
                      fontSize: 18.0,
                      fontFamily: AppFonts.bold,
                      color: AppColor.customWhite,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                CommonLogics.setPngImage('donation',height: 130,width: 235),
                const SizedBox(height: 25),
                CommonLogics.commonText(
                  LanguageString.newPassword.tr,
                  fontSize: 18.0,
                  fontFamily: AppFonts.bold,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  hintText: LanguageString.enterPassword.tr,
                  hintTextSize: 14,
                  hintTextFamily: AppFonts.regular,
                  validator: (value) {
                    return CommonLogics.passwordValidator(value);
                  },
                ),
                const SizedBox(height: 22),
                CommonLogics.commonText(
                  LanguageString.confirmPassword.tr,
                  fontSize: 18.0,
                  fontFamily: AppFonts.bold,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  hintText: LanguageString.confirmPassword.tr,
                  validator: (value) {
                    return CommonLogics.passwordValidator(value);
                  },
                  hintTextSize: 14,
                  hintTextFamily: AppFonts.regular,
                ),
                const SizedBox(height: 88),
                Center(
                  child: CustomButton(
                    buttonWidth: 243,
                    buttonHeight: 47,
                    buttonBorderRadius: 62,
                    onPressed: (startLoading, stopLoading, btnState) {
                      if (true) {
                        if (true) {
                          Get.back();
                          Get.snackbar(
                            LanguageString.subject.tr,
                            LanguageString.passwordChanged.tr,
                            colorText: AppColor.customWhite,
                            backgroundColor: AppColor.vibrantGreen,
                          );
                        } else {
                          Get.snackbar(
                            LanguageString.error.tr,
                            LanguageString.passwordNotMatch,
                            colorText: AppColor.customWhite,
                            backgroundColor: AppColor.redPrimary,
                          );
                        }
                      }
                    },
                    buttonName: CommonLogics.commonText(
                      LanguageString.done.tr,
                      fontSize: 18.0,
                      fontFamily: AppFonts.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}