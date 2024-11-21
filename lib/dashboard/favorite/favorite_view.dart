import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';
import 'package:nova_demo/common/common_logics.dart';
import 'package:nova_demo/common/language/language_string.dart';
import 'package:nova_demo/dashboard/favorite/favorite_controller.dart';

class FavoriteView extends StatelessWidget {
  FavoriteView({super.key});

  /// The controller for managing the favorite view logic.
  final FavoriteController favoriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColor.primaryColor,
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 34.0),
              /// Displays the "Favorite" text.
              CommonLogics.commonText(LanguageString.favorite.tr, fontSize: 24.0),
              const SizedBox(height: 16),
              /// Displays the list of favorite items.
              Expanded(
                child: GetBuilder<FavoriteController>(
                  builder: (controller) {
                    return ListView.builder(
                      itemCount: controller.favoriteList.length,
                      itemBuilder: (context, index) {
                        return Slidable(
                          endActionPane: ActionPane(
                            extentRatio: 0.25,
                            motion: const ScrollMotion(),
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 11),
                                child: Container(
                                  color: AppColor.customRed,
                                  height: 80,
                                  child: IconButton(
                                    onPressed: () => controller.removeItem(index),
                                    icon: const Icon(
                                      Icons.delete,
                                      size: 35,
                                      color: AppColor.customWhite,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          child: controller.favoriteList[index],
                        );
                      },
                    );
                  },
                ),
              ),
              /// Displays a button to add a new item to the favorite list.
              GetBuilder<FavoriteController>(
                builder: (controller) {
                  return TextButton(
                    onPressed: controller.addItem,
                    child: CommonLogics.commonText(
                      'Add Item',
                      fontSize: 18.0,
                      color: AppColor.customWhite,
                      fontFamily: AppFonts.bold,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}