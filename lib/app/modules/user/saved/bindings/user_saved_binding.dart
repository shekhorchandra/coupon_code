import 'package:coupon_code/app/modules/vendor/vendor_menu/controllers/vendor_menu_controller.dart';
import 'package:get/get.dart';

import '../controllers/save_controller.dart';

class UserMenuBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SavesController>(() => SavesController());
  }
}
