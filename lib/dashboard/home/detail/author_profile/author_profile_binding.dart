import 'package:get/get.dart';
import 'package:nova_demo/dashboard/home/detail/author_profile/author_profile_controller.dart';

class AuthorProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthorProfileController>(() => AuthorProfileController());
  }
}