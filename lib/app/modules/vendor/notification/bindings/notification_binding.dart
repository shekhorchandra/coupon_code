import 'package:coupon_code/app/modules/vendor/notification/controllers/notification_controller.dart';
import 'package:get/get.dart';

class NotificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(() => NotificationController());
  }
}
