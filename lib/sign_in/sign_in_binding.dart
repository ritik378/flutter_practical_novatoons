import 'package:get/get.dart';
import 'package:nova_demo/sign_in/sign_in_controller.dart';

class SingInBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
  }

}
