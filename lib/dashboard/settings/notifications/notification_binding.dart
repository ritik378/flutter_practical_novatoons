import 'package:get/get.dart';
import 'package:nova_demo/dashboard/settings/notifications/notification_controller.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController());
  }
}
