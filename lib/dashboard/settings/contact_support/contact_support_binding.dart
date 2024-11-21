import 'package:get/get.dart';
import 'package:nova_demo/dashboard/settings/contact_support/contact_support_controller.dart';

class ContactSupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactSupportController>(() => ContactSupportController());
  }
}