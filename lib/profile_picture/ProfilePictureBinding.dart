import 'package:get/get.dart';
import 'package:nova_demo/profile_picture/profile_picture_controller.dart';

class ProfilePictureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilePictureController>(() => ProfilePictureController());
  }
}