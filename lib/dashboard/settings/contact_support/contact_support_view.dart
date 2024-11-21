import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';
import 'package:nova_demo/common/common_logics.dart';
import 'package:nova_demo/common/custom_button.dart';
import 'package:nova_demo/common/custom_text_form_field.dart';
import 'package:nova_demo/common/language/language_string.dart';

/// A view that allows users to contact support by filling out a form.
class ContactSupportView extends StatelessWidget {
  const ContactSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColor.primaryColor,
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        appBar: CommonLogics.buildAppBar(title: LanguageString.contactSupport.tr),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 37),
                Center(
                  child: CommonLogics.commonText(
                    LanguageString.dropMessage.tr,
                    fontSize: 20.0,
                    fontFamily: AppFonts.medium,
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: CommonLogics.commonText(
                    LanguageString.avengersRift.tr,
                    fontSize: 13.0,
                    fontFamily: AppFonts.regular,
                    color: AppColor.customGray,
                  ),
                ),
                const SizedBox(height: 38),
                CommonLogics.commonText(
                  LanguageString.name.tr,
                  fontSize: 18.0,
                  fontFamily: AppFonts.bold,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(hintText: LanguageString.enterName.tr),
                const SizedBox(height: 22),
                CommonLogics.commonText(
                  LanguageString.email.tr,
                  fontSize: 18.0,
                  fontFamily: AppFonts.bold,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(hintText: LanguageString.enterName.tr),
                const SizedBox(height: 22),
                CommonLogics.commonText(
                  LanguageString.subject.tr,
                  fontSize: 18.0,
                  fontFamily: AppFonts.bold,
                ),
                const SizedBox(height: 10),
                CommonLogics.customDropDown(
                  itemList: [
                    LanguageString.generalEnquiry.tr,
                    LanguageString.systemDowntime.tr,
                    LanguageString.featureRequest.tr,
                  ],
                  onChanged: (value) {},
                ),
                const SizedBox(height: 22),
                CommonLogics.commonText(
                  LanguageString.message.tr,
                  fontSize: 18.0,
                  fontFamily: AppFonts.bold,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  maxLines: 3,
                  hintText: LanguageString.enterMessage.tr,
                ),
                const SizedBox(height: 63),
                Center(
                  child: CustomButton(
                    buttonName: LanguageString.sendMessage.tr,
                    onPressed: (startLoading, stopLoading, btnState) {},
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: CustomButton(
                    buttonName: LanguageString.mySupportMessages.tr,
                    buttonColor: AppColor.primaryColor,
                    onPressed: (startLoading, stopLoading, btnState) {},
                  ),
                ),
                const SizedBox(height: 41),
              ],
            ),
          ),
        ),
      ),
    );
  }
}