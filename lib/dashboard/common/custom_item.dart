import 'package:flutter/material.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';
import 'package:nova_demo/common/common_logics.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({
    super.key,
    this.height = 84,
    this.color = AppColor.customGray,
    this.borderRadius = 22,
    required this.leadingImage,
    this.leadingImageHeight = 64,
    this.leadingImageWidth = 83,
    this.title,
    this.subtitle,
    this.suffix,
    this.suffixHeight = 17,
    this.suffixWidth = 19,
    this.price='',
  });

  final double height;
  final Color color;
  final double borderRadius;
  final String leadingImage;
  final double leadingImageWidth;
  final double leadingImageHeight;
  final String? title;
  final String? subtitle;
  final String? suffix;
  final double suffixWidth;
  final double suffixHeight;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              CommonLogics.setPngImage(leadingImage,
                  height: leadingImageHeight, width: leadingImageWidth),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonLogics.commonText(title ?? '',
                            fontFamily: AppFonts.medium, fontSize: 16.0),
                        CommonLogics.setSvgImage(
                          suffix??'',
                          width:suffixWidth,
                          height:suffixHeight,
                        )
                      ],
                    ),
                    CommonLogics.commonText(subtitle ?? '',
                        fontFamily: AppFonts.medium, fontSize: 13.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonLogics.setPngImage('given_ratings',
                            width: 78, height: 12),
                        CommonLogics.commonText('\$$price',fontSize: 14.0,fontFamily: AppFonts.medium),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
