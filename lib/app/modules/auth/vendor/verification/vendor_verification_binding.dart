import 'package:coupon_code/app/modules/auth/vendor/verification/vendor_verification_controller.dart';
import 'package:get/get.dart';

class VendorVerificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VendorVerificationController>(
      () => VendorVerificationController(),
    );
  }
}
