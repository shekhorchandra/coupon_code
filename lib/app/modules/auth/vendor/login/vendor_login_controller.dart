import 'package:get/get.dart';

class VendorLoginController extends GetxController {
  final obscure = true.obs;

  void togglePassword() {
    obscure.value = !obscure.value;
  }
}
