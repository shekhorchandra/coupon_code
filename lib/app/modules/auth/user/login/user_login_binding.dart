
import 'package:get/get.dart';

import 'user_login_controller.dart';

class UserLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserLoginController());
  }
}
