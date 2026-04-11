import 'package:coupon_code/app/modules/vendor/vendor_navigation_bar/controllers/vendor_navigation_bar_controller.dart';
import 'package:get/get.dart';

class VendorNavigationBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VendorNavigationBarController());
  }
}
