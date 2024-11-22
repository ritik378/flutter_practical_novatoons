import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';
import 'package:nova_demo/common/app_keys.dart';
import 'package:nova_demo/common/common_logics.dart';
import 'package:nova_demo/common/custom_button.dart';
import 'package:nova_demo/common/language/language_string.dart';
import 'package:nova_demo/navigation/app_routes.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColor.primaryColor,
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              Row(
                children: [
                  /// Displays the profile title.
                  CommonLogics.commonText(
                    LanguageString.profile.tr,
                    fontSize: 24.0,
                    fontFamily: AppFonts.bold,
                  ),
                  const Spacer(),

                  /// Displays the notification icon.
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.notifications);
                      },
                      child: CommonLogics.setSvgImage('notification_icon')),
                ],
              ),
              const SizedBox(height: 25),

              /// Displays the user's profile picture.
              Container(
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
                      'https://preview.keenthemes.com/metronic-v4/theme_rtl/assets/pages/media/profile/profile_user.jpg',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              /// Displays the user's profile name.
              CommonLogics.commonText(
                LanguageString.profileName.tr,
                fontSize: 24.0,
                fontFamily: AppFonts.medium,
              ),
              const SizedBox(height: 25),

              /// Displays the list of settings options.
              Expanded(
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildItem(
                      image: 'my_info_icon',
                      title: 'My Info',
                      onTap: () => Get.toNamed(AppRoutes.myInfo),
                    ),
                    _buildItem(
                      image: 'transactions',
                      title: 'Transactions',
                      suffix: CustomButton(
                        buttonName: CommonLogics.commonText(
                            LanguageString.transactionsAmt.tr,
                            fontSize: 18.0,
                            fontFamily: AppFonts.bold),
                        buttonHeight: 74,
                        buttonWidth: 74,
                        onPressed: (startLoading, stopLoading, btnState) {},
                      ),
                      onTap: () => Get.toNamed(AppRoutes.transactions),
                    ),
                    _buildItem(
                      image: 'privacy_policy_icon',
                      title: 'Privacy Policy',
                      onTap: _launchUrl,
                    ),
                    _buildItem(
                      image: 'notification_setting_icon',
                      title: 'Notifications Settings',
                      onTap: () => Get.toNamed(AppRoutes.notificationsSettings),
                    ),
                    _buildItem(
                      image: 'contact_support_icon',
                      title: 'Contact Support',
                      onTap: () => Get.toNamed(AppRoutes.contactSupport),
                    ),
                  ],
                ),
              ),

              /// Displays the sign-out button.
              CustomButton(
                buttonName: CommonLogics.commonText(
                    LanguageString.signOut.tr,
                    fontSize: 18.0,
                    fontFamily: AppFonts.bold) ,
                onPressed: (startLoading, stopLoading, btnState) {
                  GetStorage().write(AppKeys.isLogin, false);
                  Get.offAllNamed(AppRoutes.signIn);
                },
              ),
              const SizedBox(height: 53),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds a settings item widget.
  Widget _buildItem({
    required String image,
    required String title,
    Widget? suffix,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[700],
            borderRadius: BorderRadius.circular(5),
          ),
          height: 47,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                CommonLogics.setSvgImage(image),
                const SizedBox(width: 10),
                CommonLogics.commonText(
                  title,
                  fontSize: 18.0,
                  fontFamily: AppFonts.medium,
                ),
                const Spacer(),
                suffix ?? const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Launches a URL in the default browser.
  Future<void> _launchUrl() async {
    final url = Uri.parse('https://flutter.dev/');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
