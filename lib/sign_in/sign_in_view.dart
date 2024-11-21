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

class SignInView extends StatelessWidget {
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
                _buildHeader(),
                const SizedBox(height: 35),
                _buildEmailField(),
                const SizedBox(height: 22),
                _buildPasswordField(),
                const Spacer(),
                _buildLoginButton(),
                const SizedBox(height: 34),
                _buildSocialMediaLogin(),
                const Spacer(),
                _buildSignUpPrompt(),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the header section of the sign-in view.
  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonLogics.commonText(LanguageString.signIn.tr),
        const SizedBox(height: 3),
        CommonLogics.commonText(
          LanguageString.welcome.tr,
          fontFamily: AppFonts.regular,
          fontSize: 14.0,
          color: AppColor.customGray,
        ),
      ],
    );
  }

  /// Builds the email input field.
  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonLogics.commonText(
          LanguageString.email.tr,
          fontFamily: AppFonts.bold,
          fontSize: 18.0,
          color: AppColor.customWhite,
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          hintText: LanguageString.enterEmail.tr,
          validator: (value) => CommonLogics.emailValidator(value),
        ),
      ],
    );
  }

  /// Builds the password input field.
  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                  color: AppColor.customGray,
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  /// Builds the login button.
  Widget _buildLoginButton() {
    return Center(
      child: CustomButton(
        buttonName: LanguageString.login.tr,
        onPressed: (startLoading, stopLoading, btnState) {
          if (signInController.formKey.currentState!.validate()) {
            startLoading();
            Future.delayed(const Duration(seconds: 1), () {
              stopLoading();
              Get.offNamed(AppRoutes.dashboard);
              GetStorage().write(AppKeys.isLogin, true);
            });
          }
        },
      ),
    );
  }

  /// Builds the social media login options.
  Widget _buildSocialMediaLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonLogics.setSvgImage('apple'),
        const SizedBox(width: 25),
        CommonLogics.setSvgImage('google'),
        const SizedBox(width: 25),
        CommonLogics.setSvgImage('facebook'),
      ],
    );
  }

  /// Builds the sign-up prompt.
  Widget _buildSignUpPrompt() {
    return Center(
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
                onTap: () => Get.toNamed(AppRoutes.signUp),
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
    );
  }
}