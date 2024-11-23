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

  /// The controller for managing the sign-up logic.
  final SignUpController signUpController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColor.primaryColor,
      bottom: false,
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
                  _buildBackButton(),
                  const SizedBox(height: 34),
                  _buildHeader(),
                  const SizedBox(height: 35),
                  _buildTextField(LanguageString.firstName.tr, LanguageString.enterFirstName.tr),
                  const SizedBox(height: 22),
                  _buildTextField(LanguageString.lastName.tr, LanguageString.enterLastName.tr),
                  const SizedBox(height: 22),
                  _buildTextField(LanguageString.email.tr, LanguageString.enterEmail.tr, validator: CommonLogics.emailValidator),
                  const SizedBox(height: 22),
                  _buildPasswordField(),
                  const SizedBox(height: 22),
                  _buildDateAndGenderFields(context),
                  const SizedBox(height: 22),
                  _buildCreatorCheck(),
                  const SizedBox(height: 54),
                  _buildNextButton(),
                  const SizedBox(height: 25),
                  _buildSocialMediaLogin(),
                  const SizedBox(height: 30),
                  _buildSignInPrompt(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the back button widget.
  Widget _buildBackButton() {
    return GestureDetector(
      onTap: () => Get.back(),
      child: CommonLogics.setPngImage('back_arrow', height: 24, width: 24),
    );
  }

  /// Builds the header section of the sign-up view.
  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonLogics.commonText(LanguageString.signUp.tr),
        const SizedBox(height: 3),
        CommonLogics.commonText(
          LanguageString.signUpPrompt.tr,
          fontFamily: AppFonts.regular,
          fontSize: 14.0,
          color: AppColor.customGray,
        ),
      ],
    );
  }

  /// Builds a text field with the given label and hint.
  Widget _buildTextField(String label, String hint, {String? Function(String?)? validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonLogics.commonText(
          label,
          fontFamily: AppFonts.bold,
          fontSize: 18.0,
          color: AppColor.customWhite,
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
          hintText: hint,
          validator: validator,
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
            obscure: !signUpController.passwordVisible.value,
            validator: CommonLogics.passwordValidator,
            suffixIcon: GestureDetector(
              onTap: signUpController.changePasswordVisibility,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: CommonLogics.setPngImage(
                  signUpController.passwordVisible.value ? 'visibility' : 'visibility_off',
                  height: 24,
                  width: 24,
                  color: AppColor.grayMedium,
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  /// Builds the date and gender input fields.
  Widget _buildDateAndGenderFields(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildDateField(context)),
        const SizedBox(width: 18),
        Expanded(child: _buildGenderField()),
      ],
    );
  }

  /// Builds the date input field.
  Widget _buildDateField(BuildContext context) {
    return Column(
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
          hintText: LanguageString.selectDate.tr,
          readOnly: true,
          onTap: () => signUpController.onTapDate(context),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(18),
            child: CommonLogics.setSvgImage('down_arrow', height: 8, width: 14),
          ),
        ),
      ],
    );
  }

  /// Builds the gender input field.
  Widget _buildGenderField() {
    return Column(
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
            value: signUpController.selectedGender.value.isEmpty ? null : signUpController.selectedGender.value,
            hint: Text(
              LanguageString.selectGender.tr,
              style: const TextStyle(color: AppColor.customLightGray, fontSize: 14),
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.customWhiteOpacity,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none,
              ),
            ),
            items: <String>[LanguageString.male.tr, LanguageString.female.tr, LanguageString.other.tr].map((String gender) {
              return DropdownMenuItem<String>(
                value: gender,
                child: CommonLogics.commonText(gender, fontSize: 14.0, color: AppColor.customGray),
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
    );
  }

  /// Builds the creator check section.
  Widget _buildCreatorCheck() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonLogics.commonText(
          LanguageString.creatorCheck.tr,
          fontSize: 14.0,
          color: AppColor.customLightGray,
          fontFamily: AppFonts.medium,
        ),
        Row(
          children: [
            Obx(() {
              return Checkbox(
                value: signUpController.isChecked.value,
                side: const BorderSide(color: AppColor.customWhite),
                onChanged: (value) => signUpController.checkBoxTap(),
              );
            }),
            Expanded(
              child: CommonLogics.commonText(
                LanguageString.isCreatorOfColor.tr,
                fontFamily: AppFonts.regular,
                fontSize: 13.0,
                color: AppColor.customGray,
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Builds the next button.
  Widget _buildNextButton() {
    return Center(
      child: CustomButton(
        buttonName: CommonLogics.commonText(
            LanguageString.next.tr,
            fontSize: 18.0,
            fontFamily: AppFonts.bold) ,
        onPressed: (startLoading, stopLoading, btnState) {
          if (signUpController.signUpFormKey.currentState!.validate()) {
            startLoading();
            Future.delayed(const Duration(seconds: 2), () {
              stopLoading();
              Get.toNamed(AppRoutes.profilePicture);
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

  /// Builds the sign-in prompt.
  Widget _buildSignInPrompt() {
    return Center(
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
                onTap: () => Get.offAllNamed(AppRoutes.signIn),
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
    );
  }
}