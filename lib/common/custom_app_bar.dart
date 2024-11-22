import 'package:flutter/material.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/app_fonts.dart';
import 'package:nova_demo/common/common_logics.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.titleSize = 24.0,
    this.titleFamily = AppFonts.bold,
    this.leading,
    this.centerTitle = false,
    this.actions,
    this.color = AppColor.primaryColor,
  });

  final String? title;
  final double titleSize;
  final String titleFamily;
  final Widget? leading;
  final bool centerTitle;
  final List<Widget>? actions;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: color,
      surfaceTintColor: color,
      leading: leading,

      actions:actions,
      title: CommonLogics.commonText(
        title ??'',
        fontSize: titleSize,
        fontFamily: titleFamily,
      ),
      centerTitle: centerTitle,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56.0);
}
