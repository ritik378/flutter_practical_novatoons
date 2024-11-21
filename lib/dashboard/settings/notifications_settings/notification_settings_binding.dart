import 'package:get/get.dart';
import 'package:nova_demo/dashboard/settings/notifications_settings/notifications_settings_controller.dart';

class NotificationSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => NotificationsSettingsController(),
    );
  }
}
