import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nova_demo/common/app_keys.dart';
import 'package:nova_demo/navigation/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    navigation();
    super.onInit();
  }

  /// Navigates to the appropriate screen based on the login status.
  void navigation() {
    Future.delayed(const Duration(seconds: 1), () {
      final isLogin = GetStorage().read(AppKeys.isLogin);
      if (isLogin == null || isLogin == false) {
        Get.offNamed(AppRoutes.signIn);
      } else {
        Get.offNamed(AppRoutes.dashboard);
      }
    });
  }
}