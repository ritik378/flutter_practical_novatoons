import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';
import 'package:nova_demo/common/common_logics.dart';
import 'package:nova_demo/dashboard/home/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColor.primaryColor,
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SingleChildScrollView(
            child: Column(
              children: [
                /// A row containing a greeting text and two icons.
                Row(
                  children: [
                    CommonLogics.commonText('Hi, Joe',
                        fontSize: 24.0, fontFamily: AppFonts.bold),
                    const Spacer(),
                    CommonLogics.setSvgImage('search_icon'),
                    const SizedBox(
                      width: 14,
                    ),
                    CommonLogics.setSvgImage('discussion_icon'),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 28,
                  decoration: BoxDecoration(
                    color: AppColor.softMintGreen,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: GetBuilder<HomeController>(
                    builder: (controller) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeController.items.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              homeController.onTapItem(index);
                            },
                            child: Container(
                              height: 28,
                              width: 108,
                              decoration: BoxDecoration(
                                color: homeController.selectedItemIndex.value ==
                                        index
                                    ? AppColor.vibrantGreen
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Center(
                                child: CommonLogics.commonText(
                                  homeController.items[index],
                                  fontSize: 14.0,
                                  color:
                                      homeController.selectedItemIndex.value ==
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
                ),
                const SizedBox(height: 20),

                /// A container with an image and a rating.
                Container(
                  height: 248,
                  decoration: BoxDecoration(
                    color: AppColor.softMintGreen,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 204,
                          decoration: BoxDecoration(
                            color: AppColor.customWhite,
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              image:
                                  AssetImage('assets/images/super_america.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              CommonLogics.commonText('Super America',
                                  fontFamily: AppFonts.bold, fontSize: 18.0),
                              const Spacer(),
                              CommonLogics.setSvgImage('star'),
                              CommonLogics.commonText('4.5',
                                  fontFamily: AppFonts.medium, fontSize: 14.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                /// A row containing a title and a "Show More" text.
                Row(
                  children: [
                    CommonLogics.commonText('Featured',
                        fontFamily: AppFonts.bold, fontSize: 21.0),
                    const Spacer(),
                    CommonLogics.commonText('Show More',
                        fontFamily: AppFonts.regular, fontSize: 12.0),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 208,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Container(
                              width: 141,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(27),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/images/money_heist.png',
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Container(
                              width: 141,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(27),
                                gradient: AppColor.fadeToBlack,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 10,
                            bottom: 11,
                            child: SizedBox(
                              width: 88,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonLogics.commonText(
                                      'The Think From Another World',
                                      color: AppColor.customWhite,
                                      fontFamily: AppFonts.bold,
                                      fontSize: 12.0),
                                  RatingBar.builder(
                                    unratedColor: AppColor.customGray,
                                    itemBuilder: (context, index) {
                                      return const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      );
                                    },
                                    initialRating: 1,
                                    itemSize: 16,
                                    allowHalfRating: true,
                                    onRatingUpdate: (rating) {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonLogics.setPngImage('banner', height: 55),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    CommonLogics.commonText('You may like',
                        fontFamily: AppFonts.bold,
                        fontSize: 21.0,
                        color: AppColor.customWhite),
                    const Spacer(),
                    CommonLogics.commonText('Show More',
                        fontFamily: AppFonts.regular,
                        fontSize: 12.0,
                        color: AppColor.customWhite),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 15.0,
                    mainAxisExtent: 200,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: const DecorationImage(
                                image:
                                    AssetImage('assets/images/money_heist.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            CommonLogics.commonText('Captain Marvel',
                                fontFamily: AppFonts.medium,
                                fontSize: 14.0,
                                color: AppColor.customWhite),
                            const Spacer(),
                            CommonLogics.setSvgImage('star'),
                            CommonLogics.commonText('4.5',
                                fontFamily: AppFonts.medium,
                                fontSize: 14.0,
                                color: AppColor.customWhite),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    CommonLogics.commonText('Popular',
                        fontFamily: AppFonts.bold,
                        fontSize: 21.0,
                        color: AppColor.customWhite),
                    const Spacer(),
                    CommonLogics.commonText('Show More',
                        fontFamily: AppFonts.regular,
                        fontSize: 12.0,
                        color: AppColor.customWhite),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 208,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Container(
                              width: 141,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(27),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/images/money_heist.png',
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Container(
                              width: 141,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(27),
                                gradient: AppColor.fadeToBlack,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 10,
                            bottom: 11,
                            child: SizedBox(
                              width: 88,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonLogics.commonText(
                                      'The Think From Another World',
                                      color: AppColor.customWhite,
                                      fontFamily: AppFonts.bold,
                                      fontSize: 12.0),
                                  RatingBar.builder(
                                    unratedColor: AppColor.customGray,
                                    itemBuilder: (context, index) {
                                      return const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      );
                                    },
                                    initialRating: 1,
                                    itemSize: 16,
                                    allowHalfRating: true,
                                    onRatingUpdate: (rating) {},
                                  ),
                                ],
                              ),
                            ),
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
      ),
    );
  }
}
