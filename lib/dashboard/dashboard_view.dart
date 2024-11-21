import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:ultimate_bottom_navbar/ultimate_bottom_navbar.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/dashboard/dashboard_controller.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});

  final dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColor.primaryColor,
      child: Obx(
        () => Scaffold(
          backgroundColor: AppColor.primaryColor,
          bottomNavigationBar: UltimateBottomNavBar(
            icons: dashboardController.icons,
            titles: dashboardController.titles,
            currentIndex: dashboardController.currentIndex.value,
            onTap: dashboardController.changeIndex,
          ),
          body:
              dashboardController.pages[dashboardController.currentIndex.value],
        ),
      ),
    );
  }
}
