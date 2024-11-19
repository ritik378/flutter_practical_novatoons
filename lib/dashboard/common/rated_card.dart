import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';
import 'package:nova_demo/common/common_logics.dart';
import 'package:nova_demo/common/language/language_string.dart';

class RatedCard extends StatelessWidget {
   RatedCard({super.key,this.width=141});
  final double width;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(27),
            image: const DecorationImage(
              image: AssetImage(
                'assets/images/money_heist.png',

              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(27),
            gradient: AppColor.fadeToBlack,
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
                    LanguageString.thinkFrom.tr,
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
  }
}
