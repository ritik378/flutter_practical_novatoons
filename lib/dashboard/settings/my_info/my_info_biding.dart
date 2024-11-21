import 'package:get/get.dart';
import 'package:nova_demo/dashboard/settings/my_info/my_info_controller.dart';

class MyInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyInfoController>(() => MyInfoController());
  }
}