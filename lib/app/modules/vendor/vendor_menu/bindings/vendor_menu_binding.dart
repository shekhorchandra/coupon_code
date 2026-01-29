import 'package:coupon_code/app/modules/vendor/vendor_menu/controllers/vendor_menu_controller.dart';
import 'package:get/get.dart';

class VendorMenuBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VendorMenuController>(() => VendorMenuController());
  }
}
