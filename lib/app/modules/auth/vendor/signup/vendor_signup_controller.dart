import 'package:get/get.dart';

class VendorSignupController extends GetxController {
  final obscurePassword = true.obs;
  final obscureConfirmPassword = true.obs;

  void togglePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleConfirmPassword() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }
}
