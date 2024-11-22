import 'package:get/get.dart';
import 'package:nova_demo/dashboard/home/detail/detail_controller.dart';

class DetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>DetailController());
  }

}