import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nova_demo/common/app_color.dart';
import 'package:nova_demo/common/common_logics.dart';
import 'package:nova_demo/splash/splash_controller.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});
  final SplashController splashController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child:
          CommonLogics.setPngImage('novatoons', height: 118, width: 216),
      ),
    );
  }
}
