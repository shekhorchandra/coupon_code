
import 'package:get/get.dart';

import 'vendor_login_controller.dart';

class VendorLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(VendorLoginController());
  }
}
