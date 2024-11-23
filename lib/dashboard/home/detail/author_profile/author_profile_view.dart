import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';
import 'package:nova_demo/common/common_logics.dart';
import 'package:nova_demo/common/custom_app_bar.dart';
import 'package:nova_demo/common/custom_button.dart';
import 'package:nova_demo/dashboard/common/rated_card.dart';
import 'package:nova_demo/dashboard/home/detail/author_profile/author_profile_controller.dart';

class AuthorProfileView extends StatelessWidget {
  AuthorProfileView({super.key});

  final AuthorProfileController authorProfileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColor.primaryColor,
      bottom: false,
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        appBar: CustomAppBar(
          title: 'Chris Evans',
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(15),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: CommonLogics.setSvgImage(
                'back_arrow_icon',
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              Row(
                children: [
                  CommonLogics.setPngImage('author_image',
                      height: 78, width: 78),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CommonLogics.commonText(
                        '''Political involvement in the dsvfsdvsdv
    Notifications in the fdfbvdffbs dgsdgdgvgdf dfdfdfvdfvdfv NotificationsPolitical involvement in the Notifications''',
                        fontSize: 13.0, fontFamily: AppFonts.regular),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                buttonName: CommonLogics.commonText("Donate",
                    fontFamily: AppFonts.bold, fontSize: 18.0),
                buttonHeight: 31,
                buttonWidth: 115,
                buttonBorderRadius: 62,
                onPressed: (startLoading, stopLoading, btnState) {},
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: AppColor.grayMedium,
                thickness: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              _buildCategoryList(),
              const SizedBox(
                height: 21,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 23.0,
                    mainAxisSpacing: 15,
                    mainAxisExtent: 175,
                  ),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 158,
                      decoration: BoxDecoration(
                        color: AppColor.softMintGreen,
                        borderRadius: BorderRadius.circular(23),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonLogics.setPngImage("captain_women",
                                height: 121, width: 150),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                CommonLogics.commonText(
                                  'Captain America',
                                  fontSize: 12.0,
                                  fontFamily: AppFonts.medium,
                                ),
                                const Spacer(),
                                CommonLogics.commonText(
                                  '\$10',
                                  fontSize: 10.0,
                                  fontFamily: AppFonts.medium,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                CommonLogics.setSvgImage('star'),
                                CommonLogics.commonText('4.6',
                                    fontSize: 10.0,
                                    fontFamily: AppFonts.regular),
                                const Spacer(),
                                CommonLogics.setSvgImage('green_tick'),
                              ],
                            )
                          ],
                        ),
                      ),
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

  //Build Category List
  Widget _buildCategoryList() {
    return Container(
      height: 28,
      decoration: BoxDecoration(
        color: AppColor.softMintGreen,
        borderRadius: BorderRadius.circular(14),
      ),
      child: GetBuilder<AuthorProfileController>(
        builder: (controller) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: authorProfileController.items.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => authorProfileController.onTapItem(index),
                child: Container(
                  height: 28,
                  width: 108,
                  decoration: BoxDecoration(
                    color:
                        authorProfileController.selectedItemIndex.value == index
                            ? AppColor.vibrantGreen
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: CommonLogics.commonText(
                      authorProfileController.items[index],
                      fontSize: 14.0,
                      color: authorProfileController.selectedItemIndex.value ==
                              index
                          ? AppColor.primaryColor
                          : AppColor.customWhite,
                      fontFamily: AppFonts.medium,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
