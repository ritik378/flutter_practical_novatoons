import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';
import 'package:nova_demo/common/common_logics.dart';
import 'package:nova_demo/common/custom_button.dart';
import 'package:nova_demo/common/custom_text_form_field.dart';
import 'package:nova_demo/common/language/language_string.dart';
import 'package:nova_demo/navigation/app_routes.dart';
import 'package:nova_demo/sign_up/sign_up_controller.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final SignUpController signUpController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColor.primaryColor,
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Form(
            key: signUpController.signUpFormKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: CommonLogics.setPngImage('back_arrow',
                        height: 24, width: 24),
                  ),
                  const SizedBox(height: 34),
                  CommonLogics.commonText(LanguageString.signUp.tr),
                  const SizedBox(height: 3),
                  CommonLogics.commonText(
                    LanguageString.signUpPrompt.tr,
                    fontFamily: AppFonts.regular,
                    fontSize: 14.0,
                    color: AppColor.customGray,
                  ),
                  const SizedBox(height: 35),
                  CommonLogics.commonText(
                    LanguageString.firstName.tr,
                    fontFamily: AppFonts.bold,
                    fontSize: 18.0,
                    color: AppColor.customWhite,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    hintText: LanguageString.enterFirstName.tr,
                  ),
                  const SizedBox(height: 22),
                  CommonLogics.commonText(
                    LanguageString.lastName.tr,
                    fontFamily: AppFonts.bold,
                    fontSize: 18.0,
                    color: AppColor.customWhite,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    hintText: LanguageString.enterLastName.tr,
                  ),
                  const SizedBox(height: 22),
                  CommonLogics.commonText(
                    LanguageString.email.tr,
                    fontFamily: AppFonts.bold,
                    fontSize: 18.0,
                    color: AppColor.customWhite,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    hintText: LanguageString.enterEmail.tr,
                    validator: (value) {
                      return CommonLogics.emailValidator(value);
                    },
                  ),
                  const SizedBox(height: 22),
                  CommonLogics.commonText(
                    LanguageString.password.tr,
                    fontFamily: AppFonts.bold,
                    fontSize: 18.0,
                    color: AppColor.customWhite,
                  ),
                  const SizedBox(height: 10),
                  Obx(() {
                    return CustomTextFormField(
                      hintText: LanguageString.enterPassword.tr,
                      obscure: !signUpController.passwordVisible.value,
                      validator: (value) {
                        return CommonLogics.passwordValidator(value);
                      },
                      suffixIcon: GestureDetector(
                        onTap: signUpController.changePasswordVisibility,
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: CommonLogics.setPngImage(
                            signUpController.passwordVisible.value
                                ? 'visibility'
                                : 'visibility_off',
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 22),
                    child: Row(
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
                                controller: signUpController.dateController,
                                hintText: 'Select Date',
                                readOnly: true,
                                onTap: () async {
                                  signUpController.onTapDate(context);
                                },
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(18),
                                  child: CommonLogics.setSvgImage('down_arrow',
                                      height: 8, width: 14),
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
                              Obx(() {
                                return DropdownButtonFormField<String>(
                                  value: signUpController
                                          .selectedGender.value.isEmpty
                                      ? null
                                      : signUpController.selectedGender.value,
                                  hint: Text(
                                    LanguageString.selectGender.tr,
                                    style: const TextStyle(
                                      color: AppColor.customLightGray,
                                      fontSize: 14,
                                    ),
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColor.customWhiteOpacity,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  items: <String>['Male', 'Female', 'Other']
                                      .map((String gender) {
                                    return DropdownMenuItem<String>(
                                      value: gender,
                                      child: CommonLogics.commonText(gender,
                                          fontSize: 14.0,
                                          color: AppColor.customGray),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    if (newValue != null) {
                                      signUpController.updateGender(newValue);
                                    }
                                  },
                                );
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  CommonLogics.commonText(
                      'If you are a creator, please check the optionif it applies to you. ',
                      fontSize: 14.0,
                      color: AppColor.customLightGray,
                      fontFamily: AppFonts.medium),
                  Row(
                    children: [
                      Obx(() {
                        return Checkbox(
                            value: signUpController.isChecked.value,
                            side: const BorderSide(color: AppColor.customWhite),
                            onChanged: (value) {
                              signUpController.checkBoxTap();
                            });
                      }),
                      CommonLogics.commonText(
                          'I am a Creator that is Black, African or a person of Color',
                          fontFamily: AppFonts.regular,
                          fontSize: 13.0,
                          color: AppColor.customGray)
                    ],
                  ),
                  const SizedBox(
                    height: 54,
                  ),
                  Center(
                    child: CustomButton(
                      buttonName: 'Next',
                      onPressed: (startLoading, stopLoading, btnState) {
                        if (true
                        // signUpController.signUpFormKey.currentState!
                        //     .validate()
                        ) {
                          startLoading();
                          Future.delayed(const Duration(seconds: 2), () {
                            stopLoading();
                            Get.toNamed(AppRoutes.profilePicture);
                          });
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonLogics.setSvgImage('apple'),
                      const SizedBox(width: 25),
                      CommonLogics.setSvgImage('google'),
                      const SizedBox(width: 25),
                      CommonLogics.setSvgImage('facebook'),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Already have an account? ',
                            style: TextStyle(
                              color: AppColor.customGray,
                              fontSize: 14.0,
                              fontFamily: AppFonts.regular,
                            ),
                          ),
                          WidgetSpan(
                            child: GestureDetector(
                              onTap: () {
                                // Navigate to the sign-up page
                                //Get.toNamed(AppRoutes.signIn);
                                Get.offAllNamed(AppRoutes.signIn);
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  color: AppColor.customWhite,
                                  fontSize: 14.0,
                                  fontFamily: AppFonts.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
