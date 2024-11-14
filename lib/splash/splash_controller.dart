import 'package:get/get.dart';
import 'package:nova_demo/navigation/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    navigation();
    super.onInit();
  }

  void navigation() {
    Future.delayed(const Duration(seconds: 1), () {
      Get.offNamed(AppRoutes.signIn);
    });
  }
}
