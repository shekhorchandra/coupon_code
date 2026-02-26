import 'package:get/get.dart';
import '../controllers/otp_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    final email = Get.arguments as String;
    Get.put(OtpController(email));
  }
}