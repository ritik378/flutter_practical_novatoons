import 'package:get/get.dart';
import 'package:nova_demo/dashboard/dashboad_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}