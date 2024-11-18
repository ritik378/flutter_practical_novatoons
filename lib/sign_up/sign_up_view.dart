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

                  /// navigate to the previous screen.
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: CommonLogics.setPngImage('back_arrow',
                        height: 24, width: 24),
                  ),
                  const SizedBox(height: 34),

                  /// Sign-up text.
                  CommonLogics.commonText(LanguageString.signUp.tr),
                  const SizedBox(height: 3),

                  /// Instructional for sign-up.
                  CommonLogics.commonText(
                    LanguageString.signUpPrompt.tr,
                    fontFamily: AppFonts.regular,
                    fontSize: 14.0,
                    color: AppColor.customGray,
                  ),
                  const SizedBox(height: 35),

                  /// First name label.
                  CommonLogics.commonText(
                    LanguageString.firstName.tr,
                    fontFamily: AppFonts.bold,
                    fontSize: 18.0,
                    color: AppColor.customWhite,
                  ),
                  const SizedBox(height: 10),

                  /// First name input field.
                  CustomTextFormField(
                    hintText: LanguageString.enterFirstName.tr,
                  ),
                  const SizedBox(height: 22),

                  /// Last name label.
                  CommonLogics.commonText(
                    LanguageString.lastName.tr,
                    fontFamily: AppFonts.bold,
                    fontSize: 18.0,
                    color: AppColor.customWhite,
                  ),
                  const SizedBox(height: 10),

                  /// Last name input field.
                  CustomTextFormField(
                    hintText: LanguageString.enterLastName.tr,
                  ),
                  const SizedBox(height: 22),

                  /// Email label.
                  CommonLogics.commonText(
                    LanguageString.email.tr,
                    fontFamily: AppFonts.bold,
                    fontSize: 18.0,
                    color: AppColor.customWhite,
                  ),
                  const SizedBox(height: 10),

                  /// Email input field with validation.
                  CustomTextFormField(
                    hintText: LanguageString.enterEmail.tr,
                    validator: (value) {
                      return CommonLogics.emailValidator(value);
                    },
                  ),
                  const SizedBox(height: 22),

                  /// Password label.
                  CommonLogics.commonText(
                    LanguageString.password.tr,
                    fontFamily: AppFonts.bold,
                    fontSize: 18.0,
                    color: AppColor.customWhite,
                  ),
                  const SizedBox(height: 10),

                  /// Password input field with visibility toggle.
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

                              /// Date of birth label.
                              CommonLogics.commonText(
                                LanguageString.dob.tr,
                                fontFamily: AppFonts.bold,
                                fontSize: 18.0,
                                color: AppColor.customWhite,
                              ),
                              const SizedBox(height: 10),

                              /// Date of birth input field with date picker.
                              CustomTextFormField(
                                controller: signUpController.dateController,
                                hintText: LanguageString.selectDate.tr,
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

                              /// Gender label.
                              CommonLogics.commonText(
                                LanguageString.gender.tr,
                                fontFamily: AppFonts.bold,
                                fontSize: 18.0,
                                color: AppColor.customWhite,
                              ),
                              const SizedBox(height: 10),

                              /// Gender selection dropdown.
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
                                  items: <String>[
                                    LanguageString.male.tr,
                                    LanguageString.female.tr,
                                    LanguageString.other.tr
                                  ].map((String gender) {
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

                  /// Checkbox for creator check.
                  CommonLogics.commonText(LanguageString.creatorCheck.tr,
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
                      Expanded(
                        child: CommonLogics.commonText(
                            LanguageString.isCreatorOfColor.tr,
                            fontFamily: AppFonts.regular,
                            fontSize: 13.0,
                            color: AppColor.customGray),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 54,
                  ),

                  /// Next button to proceed to the profile picture upload.
                  Center(
                    child: CustomButton(
                      buttonName: LanguageString.next.tr,
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

                  /// Social media sign-up options.
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

                  /// Rich text for navigating to the sign-in page.
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
                              child: Text(
                                LanguageString.login.tr,
                                style: const TextStyle(
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