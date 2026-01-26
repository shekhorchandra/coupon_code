
import 'package:get/get.dart';

import 'user_signup_controller.dart';

class UserSignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserSignupController());
  }
}
