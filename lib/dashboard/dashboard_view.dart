import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/dashboard/dashboad_controller.dart';
import 'package:ultimate_bottom_navbar/ultimate_bottom_navbar.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});

  final DashboardController dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColor.primaryColor,
      child: Obx(() {
        return Scaffold(
          backgroundColor: AppColor.primaryColor,
          bottomNavigationBar: UltimateBottomNavBar(
            icons: dashboardController.icons,
            titles: dashboardController.titles,
            currentIndex: dashboardController.currentIndex.value,
            onTap: (int index) {
              dashboardController.changeIndex(index);
            },
          ),
          body: dashboardController.pages[dashboardController.currentIndex.value],
        );
      }),
    );
  }
}