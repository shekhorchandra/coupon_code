import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../routes/app_routes.dart';
import '../../forget_auth_service/ForgetPasswordAuthService.dart';


class OtpController extends GetxController {
  final String email;
  OtpController(this.email);

  final otpController = TextEditingController();
  final isLoading = false.obs;

  String? token; // store token

  void verifyOtp() async {
    final otp = otpController.text.trim();

    if (otp.isEmpty) {
      Get.snackbar("Error", "Enter OTP");
      return;
    }

    isLoading.value = true;

    try {
      token = await AuthService.verifyOtp(email, otp);

      Get.snackbar("Success", "OTP Verified");

      // pass token to reset screen
      Get.toNamed(
        AppRoutes.RESET_PASSWORD,
        arguments: {"email": email, "token": token},
      );
    }  catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}