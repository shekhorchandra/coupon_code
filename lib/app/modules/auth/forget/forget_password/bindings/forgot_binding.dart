import 'package:get/get.dart';
import '../controllers/forgot_controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    final role = Get.arguments as UserRole? ?? UserRole.user;
    Get.put(ForgotPasswordController(role));
  }
}
