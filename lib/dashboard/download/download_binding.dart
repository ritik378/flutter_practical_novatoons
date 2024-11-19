import 'package:get/get.dart';
import 'package:nova_demo/dashboard/download/download_controller.dart';

class DownloadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DownloadController>(
      () => DownloadController(),
    );
  }
}
