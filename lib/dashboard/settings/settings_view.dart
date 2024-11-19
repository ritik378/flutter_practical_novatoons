import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';
import 'package:nova_demo/common/common_logics.dart';
import 'package:nova_demo/common/language/language_string.dart';

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
                  CommonLogics.commonText(LanguageString.profile.tr,
                      fontSize: 24.0, fontFamily: AppFonts.bold),
                  const Spacer(),
                  CommonLogics.setSvgImage('notification_icon'),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: 100,
                // The width of the container (double the radius of the outer CircleAvatar)
                height: 100,
                // The height of the container (double the radius of the outer CircleAvatar)
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Ensure it's a circle
                  border: Border.all(
                      color: Colors.white,
                      width: 1), // White border around the red CircleAvatar
                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: CircleAvatar(
                    radius: 47,
                    backgroundImage: NetworkImage(
                        'https://preview.keenthemes.com/metronic-v4/theme_rtl/assets/pages/media/profile/profile_user.jpg'),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CommonLogics.commonText(LanguageString.profileName.tr,
                  fontSize: 24.0, fontFamily: AppFonts.medium),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: ListView(
                  children: [
                    item(image: 'my_info_icon', title: 'My Info'),
                    item(image: 'transactions', title: 'Transactions'),
                    item(image: 'privacy_policy_icon', title: 'Privacy Policy'),
                    item(image: 'notification_setting_icon', title: 'Notifications Settings '),
                    item(image: 'contact_support_icon', title: 'Contact Support'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget item({required String image, required String title}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[700],
          borderRadius: BorderRadius.circular(5),
        ),
        height: 47,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(11),
              child: CommonLogics.setSvgImage(image),
            ),
            CommonLogics.commonText(title,
                fontSize: 18.0, fontFamily: AppFonts.medium),
          ],
        ),
      ),
    );
  }
}
