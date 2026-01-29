import 'package:coupon_code/app/modules/vendor/vendor_deals/controllers/vendor_deals_controller.dart';
import 'package:get/get.dart';

class VendorDealsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VendorDealsController>(() => VendorDealsController());
  }
}
