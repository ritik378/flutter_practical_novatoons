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

  /// The controller for the favorite view, used to manage state and logic.
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
              CommonLogics.commonText(LanguageString.favorite.tr,
                  fontSize: 24.0),
              const SizedBox(height: 16),
              Expanded(
                child: GetBuilder<FavoriteController>(
                  builder: (controller) {
                    final itemList = favoriteController.favoriteList;
                    return ListView.builder(
                      itemCount: itemList.length,
                      itemBuilder: (context, index) {
                        final item = controller.favoriteList[index];
                        return Slidable(
                          endActionPane: ActionPane(
                            extentRatio: 0.25,
                            motion: const ScrollMotion(),
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 11),
                                  child: Container(
                                    color: AppColor.customRed,
                                    height: 80,
                                    child: IconButton(
                                      onPressed: () {
                                        controller.removeItem(index);
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        size: 35,
                                        color: AppColor.customWhite,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          child: item,
                        );
                      },
                    );
                  },
                ),
              ),
              GetBuilder<FavoriteController>(
                builder: (controller) {
                  return TextButton(
                    onPressed: () {
                      controller.addItem();
                    },
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
