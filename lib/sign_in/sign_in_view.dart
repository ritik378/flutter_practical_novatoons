import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';
import 'package:nova_demo/common/app_keys.dart';
import 'package:nova_demo/common/common_logics.dart';
import 'package:nova_demo/common/custom_button.dart';
import 'package:nova_demo/common/custom_text_form_field.dart';
import 'package:nova_demo/common/language/language_string.dart';
import 'package:nova_demo/navigation/app_routes.dart';
import 'package:nova_demo/sign_in/sign_in_controller.dart';

/// A stateless widget that represents the sign-in view of the application.
class SignInView extends StatelessWidget {
  /// Creates a [SignInView] widget.
  SignInView({super.key});

  /// The controller for managing the sign-in logic.
  final SignInController signInController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColor.primaryColor,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Form(
            key: signInController.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 34),
                // Sign in text
                CommonLogics.commonText(LanguageString.signIn.tr),
                const SizedBox(height: 3),
                // Instructional text
                CommonLogics.commonText(
                  LanguageString.welcome.tr,
                  fontFamily: AppFonts.regular,
                  fontSize: 14.0,
                  color: AppColor.customGray,
                ),
                const SizedBox(height: 35),
                // Email label
                CommonLogics.commonText(
                  LanguageString.email.tr,
                  fontFamily: AppFonts.bold,
                  fontSize: 18.0,
                  color: AppColor.customWhite,
                ),
                const SizedBox(height: 10),
                // Email input field
                CustomTextFormField(
                  hintText: LanguageString.enterEmail.tr,
                  validator: (value) {
                    return CommonLogics.emailValidator(value);
                  },
                ),
                const SizedBox(height: 22),
                // Password label
                CommonLogics.commonText(
                  LanguageString.password.tr,
                  fontFamily: AppFonts.bold,
                  fontSize: 18.0,
                  color: AppColor.customWhite,
                ),
                const SizedBox(height: 10),
                // Password input field with visibility toggle
                Obx(() {
                  return CustomTextFormField(
                    hintText: LanguageString.enterPassword.tr,
                    obscure: !signInController.passwordVisible.value,
                    suffixIcon: GestureDetector(
                      onTap: signInController.changePasswordVisibility,
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: CommonLogics.setPngImage(
                          signInController.passwordVisible.value
                              ? 'visibility'
                              : 'visibility_off',
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                  );
                }),
                const Spacer(),

                /// Log in button
                Center(
                  child: CustomButton(
                    buttonName: LanguageString.login.tr,
                    onPressed: (startLoading, stopLoading, btnState) {
                      if (signInController.formKey.currentState!.validate()) {
                        startLoading();
                        Future.delayed(const Duration(seconds: 1), () {
                          stopLoading();
                          GetStorage().write(AppKeys.isLogin, true);
                          print(GetStorage().read(AppKeys.isLogin));
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(height: 34),
                // Social media login options
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
                const Spacer(),
                // Sign up prompt
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: LanguageString.dontHaveAccount.tr,
                          style: const TextStyle(
                            color: AppColor.customGray,
                            fontSize: 14.0,
                            fontFamily: AppFonts.regular,
                          ),
                        ),
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () {
                              // Navigate to the sign-up page
                              Get.toNamed(AppRoutes.signUp);
                            },
                            child: Text(
                              LanguageString.signUp.tr,
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
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
