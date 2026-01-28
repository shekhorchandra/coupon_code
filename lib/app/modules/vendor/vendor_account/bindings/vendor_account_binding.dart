import 'package:coupon_code/app/modules/vendor/vendor_account/controllers/create_vendor_account_controller.dart';
import 'package:get/get.dart';

class VendorAccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateVendorAccountController>(() => CreateVendorAccountController());
  }
}
