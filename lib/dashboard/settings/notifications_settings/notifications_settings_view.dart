import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';
import 'package:nova_demo/common/common_logics.dart';
import 'package:nova_demo/common/language/language_string.dart';

class NotificationsSettingsView extends StatelessWidget {
  const NotificationsSettingsView({super.key});

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
                  /// A back button.
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: CommonLogics.setSvgImage('back_arrow_icon'),
                  ),
                  const Spacer(),
                  /// Title of the notification settings.
                  CommonLogics.commonText(
                    LanguageString.notificationSettings.tr,
                    fontSize: 24.0,
                    fontFamily: AppFonts.bold,
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 37),
              /// List of notification settings.
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            /// Displays the notification setting name.
                            CommonLogics.commonText(
                              LanguageString.commentReceived.tr,
                              fontFamily: AppFonts.medium,
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                            const Spacer(),
                            /// A switch to toggle the notification setting.
                            Switch(
                              value: true,
                              onChanged: (value) {},
                              activeColor: AppColor.customGreen,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        /// A divider between notification settings.
                        const Divider(
                          color: AppColor.lightGrey,
                          thickness: 1,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}