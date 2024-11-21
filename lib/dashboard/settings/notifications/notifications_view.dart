import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';
import 'package:nova_demo/common/common_logics.dart';
import 'package:nova_demo/common/language/language_string.dart';
import 'package:nova_demo/dashboard/settings/notifications/notification_controller.dart';

class NotificationsView extends StatelessWidget {
  NotificationsView({super.key});

  /// Controller to manage notification data.
  final NotificationController notificationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColor.primaryColor,
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 23),
              _buildSectionTitle(LanguageString.newText.tr),
              _buildNotificationList(notificationController.newNotification),
              const SizedBox(height: 18),
              _buildSectionTitle(LanguageString.thisWeek.tr),
              _buildNotificationList(notificationController.newNotification),
              const SizedBox(height: 18),
              _buildSectionTitle(LanguageString.thisMonth.tr),
              Expanded(
                child: _buildNotificationList(
                    notificationController.newNotification),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the header section with a back button and title.
  Widget _buildHeader() {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: CommonLogics.setSvgImage('back_arrow_icon'),
        ),
        const Spacer(),
        CommonLogics.commonText(
          LanguageString.notifications.tr,
          fontSize: 24.0,
          fontFamily: AppFonts.bold,
        ),
        const Spacer(),
      ],
    );
  }

  /// Builds a section title with the given [title].
  Widget _buildSectionTitle(String title) {
    return CommonLogics.commonText(
      title,
      fontFamily: AppFonts.medium,
      fontSize: 13.0,
    );
  }

  /// Builds a list of notifications.
  Widget _buildNotificationList(List<Widget> notifications) {
    return SizedBox(
      height: Get.height * 0.25,
      child: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              notifications[index],
              const SizedBox(height: 10),
              if (index != notifications.length - 1)
                const Divider(color: AppColor.customLightGray),
            ],
          );
        },
      ),
    );
  }
}
