
import 'package:get/get.dart';

import 'vendor_signup_controller.dart';

class VendorSignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(VendorSignupController());
  }
}
