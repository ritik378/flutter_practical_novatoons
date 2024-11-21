import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';
import 'package:nova_demo/common/common_logics.dart';
import 'package:nova_demo/common/language/language_string.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColor.primaryColor,
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 26),
              _buildTransactionList(),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the header row with a back button and title.
  Widget _buildHeader() {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: CommonLogics.setSvgImage('back_arrow_icon'),
        ),
        const SizedBox(width: 79),
        CommonLogics.commonText(
          LanguageString.transactions.tr,
          fontSize: 24.0,
          fontFamily: AppFonts.bold,
        ),
      ],
    );
  }

  /// Builds the list of transactions.
  Widget _buildTransactionList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Container(
              height: 84,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(22),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    _buildTransactionIcon(),
                    const SizedBox(width: 10),
                    _buildTransactionDetails(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// Builds the transaction icon.
  Widget _buildTransactionIcon() {
    return Container(
      height: 38,
      width: 38,
      decoration: const BoxDecoration(
        color: AppColor.customGreen,
        shape: BoxShape.circle,
      ),
      child: Center(child: CommonLogics.setSvgImage('received_icon')),
    );
  }

  /// Builds the transaction details.
  Widget _buildTransactionDetails() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTransactionHeader(),
          CommonLogics.commonText(
            LanguageString.monthYear.tr,
            color: AppColor.customWhite,
            fontFamily: AppFonts.medium,
            fontSize: 16.0,
          ),
          _buildTransactionFooter(),
        ],
      ),
    );
  }

  /// Builds the transaction header with title and amount.
  Widget _buildTransactionHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonLogics.commonText(
          LanguageString.received.tr,
          color: AppColor.customWhite,
          fontFamily: AppFonts.medium,
          fontSize: 16.0,
        ),
        CommonLogics.commonText(
          LanguageString.crAndUSDValue.tr,
          color: AppColor.customWhite,
          fontFamily: AppFonts.medium,
          fontSize: 16.0,
        ),
      ],
    );
  }

  /// Builds the transaction footer with date and status.
  Widget _buildTransactionFooter() {
    return Row(
      children: [
        CommonLogics.commonText(
          LanguageString.paymentDate.tr,
          color: AppColor.customWhite,
          fontFamily: AppFonts.medium,
          fontSize: 16.0,
        ),
        const Spacer(),
        CommonLogics.setSvgImage('green_checkbox'),
        const SizedBox(width: 5),
        CommonLogics.commonText(
          LanguageString.paymentPaid.tr,
          color: AppColor.grayMedium,
          fontFamily: AppFonts.regular,
          fontSize: 12.0,
        ),
      ],
    );
  }
}
