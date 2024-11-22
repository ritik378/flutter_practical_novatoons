import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';
import 'package:nova_demo/common/common_logics.dart';
import 'package:nova_demo/common/custom_button.dart';
import 'package:nova_demo/common/custom_text_form_field.dart';
import 'package:nova_demo/common/language/language_string.dart';
import 'package:nova_demo/dashboard/settings/my_info/my_info_controller.dart';

class MyInfoView extends StatelessWidget {
  MyInfoView({super.key});

  final MyInfoController myInfoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColor.primaryColor,
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: CommonLogics.setSvgImage('back_arrow_icon')),
                    const Spacer(),
                    Expanded(
                      child: CommonLogics.commonText(
                        LanguageString.myInfo.tr,
                        fontSize: 24.0,
                        fontFamily: AppFonts.bold,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 25),
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    child: const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: CircleAvatar(
                        radius: 47,
                        backgroundImage: NetworkImage(
                            'https://preview.keenthemes.com/metronic-v4/theme_rtl/assets/pages/media/profile/profile_user.jpg'), // Profile image URL
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: CommonLogics.commonText(LanguageString.profileName.tr,
                      fontSize: 24.0, fontFamily: AppFonts.medium),
                ),
                const SizedBox(height: 20),
                CommonLogics.commonText(LanguageString.name.tr,
                    fontSize: 18.0, fontFamily: AppFonts.bold),
                const SizedBox(height: 10),
                CustomTextFormField(
                  hintText: LanguageString.enterName.tr,
                ),
                const SizedBox(height: 22),
                CommonLogics.commonText(LanguageString.email.tr,
                    fontSize: 18.0, fontFamily: AppFonts.bold),
                const SizedBox(height: 10),
                CustomTextFormField(
                  hintText: LanguageString.enterEmail.tr,
                ),
                const SizedBox(height: 22),
                CommonLogics.commonText(LanguageString.password.tr,
                    fontSize: 18.0, fontFamily: AppFonts.bold),
                const SizedBox(height: 10),
                CustomTextFormField(
                  hintText: LanguageString.enterPassword.tr,
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    _showChangePasswordDialog(
                        context); // Show change password dialog
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: CommonLogics.commonText(
                      LanguageString.changePassword.tr,
                      fontSize: 14.0,
                      fontFamily: AppFonts.regular,
                      color: AppColor.redPrimary,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CommonLogics.commonText(LanguageString.bio.tr,
                    fontSize: 18.0, fontFamily: AppFonts.bold),
                const SizedBox(height: 10),
                CustomTextFormField(
                  hintText: LanguageString.enterBio.tr,
                  maxLines: 3,
                ),
                const SizedBox(height: 22),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonLogics.commonText(
                            LanguageString.dob.tr,
                            fontFamily: AppFonts.bold,
                            fontSize: 18.0,
                            color: AppColor.customWhite,
                          ),
                          const SizedBox(height: 10),
                          CustomTextFormField(
                            controller: myInfoController.dateController,
                            hintText: LanguageString.selectDate.tr,
                            readOnly: true,
                            onTap: () async {
                              myInfoController.onTapDate(context);
                            },
                            suffixIcon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColor.customGray,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonLogics.commonText(
                            LanguageString.gender.tr,
                            fontFamily: AppFonts.bold,
                            fontSize: 18.0,
                            color: AppColor.customWhite,
                          ),
                          const SizedBox(height: 10),
                          CommonLogics.customDropDown(
                            itemList: myInfoController.dropDownItems,
                            onChanged: (value) {
                              myInfoController.selectedDropDownItem.value =
                                  value!;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 99),
                Center(
                  child: CustomButton(
                    buttonWidth: 243,
                    buttonHeight: 47,
                    onPressed: (startLoading, stopLoading, btnState) {},
                    buttonName: CommonLogics.commonText(
                      LanguageString.done.tr,
                      fontSize: 18.0,
                      fontFamily: AppFonts.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 64),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
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
            key: myInfoController.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 24),
                    const Spacer(),
                    CommonLogics.commonText(
                      LanguageString.changePassword.tr,
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
                const SizedBox(height: 60),
                CommonLogics.commonText(
                  LanguageString.newPassword.tr,
                  fontSize: 18.0,
                  fontFamily: AppFonts.bold,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  controller: myInfoController.newPasswordController,
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
                  controller: myInfoController.confirmPasswordController,
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
                      if (myInfoController.formKey.currentState!.validate()) {
                        if (myInfoController.newPasswordController.text ==
                            myInfoController.confirmPasswordController.text) {
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
